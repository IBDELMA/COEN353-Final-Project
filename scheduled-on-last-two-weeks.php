<?php
  include "init_db.php";

  $queries = array();
  parse_str($_SERVER['QUERY_STRING'], $queries);
  $name = $queries["name"];
  
  $r = mysqli_query($db, "SELECT e.`First Name`, e.`Last Name`, e.`Role`
	FROM Employee e
	JOIN Scheduled s ON s.`Employee Medicare Number` = e.`Medicare Number`
  GROUP BY e.`Medicare Number`
	WHERE s.`Start Time` <= DATEADD(week, -2, GETDATE()) AND (e.`Role` = `Doctor` OR e.`Role` = 'Nurse') AND s.`Facility Name` = $name
	ORDER BY e.`First Name` ASC");
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <link href='https://fonts.googleapis.com/css?family=Roboto:300' rel='stylesheet' type='text/css'>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <link rel="stylesheet" type="text/css" href="normalize.css" />
  <link rel="stylesheet" type="text/css" href="index.css" />

  <title>Scheduled on last two weeks</title>
</head>

<body>
  <div class="container-parent">
    <div class="container">
      <h1 style="margin-bottom:12px;">
        Doctors/Nurses on schedule in last two weeks (11)
      </h1>
      <div style="font-size:20px">
        <?php
        echo("Name: ".$name);
        ?>
      </div>
      <table border='1'>
      <tr>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Role</th>
      </tr>
      <?php
      while(true) {
        $assoc = mysqli_fetch_assoc($r);
        if($assoc == null) {
          break;
        }
        echo("<tr><td>".$assoc["First Name"]."</td>"
        ."<td>".$assoc["Last Name"]."</td>"
        ."<td>".$assoc["Role"]."</td></tr>");
      }
      ?>  
      </table>
    </div>
  </div>
</body>

</html>