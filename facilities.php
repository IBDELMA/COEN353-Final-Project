<?php
  include "init_db.php";
  $r = mysqli_query($db, "SELECT * FROM Facility;");  
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
        <th>Phone Number</th>
        <th>Address</th>
        <th>Postal</th>
        <th>Capacity</th>
        <th>Type</th>
        <th>Web Address</th>
        <th>Manager Medicare Number</th>
      </tr>
      <?php
      while(true) {
        $assoc = mysqli_fetch_assoc($r);
        if($assoc == null) {
          break;
        }
        echo("<tr><td>".$assoc["Name"]."</td>"
        ."<td>".$assoc["Phone Number"]."</td>"
        ."<td>".$assoc["Address"]."</td>"
        ."<td>".$assoc["Postal Code"]."</td>"
        ."<td>".$assoc["Capacity"]."</td>"
        ."<td>".$assoc["Type"]."</td>"
        ."<td>".$assoc["Web Address"]."</td>"
        ."<td>".$assoc["Manager Medicare Number"]."</td></tr>");
      }
      ?>  
      </table>
    </div>
  </div>
</body>

</html>