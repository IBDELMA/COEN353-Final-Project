<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <link href='https://fonts.googleapis.com/css?family=Roboto:300' rel='stylesheet' type='text/css'>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <link rel="stylesheet" type="text/css" href="normalize.css" />
  <link rel="stylesheet" type="text/css" href="index.css" />
  <title>Mutation</title>
</head>

<body>
  <div class="container-parent">
      <div class="container">
        <?php
        include "init_db.php";
        if(isset($_GET['action'])) {
          $action = $_GET['action'];
          switch($action) {
            case "create-facility":
              echo "<h4>Creating new facility!</h4>";
              $name = $_GET['name'];
              $phone_number = $_GET['phone_number'];
              $address = $_GET['address'];
              $postal_code = $_GET['postal_code'];
              $capacity = $_GET['capacity'];
              $type = $_GET['type'];
              $web_address = $_GET['web_address'];
              $manager_medicare_number = $_GET['manager_medicare_number'];
              $city = $_GET['city'];
              $province = $_GET['province'];
              $facility_query = "INSERT INTO Facility (Name, `Phone Number`, Address, `Postal Code`, Capacity, `Type`, `Web Address`, `Manager Medicare Number`)";
              $facility_query .= "VALUES('".$name."', '".$phone_number."', '".$address."', '".$postal_code."', ".$capacity.", '".$type."', '".$web_address."', '".$manager_medicare_number."');";
              $postal_code_query = "INSERT IGNORE INTO PostalCode (`Postal Code`, City, Province) VALUES('".$postal_code."', '".$city."', '".$province."');";
              if(mysqli_query($db, $postal_code_query) == false) {
                echo "<h4> Error: ".mysqli_error($db)."</h4>";
              } else {
                echo "<h4>Upserted postal code!</h4>";
              }
              if(mysqli_query($db, $facility_query) == false) {
                echo "<h4> Error: ".mysqli_error($db)."</h4>";
              } else {
                echo "<h4>Created facility!</h4>";
              }
              break;
            case "create-employee":
              echo "<h4>Creating new employee!</h4>";
              $name = $_GET['name'];
              $phone_number = $_GET['phone_number'];
              $address = $_GET['address'];
              $postal_code = $_GET['postal_code'];
              $capacity = $_GET['capacity'];
              $type = $_GET['type'];
              $web_address = $_GET['web_address'];
              $manager_medicare_number = $_GET['manager_medicare_number'];
              $city = $_GET['city'];
              $province = $_GET['province'];
              $employee_query = "INSERT INTO Facility (Name, `Phone Number`, Address, `Postal Code`, Capacity, `Type`, `Web Address`, `Manager Medicare Number`)";
              $employee_query .= "VALUES('".$name."', '".$phone_number."', '".$address."', '".$postal_code."', ".$capacity.", '".$type."', '".$web_address."', '".$manager_medicare_number."');";
              $postal_code_query = "INSERT IGNORE INTO PostalCode (`Postal Code`, City, Province) VALUES('".$postal_code."', '".$city."', '".$province."');";
              if(mysqli_query($db, $postal_code_query) == false) {
                echo "<h4> Error: ".mysqli_error($db)."</h4>";
              } else {
                echo "<h4>Upserted postal code!</h4>";
              }
              if(mysqli_query($db, $employee_query) == false) {
                echo "<h4> Error: ".mysqli_error($db)."</h4>";
              } else {
                echo "<h4>Created facility!</h4>";
              }
              break;
            case "create-schedule":
              echo "<h4>Creating new schedule!</h4>";
              break;
            case "create-vaccination":
              echo "<h4>Creating new vaccination!</h4>";
              break;
            case "create-infection":
              echo "<h4>Creating new infection!</h4>";
              break;
            case "update-facility":
              echo "<h4>Creating new facility!</h4>";
              $name = $_GET['name'];
              $phone_number = $_GET['phone_number'];
              $address = $_GET['address'];
              $postal_code = $_GET['postal_code'];
              $capacity = $_GET['capacity'];
              $type = $_GET['type'];
              $web_address = $_GET['web_address'];
              $manager_medicare_number = $_GET['manager_medicare_number'];
              $city = $_GET['city'];
              $province = $_GET['province'];
              $facility_query = "UPDATE Facility SET Address='".$address."', `Postal Code`='".$postal_code."', Capacity=".$capacity.", `Type`='".$type."', ";
              $facility_query .= "`Web Address`='".$web_address."', `Manager Medicare Number`='".$manager_medicare_number."' WHERE Name='".$name."' AND `Phone Number`='".$phone_number."'";
              $postal_code_query = "INSERT IGNORE INTO PostalCode (`Postal Code`, City, Province) VALUES('".$postal_code."', '".$city."', '".$province."');";
              if(mysqli_query($db, $postal_code_query) == false) {
                echo "<h4> Error: ".mysqli_error($db)."</h4>";
              } else {
                echo "<h4>Upserted postal code!</h4>";
              }
              if(mysqli_query($db, $facility_query) == false) {
                echo "<h4> Error: ".mysqli_error($db)."</h4>";
              } else {
                echo "<h4>Updated facility!</h4>";
              }
              break;
            case "update-employee":
              echo "<h4>Updating employee!</h4>";
              break;
            case "update-schedule":
              echo "<h4>Updating schedule!</h4>";
              break;
            case "update-vaccination":
              echo "<h4>Updating vaccination!</h4>";
              break;
            case "update-infection":
              echo "<h4>Updating infection!</h4>";
              break;
            case "delete-facility":
              echo "<h4>Deleting facility!</h4>";
              $name = $_GET['name'];
              $phone_number = $_GET['phone_number'];
              $facility_query = "DELETE FROM Facility WHERE Name='".$name."' AND `Phone Number`='".$phone_number."';";
              if(mysqli_query($db, $facility_query) == false) {
                echo "<h4> Error: ".mysqli_error($db)."</h4>";
              } else {
                echo "<h4>Deleted facility!</h4>";
              }
              break;
            case "delete-employee":
              echo "<h4>Deleting employee!</h4>";
              break;
            case "delete-schedule":
              echo "<h4>Deleting schedule!</h4>";
              break;
            case "delete-vaccination":
              echo "<h4>Deleting vaccination!</h4>";
              break;
            case "delete-infection":
              echo "<h4>Deleting infection!</h4>";
              break;
          }
        }
        ?>
      </div>
  </div>
</body>

</html>