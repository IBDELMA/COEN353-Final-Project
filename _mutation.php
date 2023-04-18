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
              $medicare_number = $_GET['medicare_number'];
              $last_name = $_GET['last_name'];
              $first_name = $_GET['first_name'];
              $birth_date = $_GET['birth_date'];
              $address = $_GET['address'];
              $postal_code = $_GET['postal_code'];
              $phone_number = $_GET['phone_number'];
              $citizenship = $_GET['citizenship'];
              $email = $_GET['email'];
              $role = $_GET['role'];
              $city = $_GET['city'];
              $province = $_GET['province'];
              $employee_query = "INSERT INTO Employee (`Medicare Number`, `Last Name`, `First Name`, `Birth Date`, Address, `Postal Code`, `Phone Number`, Citizenship, Email, `Role`)";
              $employee_query .= " VALUES('".$medicare_number."','".$last_name."','".$first_name."','".$birth_date."','".$address."','".$postal_code."','".$phone_number."','".$citizenship."','".$email."','".$role."');";
              $postal_code_query = "INSERT IGNORE INTO PostalCode (`Postal Code`, City, Province) VALUES('".$postal_code."', '".$city."', '".$province."');";
              if(mysqli_query($db, $postal_code_query) == false) {
                echo "<h4> Error: ".mysqli_error($db)."</h4>";
              } else {
                echo "<h4>Upserted postal code!</h4>";
              }
              if(mysqli_query($db, $employee_query) == false) {
                echo "<h4> Error: ".mysqli_error($db)."</h4>";
              } else {
                echo "<h4>Created employee!</h4>";
              }
              break;
            case "create-schedule":
              echo "<h4>Creating new schedule!</h4>";
              $faculty_name = $_GET['faculty_name'];
              $faculty_phone_number = $_GET['faculty_phone_number'];
              $employee_medicare_number = $_GET['employee_medicare_number'];
              $start_time = $_GET['start_time'];
              $end_time = $_GET['end_time'];
              $date = $_GET['date'];
              $query = "INSERT INTO Scheduled (`Facility Name`, `Facility Phone Number`, `Employee Medicare Number`, `Start Time`, `End Time`, `Date`) ";
              $query .= "VALUES('".$faculty_name."', '".$faculty_phone_number."', '".$employee_medicare_number."', '".$start_time."', '".$end_time."', '".$date."');";
              if(mysqli_query($db, $query) == false) {
                echo "<h4> Error: ".mysqli_error($db)."</h4>";
              } else {
                echo "<h4>Created schedule!</h4>";
              }
              break;
            case "create-vaccination":
              echo "<h4>Creating new vaccination!</h4>";
              $type = $_GET['type'];
              $faculty_name = $_GET['faculty_name'];
              $faculty_phone_number = $_GET['faculty_phone_number'];
              $employee_medicare_number = $_GET['employee_medicare_number'];
              $date = $_GET['date'];
              $dose_number = $_GET['dose_number'];
              $query = "INSERT INTO Vaccination (`Type`, `Dose Number`, `Facility Name`, `Facility Phone Number`, `Employee Medicare Number`, `Date`) ";
              $query .= "VALUES('".$type."', ".$dose_number.", '".$faculty_name."', '".$faculty_phone_number."', '".$employee_medicare_number."', '".$date."');";
              if(mysqli_query($db, $query) == false) {
                echo "<h4> Error: ".mysqli_error($db)."</h4>";
              } else {
                echo "<h4>Created vaccination!</h4>";
              }
              break;
            case "create-infection":
              echo "<h4>Creating new infection!</h4>";
              $type = $_GET['type'];
              $date = $_GET['date'];
              $employee_medicare_number = $_GET['employee_medicare_number'];
              $query = "INSERT INTO Infection (`Type`, `Date`, `Employee Medicare Number`) VALUES('".$type."', '".$date."', '".$employee_medicare_number."')";
              if(mysqli_query($db, $query) == false) {
                echo "<h4> Error: ".mysqli_error($db)."</h4>";
              } else {
                echo "<h4>Created infection!</h4>";
              }
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
              $medicare_number = $_GET['medicare_number'];
              $last_name = $_GET['last_name'];
              $first_name = $_GET['first_name'];
              $birth_date = $_GET['birth_date'];
              $address = $_GET['address'];
              $postal_code = $_GET['postal_code'];
              $phone_number = $_GET['phone_number'];
              $citizenship = $_GET['citizenship'];
              $email = $_GET['email'];
              $role = $_GET['role'];
              $city = $_GET['city'];
              $province = $_GET['province'];
              $employee_query = "UPDATE Employee SET `Last Name`='".$last_name."', `First Name`='".$first_name."', `Birth Date`='".$birth_date."', Address='".$address."', ";
              $employee_query .= "`Postal Code`='".$postal_code."', `Phone Number`='".$phone_number."', Citizenship='".$citizenship."', Email='".$email."', `Role`='".$role."' WHERE `Medicare Number`='".$medicare_number."';";
              $postal_code_query = "INSERT IGNORE INTO PostalCode (`Postal Code`, City, Province) VALUES('".$postal_code."', '".$city."', '".$province."');";
              if(mysqli_query($db, $postal_code_query) == false) {
                echo "<h4> Error: ".mysqli_error($db)."</h4>";
              } else {
                echo "<h4>Upserted postal code!</h4>";
              }
              if(mysqli_query($db, $employee_query) == false) {
                echo "<h4> Error: ".mysqli_error($db)."</h4>";
              } else {
                echo "<h4>Updated employee!</h4>";
              }
              break;
            case "update-schedule":
              echo "<h4>Updating schedule!</h4>";
              $end_time = $_GET['end_time'];
              $faculty_name = $_GET['faculty_name'];
              $faculty_phone_number = $_GET['faculty_phone_number'];
              $employee_medicare_number = $_GET['employee_medicare_number'];
              $start_time = $_GET['start_time'];
              $date = $_GET['date'];
              $query = "UPDATE Scheduled SET `End Time`='".$end_time."' WHERE `Facility Name`='".$faculty_name."' AND `Facility Phone Number`='".$faculty_phone_number."'";
              $query .= " AND `Employee Medicare Number`='".$employee_medicare_number."' AND `Start Time`='".$start_time."' AND `Date`='".$date."';";
              if(mysqli_query($db, $query) == false) {
                echo "<h4> Error: ".mysqli_error($db)."</h4>";
              } else {
                echo "<h4>Created schedule!</h4>";
              }
              break;
            case "update-vaccination":
              echo "<h4>Updating vaccination!</h4>";
              $dose_number = $_GET['dose_number'];
              $date = $_GET['date'];
              $type = $_GET['type'];
              $faculty_name = $_GET['faculty_name'];
              $faculty_phone_number = $_GET['faculty_phone_number'];
              $employee_medicare_number = $_GET['employee_medicare_number'];
              $query = "UPDATE Vaccination SET `Date`='".$date."' WHERE `Type`='".$type."' AND `Dose Number`=".$dose_number." AND `Facility Name`='".$faculty_name."' AND ";
              $query .= "`Facility Phone Number`='".$faculty_phone_number."' AND `Employee Medicare Number`='".$employee_medicare_number."'";
              if(mysqli_query($db, $query) == false) {
                echo "<h4> Error: ".mysqli_error($db)."</h4>";
              } else {

                echo "<h4>Updated vaccination!</h4>";
              }
              break;
            case "update-infection":
              echo "<h4>Updating infection!</h4>";
              echo "<h4> Updated infection!</h4>"
              break;
            case "delete-facility":
              echo "<h4>Deleting facility!</h4>";
              $name = $_GET['name'];
              $phone_number = $_GET['phone_number'];
              $query = "DELETE FROM Facility WHERE Name='".$name."' AND `Phone Number`='".$phone_number."';";
              if(mysqli_query($db, $query) == false) {
                echo "<h4> Error: ".mysqli_error($db)."</h4>";
              } else {
                echo "<h4>Deleted facility!</h4>";
              }
              break;
            case "delete-employee":
              echo "<h4>Deleting employee!</h4>";
              $medicare_number = $_GET['medicare_number'];
              $query = "DELETE FROM Employee WHERE `Medicare Number`='".$medicare_number."';";
              if(mysqli_query($db, $query) == false) {
                echo "<h4> Error: ".mysqli_error($db)."</h4>";
              } else {
                echo "<h4>Deleted employee!</h4>";
              }
              break;
            case "delete-schedule":
              echo "<h4>Deleting schedule!</h4>";
              $faculty_name = $_GET['faculty_name'];
              $faculty_phone_number = $_GET['faculty_phone_number'];
              $employee_medicare_number = $_GET['employee_medicare_number'];
              $start_time = $_GET['start_time'];
              $date = $_GET['date'];
              $query = "DELETE FROM Scheduled WHERE `Facility Name`='".$faculty_name."' AND `Facility Phone Number`='".$faculty_phone_number."'";
              $query .= " AND `Employee Medicare Number`='".$employee_medicare_number."' AND `Start Time`='".$start_time."' AND `Date`='".$date."';";
              if(mysqli_query($db, $query) == false) {
                echo "<h4> Error: ".mysqli_error($db)."</h4>";
              } else {
                echo "<h4>Deleted schedule!</h4>";
              }
              break;
            case "delete-vaccination":
              echo "<h4>Deleting vaccination!</h4>";
              $dose_number = $_GET['dose_number'];
              $type = $_GET['type'];
              $faculty_name = $_GET['faculty_name'];
              $faculty_phone_number = $_GET['faculty_phone_number'];
              $employee_medicare_number = $_GET['employee_medicare_number'];
              $query = "DELETE FROM Vaccination WHERE `Type`='".$type."' AND `Dose Number`=".$dose_number." AND `Facility Name`='".$faculty_name."' AND ";
              $query .= "`Facility Phone Number`='".$faculty_phone_number."' AND `Employee Medicare Number`='".$employee_medicare_number."'";
              if(mysqli_query($db, $query) == false) {
                echo "<h4> Error: ".mysqli_error($db)."</h4>";
              } else {

                echo "<h4>Deleted vaccination!</h4>";
              }
              break;
            case "delete-infection":
              echo "<h4>Deleting infection!</h4>";
              $type = $_GET['type'];
              $date = $_GET['date'];
              $employee_medicare_number = $_GET['employee_medicare_number'];
              $query = "DELETE FROM Infection WHERE `Type`='".$type."' AND `Date`='".$date."' AND `Employee Medicare Number`='".$employee_medicare_number."';"
              if(mysqli_query($db, $query) == false) {
                echo "<h4> Error: ".mysqli_error($db)."</h4>";
              } else {

                echo "<h4>Deleted infection!</h4>";
              }
              break;
          }
        }
        ?>
      </div>
  </div>
</body>

</html>