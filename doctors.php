<?php
  include "init_db.php";

  $r = mysqli_query($db, "SELECT e.`First Name`, e.`Last Name`, pe.`City` as `City of Residence`, COUNT(*) as `Current Facilities`
	FROM Employee e
  JOIN Employed ed ON e.`Medicare Number` = ed.`Medicare Number`
  JOIN Facility f ON f.`Name` = ed.`Facility Name` AND f.`Phone Number` = ed.`Facility Phone Number`
  JOIN PostalCode p ON p.`Postal Code` = f.`Postal Code`
  JOIN PostalCode pe ON pe.`Postal Code` = e.`Postal Code`
	WHERE e.`Role` = 'Doctor' AND p.`Province` = 'Quebec'
  GROUP BY e.`Medicare Number`
	ORDER BY p.`City` ASC, `Current Facilities` DESC;");
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
        Doctors (14)
      </h1>
      <table border='1'>
      <tr>
        <th>First Name</th>
        <th>Last Name</th>
        <th>City of Residence</th>
        <th>Current Facilities</th>
      </tr>
      <?php
      while(true) {
        $assoc = mysqli_fetch_assoc($r);
        if($assoc == null) {
          break;
        }
        echo("<tr><td>".$assoc["First Name"]."</td>"
        ."<td>".$assoc["Last Name"]."</td>"
        ."<td>".$assoc["City of Residence"]."</td>"
        ."<td>".$assoc["Current Facilities"]."</td></tr>");
      }
      ?>  
      </table>
    </div>
  </div>
</body>

</html>