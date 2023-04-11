<?php
  include "init_db.php";

  $queries = array();
  parse_str($_SERVER['QUERY_STRING'], $queries);
  $name = $queries["name"];
  $phone_number = $queries["phone-number"];

  $r = mysqli_query($db, "SELECT e.`First Name`, e.`Last Name`, ed.`Start Date`, e.`Birth Date`, e.`Medicare Number`, e.`Phone Number`, e.Address, pc.City, pc.Province, e.`Postal Code`, e.Citizenship, e.Email  
	FROM Facility f
	JOIN Employed ed ON ed.`Facility Name` = f.Name AND ed.`Facility Phone Number` = f.`Phone Number`
	JOIN Employee e ON e.`Medicare Number` = ed.`Medicare Number`
	JOIN PostalCode pc ON pc.`Postal Code` = e.`Postal Code`
  GROUP BY e.`Medicare Number`
	WHERE f.Name = $name AND f.`Phone Number` = $phone_number AND ed.`End Date` IS NULL 
	ORDER BY e.`Role`, e.`First Name`, e.`Last Name` ASC;");  
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <link href='https://fonts.googleapis.com/css?family=Roboto:300' rel='stylesheet' type='text/css'>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <link rel="stylesheet" type="text/css" href="normalize.css" />
  <link rel="stylesheet" type="text/css" href="index.css" />

  <title>Facility Employees</title>
</head>

<body>
  <div class="container-parent">
    <div class="container">
      <h1 style="margin-bottom:12px;">
        Employees currently working at a specific facility (7)
      </h1>
      <div style="font-size:20px">
        <?php
        echo("Name: ".$name.", Phone Number: ".$phone_number);
        ?>
      </div>

      <table border='1'>
      <tr>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Start Date</th>
        <th>Birth Date</th>
        <th>Medicare Number</th>
        <th>Phone Number</th>
        <th>Address</th>
        <th>City</th>
        <th>Province</th>
        <th>Postal Code</th>
        <th>Citizenship</th>
        <th>Email</th>
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
        ."<td>".$assoc["Medicare Number"]."</td>"
        ."<td>".$assoc["Phone Number"]."</td>"
        ."<td>".$assoc["Address"]."</td>"
        ."<td>".$assoc["City"]."</td>"
        ."<td>".$assoc["Province"]."</td>"
        ."<td>".$assoc["Postal Code"]."</td>"
        ."<td>".$assoc["Citizenship"]."</td>"
        ."<td>".$assoc["Email"]."</td></tr>");
      }
      ?>  
      </table>
    </div>
  </div>
</body>

</html>