<?php
  include "init_db.php";

  $r = mysqli_query($db, "SELECT e.`First Name`, e.`Last Name`, ed.`Start Date`, e.`Birth Date`, e.`Email`, SUM(TIMESTAMPDIFF(Hour, s.`Start Time`, s.`End Time`)) as Hours
	FROM Employee e
  JOIN Employed ed ON e.`Medicare Number` = ed.`Medicare Number`
  JOIN Scheduled s ON s.`Employee Medicare Number` = e.`Medicare Number`
	WHERE e.`Role` = 'Nurse' AND (SELECT SUM(TIMESTAMPDIFF(Hour, s.`Start Time`, s.`End Time`)) FROM Scheduled s WHERE s.`Employee Medicare Number` = e.`Medicare Number` GROUP BY s.`Employee Medicare Number`)
  GROUP BY e.`Medicare Number`");
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

  <title>Doctors</title>
</head>

<body>
  <div class="container-parent">
    <div class="container">
      <h1 style="margin-bottom:12px;">
        Nurses (15)
      </h1>
      <table border='1'>
      <tr>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Start Date</th>
        <th>Birth Date</th>
        <th>Email</th>
        <th>Hours</th>
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
        ."<td>".$assoc["Hours"]."</td></tr>");
      }
      ?>  
      </table>
    </div>
  </div>
</body>

</html>