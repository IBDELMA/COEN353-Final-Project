<?php
  include "init_db.php";

  $queries = array();
  parse_str($_SERVER['QUERY_STRING'], $queries);
  $medicare_number = $queries["medicare-number"];

  $r = mysqli_query($db, "SELECT s.`Facility Name`, DAYOFYEAR(s.`Date`) as `Day of Year` , s.`Start Time`, s.`End Time`
	FROM Employee e
	JOIN Scheduled s ON s.`Employee Medicare Number` = e.`Medicare Number`
  WHERE e.`Medicare Number` = '$medicare_number'
	ORDER BY s.`Facility Name`, DAY(s.`Start Time`), s.`Start Time` ASC");
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

  <title>Schedules of Employee</title>
</head>

<body>
  <div class="container-parent">
    <div class="container">
      <h1 style="margin-bottom:12px;">
      Schedules of employee (5&8)
      </h1>
      <div style="font-size:20px">
        <?php
        echo("Medicare #: ".$medicare_number);
        ?>
      </div>

      <table border='1'>
      <tr>
        <th>Facility Name</th>
        <th>Day of Year</th>
        <th>Start Time</th>
        <th>End Time</th>
      </tr>
      <?php
      while(true) {
        $assoc = mysqli_fetch_assoc($r);
        if($assoc == null) {
          break;
        }
        echo("<tr><td>".$assoc["Facility Name"]."</td>"
        ."<td>".$assoc["Day of Year"]."</td>"
        ."<td>".$assoc["Start Time"]."</td>"
        ."<td>".$assoc["End Time"]."</td></tr>");
      }
      ?>  
      </table>
    </div>
  </div>
</body>

</html>