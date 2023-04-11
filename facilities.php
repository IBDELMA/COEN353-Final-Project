<?php
  include "init_db.php";
  $r = mysqli_query($db, "SELECT f.Name, f.Address, pc.City, pc.Province, f.`Postal Code`, f.`Phone Number`, f.`Web Address`, f.`Type`, f.Capacity, CONCAT(e.`First Name`, ' ', e.`Last Name`) AS `General Manager Name`, COUNT(*) AS `Number of Current Employees`  
	FROM Facility f
	JOIN Employee e ON e.`Medicare Number` = f.`Manager Medicare Number`
	JOIN PostalCode pc ON pc.`Postal Code` = f.`Postal Code`
	JOIN Employed ed ON ed.`Facility Name` = f.Name AND ed.`Facility Phone Number` = f.`Phone Number`
	WHERE ed.`End Date` IS NULL
	GROUP BY f.Name, f.`Phone Number` 
	ORDER BY pc.Province, pc.City, f.`Type`, `Number of Current Employees` ASC;");  
  if(is_bool($r) && !$r) {
    echo("Query error: ".$db -> error);
  }
  // Name, `Phone_Number`, Address, `Postal_Code`, Capacity, `Type`, `Web_Address`, `Manager_Medicare_Number`
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <link href='https://fonts.googleapis.com/css?family=Roboto:300' rel='stylesheet' type='text/css'>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <link rel="stylesheet" type="text/css" href="normalize.css" />
  <link rel="stylesheet" type="text/css" href="index.css" />

  <title>Facilities</title>
</head>

<body>
  <div class="container-parent">
    <div class="container">
      <h1 style="margin-bottom:12px;">
        Facilities (1&6)
      </h1>
      <table border='1'>
      <tr>
        <th>Name</th>
        <th>City</th>
        <th>Province</th>
        <th>Postal Code</th>
        <th>Phone Number</th>
        <th>Web Address</th>
        <th>Type</th>
        <th>Capacity</th>
        <th>General Manager Name</th>
        <th>Number of Current Employees</th>
      </tr>
      <?php
      while(true) {
        $assoc = mysqli_fetch_assoc($r);
        if($assoc == null) {
          break;
        }
        echo("<tr><td>".$assoc["Name"]."</td>"
        ."<td>".$assoc["City"]."</td>"
        ."<td>".$assoc["Province"]."</td>"
        ."<td>".$assoc["Postal Code"]."</td>"
        ."<td>".$assoc["Phone Number"]."</td>"
        ."<td>".$assoc["Web Address"]."</td>"
        ."<td>".$assoc["Type"]."</td>"
        ."<td>".$assoc["Capacity"]."</td>"
        ."<td>".$assoc["General Manager Name"]."</td>"
        ."<td>".$assoc["Number of Current Employees"]."</td></tr>");
      }
      ?>  
      </table>
    </div>
  </div>
</body>

</html>