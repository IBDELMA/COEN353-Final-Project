<?php
  include "init_db.php";
  
  $r = mysqli_query($db, "SELECT e.`First Name`, e.`Last Name`, e.`Email`, e.`Address`, ed.`Start Date`, e.`Birth Date`, SUM(TIMESTAMPDIFF(Hour, s.`Start Time`, s.`End Time`)) as Hours
	FROM Employee e
  JOIN Employed ed ON ed.`Medicare Number` = e.`Medicare Number`
  JOIN Scheduled s ON s.`Employee Medicare Number` = e.`Medicare Number`
	WHERE (e.`Role` = 'Doctor' OR e.`Role` = 'Nurse') AND e.`Medicare Number` NOT IN (SELECT `Employee Medicare Number` FROM Infection WHERE `Type` = 'COVID-19')
  GROUP BY e.`Medicare Number`
	ORDER BY e.`Role`, e.`First Name`, e.`Last Name` ASC");
  if(is_bool($r) && !$r) {
    echo("Query error: ".$db -> error);
  }
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <link href='https://fonts.googleapis.com/css?family=Roboto:300' rel='stylesheet' type='text/css'>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <link rel="stylesheet" type="text/css" href="normalize.css" />
  <link rel="stylesheet" type="text/css" href="index.css" />

  <title>Never Infected</title>
</head>

<body>
  <div class="container-parent">
    <div class="container">
      <h1 style="margin-bottom:12px;">
        Never infected nurses/doctors (17)
      </h1>

      <table border='1'>
      <tr>
        <th>First Name</th>
        <th>Last Name</th>
        <th>First Day Of Work</th>
        <th>Date Of Birth</th>
        <th>Email</th>
        <th>Address</th>
        <th>Hours Scheduled</th>
      </tr>
      <?php
      while(true) {
        $assoc = mysqli_fetch_assoc($r);
        if($assoc == null) {
          break;
        }
        echo("<tr><td>".$assoc["First Name"]."</td>"
        ."<td>".$assoc["Last Name"]."</td>"
        ."<td>".$assoc["Start Date"]."</td>"
        ."<td>".$assoc["Birth Date"]."</td>"
        ."<td>".$assoc["Email"]."</td>"
        ."<td>".$assoc["Address"]."</td>"
        ."<td>".$assoc["Hours"]."</td></tr>");
      }
      ?>  
      </table>
    </div>
  </div>
</body>

</html>