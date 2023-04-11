<?php
  include "init_db.php";

  $r = mysqli_query($db, "SELECT e.`First Name`, e.`Last Name`, ed.`Start Date`, e.`Role`, e.`Birth Date`, e.`Email`, SUM(TIMESTAMPDIFF(Hour, s.`Start Time`, s.`End Time`)) as Hours
	FROM Employee e
  JOIN Employed ed ON ed.`Medicare Number` = e.`Medicare Number`
	JOIN Scheduled s ON s.`Employee Medicare Number` = e.`Medicare Number`
  JOIN Infection i ON i.`Medicare Number` = e.`Employee Medicare Number`
	WHERE (e.`Role` = 'Doctor' OR e.`Role` = 'Nurse') AND  (SELECT `Employee Medicare Number` FROM Infection WHERE `Type` = 'COVID-19')
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

  <title>Triply Infected</title>
</head>

<body>
  <div class="container-parent">
    <div class="container">
      <h1 style="margin-bottom:12px;">
        Triply infected nurses/doctors (16)
      </h1>
    </div>
  </div>
</body>

</html>