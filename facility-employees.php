<?php
  include "init_db.php";

  $queries = array();
  parse_str($_SERVER['QUERY_STRING'], $queries);
  $name = $queries["name"];
  $phone_number = $queries["phone-number"];
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <link href='https://fonts.googleapis.com/css?family=Roboto:300' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" type="text/css" href="normalize.css" />
  <link rel="stylesheet" type="text/css" href="index.css" />
  <script src="utils.js"></script>
  <title>Facility Employees</title>
</head>

<body>
  <div class="container-parent">
    <div class="container">
      <h1 style="margin-bottom:12px;">
        Employees currently working at a specific facility (7)
      </h1>
      <h2>
        <?php
        echo("Name: ".$name.", Phone Number: ".$phone_number);
        ?>
      </h2>
    </div>
  </div>
</body>

</html>