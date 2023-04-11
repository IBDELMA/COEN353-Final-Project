<?php
  include "init_db.php";

  $queries = array();
  parse_str($_SERVER['QUERY_STRING'], $queries);
  // $name = $queries["name"];
  // $phone_number = $queries["phone-number"];

  $r = mysqli_query($db, "SELECT f.`Name`, pc.`Province`, f.`Capacity`, COUNT(*) as `Employees with COVID`
	FROM Facility f
	JOIN Employed ed ON ed.`Facility Name` = f.Name AND ed.`Facility Phone Number` = f.`Phone Number`
	JOIN Employee e ON e.`Medicare Number` = ed.`Medicare Number`
	JOIN PostalCode pc ON pc.`Postal Code` = e.`Postal Code`
	JOIN Infection i ON i.`Employee Medicare Number` = e.`Medicare Number`
  WHERE i.`Date` >= DATE_ADD(current_date(), INTERVAL -2 week)
  GROUP BY f.`Phone Number`, f.Name
	ORDER BY e.`Role`, e.`First Name`, e.`Last Name` ASC;");  
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

  <title>Facility Infections</title>
</head>

<body>
  <div class="container-parent">
    <div class="container">
      <h1 style="margin-bottom:12px;">
        Facility Infections(13)
      </h1>
      <!-- <div style="font-size:20px">
        <?php
        echo("Name: ".$name.", Phone Number: ".$phone_number);
        ?>
      </div> -->

      <table border='1'>
      <tr>
        <th>Name</th>
        <th>Province</th>
        <th>Capacity</th>
        <th>Employees with COVID</th>
      </tr>
      <?php
      while(true) {
        $assoc = mysqli_fetch_assoc($r);
        if($assoc == null) {
          break;
        }
        echo("<tr><td>".$assoc["Name"]."</td>"
        ."<td>".$assoc["Province"]."</td>"
        ."<td>".$assoc["Capacity"]."</td>"
        ."<td>".$assoc["Employees with COVID"]."</td></tr>");
      }
      ?>  
      </table>
    </div>
  </div>
</body>

</html>