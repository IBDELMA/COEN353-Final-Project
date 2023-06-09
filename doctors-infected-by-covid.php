<?php
  include "init_db.php";

  $r = mysqli_query($db, "SELECT e.`First Name`,  e.`Last Name`, i.`Date`, ed.`Facility Name`, i.`Type`
	FROM Employee e
	JOIN Employed ed ON ed.`Medicare Number` = e.`Medicare Number`
	JOIN Infection i ON i.`Employee Medicare Number` = e.`Medicare Number`
	WHERE e.`Role` = 'Doctor' AND i.`Date` >= DATE_ADD(current_date(), INTERVAL -2 week) AND i.`Type` = 'COVID-19'
	ORDER BY ed.`Facility Name` ASC;");
  if(is_bool($r) && !$r) {
    echo("Query error: ".$db -> error);
  }
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <link href='https://fonts.googleapis.com/css?family=Roboto:300' rel='stylesheet' type='text/css'>
  <script src="jquery-3.6.3.min.js"></script>
  <link rel="stylesheet" type="text/css" href="normalize.css" />
  <link rel="stylesheet" type="text/css" href="index.css" />

  <title>Doctors Infected by COVID</title>
</head>

<body>
  <div class="container-parent">
    <div class="container">
      <h1 style="margin-bottom:12px;">
        Doctors infected by COVID (9)
      </h1>
      <table border='1'>
      <tr>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Date</th>
        <th>Type</th>
        <th>Facility</th>
      </tr>
      <?php
      while(true) {
        $assoc = mysqli_fetch_assoc($r);
        if($assoc == null) {
          break;
        }
        echo("<tr><td>".$assoc["First Name"]."</td>"
        ."<td>".$assoc["Last Name"]."</td>"
        ."<td>".$assoc["Date"]."</td>"
        ."<td>".$assoc["Type"]."</td>"
        ."<td>".$assoc["Facility Name"]."</td></tr>");
      }
      ?>  
      </table>
    </div>
  </div>
</body>

</html>