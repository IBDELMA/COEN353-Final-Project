<?php
  include "init_db.php";

  $queries = array();
  parse_str($_SERVER['QUERY_STRING'], $queries);
  $name = $queries["name"];
  $phone_number = $queries["phone-number"];

  $r = mysqli_query($db, "SELECT e.`Role`, SUM(TIMESTAMPDIFF(Hour, s.`Start Time`, s.`End Time`)) as Hours
	FROM Employee e
	JOIN Scheduled s ON s.`Employee Medicare Number` = e.`Medicare Number`
  GROUP BY e.`Role`
  WHERE s.`Facility Name` = $name AND s.`Facility Phone Number` = $phone_number
	ORDER BY e.`Role` ASC");
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <link href='https://fonts.googleapis.com/css?family=Roboto:300' rel='stylesheet' type='text/css'>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <link rel="stylesheet" type="text/css" href="normalize.css" />
  <link rel="stylesheet" type="text/css" href="index.css" />

  <title>Scheduled Role Hours</title>
</head>

<body>
  <div class="container-parent">
    <div class="container">
      <h1 style="margin-bottom:12px;">
        Hours scheduled by roles (12)
      </h1>
      <div style="font-size:20px">
        <?php
        echo("Name: ".$name.", Phone Number: ".$phone_number);
        ?>
      </div>

      <table border='1'>
      <tr>
        <th>Role</th>
        <th>Hours</th>
      </tr>
      <?php
      while(true) {
        $assoc = mysqli_fetch_assoc($r);
        if($assoc == null) {
          break;
        }
        echo("<tr><td>".$assoc["Role"]."</td>"
        ."<td>".$assoc["Hours"]."</td></tr>");
      }
      ?>  
      </table>
    </div>
  </div>
</body>

</html>