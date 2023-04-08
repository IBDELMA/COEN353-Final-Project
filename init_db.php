<?php
  $dbServername = "jbc353.encs.concordia.ca";
  $user = "jbc353_4";
  $password = "8YnBrguq";
  $dbName = "jbc353_4";

  // echo "Attempting to connect...";
  $db = mysqli_connect($dbServername,$user,$password,$dbName,3306) or die("Connection failed to database.");

  if (mysqli_connect_errno()) {
      echo "Failed to connect to MySQL: " . mysqli_connect_error();
  } else {
      // echo "Connect Successfully. <br>Host info: " . mysqli_get_host_info($db) . "<br>";
  }
?>