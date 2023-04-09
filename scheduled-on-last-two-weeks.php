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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <link rel="stylesheet" type="text/css" href="normalize.css" />
  <link rel="stylesheet" type="text/css" href="index.css" />

  <title>Scheduled on last two weeks</title>
</head>

<body>
  <div class="container-parent">
    <div class="container">
      <h1 style="margin-bottom:12px;">
        Doctors/Nurses on schedule in last two weeks (11)
      </h1>
      <div style="font-size:20px">
        <?php
        echo("Name: ".$name.", Phone Number: ".$phone_number);
        ?>
      </div>
    </div>
  </div>
</body>

</html>