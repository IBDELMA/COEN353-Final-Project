<?php
  include "init_db.php";

  $r = mysqli_query($db, "SELECT *
	FROM Employee e
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

  <title>Employees</title>
</head>

<body>
  <div class="container-parent">
    <div class="container">
      <h1 style="margin-bottom:12px;">
        Employees (2)
      </h1>
      <table border='1'>
      <tr>
        <th>Medicare Number</th>
        <th>Last Name</th>
        <th>First Name</th>
        <th>Birth Date</th>
        <th>Address</th>
        <th>Postal Code</th>
        <th>Phone Number</th>
        <th>Citizenship</th>
        <th>Email</th>
        <th>Role</th>
      </tr>
      <?php
      while(true) {
        $assoc = mysqli_fetch_assoc($r);
        if($assoc == null) {
          break;
        }
        echo("<tr><td>".$assoc["Medicare Number"]."</td>"
        ."<td>".$assoc["Last Name"]."</td>"
        ."<td>".$assoc["First Name"]."</td>"
        ."<td>".$assoc["Birth Date"]."</td>"
        ."<td>".$assoc["Address"]."</td>"
        ."<td>".$assoc["Postal Code"]."</td>"
        ."<td>".$assoc["Phone Number"]."</td>"
        ."<td>".$assoc["Citizenship"]."</td>"
        ."<td>".$assoc["Email"]."</td>"
        ."<td>".$assoc["Role"]."</td></tr>");
      }
      ?>  
      </table>
    </div>
  </div>
</body>

</html>