<?php
  include "init_db.php";

  $r = mysqli_query($db, "SELECT *
	FROM Infection
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

  <title>Infections</title>
</head>

<body>
  <div class="container-parent">
    <div class="container">
      <h1 style="margin-bottom:12px;">
        Infections (4)
      </h1>
      <table border='1'>
      <tr>
        <th>Type</th>
        <th>Date</th>
        <th>Employee Medicare Number</th>
      </tr>
      <?php
      while(true) {
        $assoc = mysqli_fetch_assoc($r);
        if($assoc == null) {
          break;
        }
        echo("<tr><td>".$assoc["Type"]."</td>"
        ."<td>".$assoc["Date"]."</td>"
        ."<td>".$assoc["Employee Medicare Number"]."</td></tr>");
      }
      ?>  
      </table>
    </div>
  </div>
</body>

</html>