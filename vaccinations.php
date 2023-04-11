<?php
  include "init_db.php";

  $r = mysqli_query($db, "SELECT *
	FROM Vaccination
	ORDER BY `Date` ASC");
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <link href='https://fonts.googleapis.com/css?family=Roboto:300' rel='stylesheet' type='text/css'>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <link rel="stylesheet" type="text/css" href="normalize.css" />
  <link rel="stylesheet" type="text/css" href="index.css" />

  <title>Vaccinations</title>
</head>

<body>
  <div class="container-parent">
    <div class="container">
      <h1 style="margin-bottom:12px;">
        Vaccinations (3)
      </h1>

      <table border='1'>
      <tr>
        <th>Type</th>
        <th>Dose Number</th>
        <th>Facility Name</th>
        <th>Facility Phone Number</th>
        <th>Employee Medicare Number</th>
        <th>Date</th>
      </tr>
      <?php
      while(true) {
        $assoc = mysqli_fetch_assoc($r);
        if($assoc == null) {
          break;
        }
        echo("<tr><td>".$assoc["Type"]."</td>"
        ."<td>".$assoc["Dose Number"]."</td>"
        ."<td>".$assoc["Facility Name"]."</td>"
        ."<td>".$assoc["Facility Phone Number"]."</td>"
        ."<td>".$assoc["Employee Medicare Number"]."</td>"
        ."<td>".$assoc["Date"]."</td></tr>");
      }
      ?>  
      </table>
    </div>
  </div>
</body>

</html>