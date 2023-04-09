<?php
  include "init_db.php";
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <link href='https://fonts.googleapis.com/css?family=Roboto:300' rel='stylesheet' type='text/css'>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <link rel="stylesheet" type="text/css" href="normalize.css" />
  <link rel="stylesheet" type="text/css" href="index.css" />
  <title>Mutations</title>
</head>

<body>
  <div class="container-parent">
    <div class="container">
      <h1 style="margin-bottom:12px;">
        Mutations
      </h1>
      <hr class="solid">
      <div class="grid">
        <h4>
          <form action="create_facility()" style="margin-bottom:24px;" class="grid-form">
            <label for="name">Name:</label>
            <input type="text" class="boxsizingBorder" id="name" name="name">
            <br>
            <label for="phone-number">Phone Number:</label>
            <input type="text" class="boxsizingBorder" id="phone-number" name="phone-number">
            <br>
            <label for="address">Address:</label>
            <input type="text" class="boxsizingBorder" id="address" name="address">
            <br>
            <label for="postal_code">Postal Code:</label>
            <input type="text" class="boxsizingBorder" id="postal_code" name="postal_code">
            <br>
            <label for="city">City:</label>
            <input type="text" class="boxsizingBorder" id="city" name="city">
            <br>
            <label for="province">Province:</label>
            <input type="text" class="boxsizingBorder" id="province" name="province">
            <br>
            <label for="capacity">Capacity:</label>
            <input type="text" class="boxsizingBorder" id="capacity" name="capacity">
            <br>
            <label for="type">Type:</label>
            <input type="text" class="boxsizingBorder" id="type" name="type">
            <br>
            <label for="web_address">Web Address:</label>
            <input type="text" class="boxsizingBorder" id="web_address" name="web_address">
            <br>
            <label for="manager_medicare_number">Manager Medicare Number:</label>
            <input type="text" class="boxsizingBorder" id="manager_medicare_number" name="manager_medicare_number">
            <br>
            <div style="display:flex;justify-content: center;">
              <input type="submit" value="Create Facility" style="width:180px">
            </div>
          </form>
        </h4>
        <h4 style="margin-bottom:20px;">
          <form action="create_employee()" class="grid-form">
            <label for="medicare_number">Medicare Number:</label>
            <input type="text" class="boxsizingBorder" id="medicare_number" name="medicare_number">
            <br>
            <label for="last_name">Last Name:</label>
            <input type="text" class="boxsizingBorder" id="last_name" name="last_name">
            <br>
            <label for="first_name">First Name:</label>
            <input type="text" class="boxsizingBorder" id="first_name" name="first_name">
            <br>
            <label for="birth_date">Birth Date:</label>
            <input type="text" class="boxsizingBorder" id="birth_date" name="birth_date">
            <br>
            <label for="address">Address:</label>
            <input type="text" class="boxsizingBorder" id="address" name="address">
            <br>
            <label for="postal_code">Postal Code:</label>
            <input type="text" class="boxsizingBorder" id="postal_code" name="postal_code">
            <br>
            <label for="city">City:</label>
            <input type="text" class="boxsizingBorder" id="city" name="city">
            <br>
            <label for="province">Province:</label>
            <input type="text" class="boxsizingBorder" id="province" name="province">
            <br>
            <label for="phone_number">Phone Number:</label>
            <input type="text" class="boxsizingBorder" id="phone_number" name="phone_number">
            <br>
            <label for="citizenship">Citizenship:</label>
            <input type="text" class="boxsizingBorder" id="citizenship" name="citizenship">
            <br>
            <label for="email">Email:</label>
            <input type="text" class="boxsizingBorder" id="email" name="email">
            <br>
            <label for="role">Role:</label>
            <input type="text" class="boxsizingBorder" id="role" name="role">
            <br>
            <div style="display:flex;justify-content: center;">
              <input type="submit" value="Create Employee" style="width:180px">
            </div>
          </form>
        </h4>
        <h4 style="margin-bottom:12px;">
          <form action="create_employee()" class="grid-form">
            <label for="faculty_phone_number">Faculty Phone Number:</label>
            <input type="text" class="boxsizingBorder" id="faculty_phone_number" name="faculty_phone_number">
            <br>
            <label for="faculty_name">Faculty Name:</label>
            <input type="text" class="boxsizingBorder" id="faculty_name" name="faculty_name">
            <br>
            <label for="employee_medicare_number">Employee Medicare Number:</label>
            <input type="text" class="boxsizingBorder" id="employee_medicare_number" name="employee_medicare_number">
            <br>
            <label for="date">Date:</label>
            <input type="text" class="boxsizingBorder" id="date" name="date">
            <br>
            <label for="start_time">Start Time:</label>
            <input type="text" class="boxsizingBorder" id="start_time" name="start_time">
            <br>
            <label for="end_time">End Time:</label>
            <input type="text" class="boxsizingBorder" id="end_time" name="end_time">
            <br>
            <div style="display:flex;justify-content: center;">
              <input type="submit" value="Create Schedule" style="width:180px">
            </div>
          </form>
        </h4>
        <h4 style="margin-bottom:12px;">
          <form action="create_employee()" class="grid-form">
            <label for="faculty_phone_number">Faculty Phone Number:</label>
            <input type="text" class="boxsizingBorder" id="faculty_phone_number" name="faculty_phone_number">
            <br>
            <label for="faculty_name">Faculty Name:</label>
            <input type="text" class="boxsizingBorder" id="faculty_name" name="faculty_name">
            <br>
            <label for="employee_medicare_number">Employee Medicare Number:</label>
            <input type="text" class="boxsizingBorder" id="employee_medicare_number" name="employee_medicare_number">
            <br>
            <label for="type">Type:</label>
            <input type="text" class="boxsizingBorder" id="type" name="type">
            <br>
            <label for="dose_number">Dose Number:</label>
            <input type="text" class="boxsizingBorder" id="dose_number" name="dose_number">
            <br>
            <label for="date">Date:</label>
            <input type="text" class="boxsizingBorder" id="date" name="date">
            <br>
            <div style="display:flex;justify-content: center;">
              <input type="submit" value="Create Vaccination" style="width:180px">
            </div>
          </form>
        </h4>
        <h4 style="margin-bottom:12px;">
          <form action="create_employee()" class="grid-form">
            <label for="employee_medicare_number">Employee Medicare Number:</label>
            <input type="text" class="boxsizingBorder" id="employee_medicare_number" name="employee_medicare_number">
            <br>
            <label for="type">Type:</label>
            <input type="text" class="boxsizingBorder" id="type" name="type">
            <br>
            <label for="date">Date:</label>
            <input type="text" class="boxsizingBorder" id="date" name="date">
            <br>
            <div style="display:flex;justify-content: center;">
              <input type="submit" value="Create Infection" style="width:180px">
            </div>
          </form>
        </h4>
      </div>
      <hr class="solid">
      <div class="grid">
        <h4>
          <form action="create_facility()" style="margin-bottom:24px;" class="grid-form">
            <label for="name">Name:</label>
            <input type="text" class="boxsizingBorder" id="name" name="name">
            <br>
            <label for="phone-number">Phone Number:</label>
            <input type="text" class="boxsizingBorder" id="phone-number" name="phone-number">
            <br>
            <label for="address">Address:</label>
            <input type="text" class="boxsizingBorder" id="address" name="address">
            <br>
            <label for="postal_code">Postal Code:</label>
            <input type="text" class="boxsizingBorder" id="postal_code" name="postal_code">
            <br>
            <label for="city">City:</label>
            <input type="text" class="boxsizingBorder" id="city" name="city">
            <br>
            <label for="province">Province:</label>
            <input type="text" class="boxsizingBorder" id="province" name="province">
            <br>
            <label for="capacity">Capacity:</label>
            <input type="text" class="boxsizingBorder" id="capacity" name="capacity">
            <br>
            <label for="type">Type:</label>
            <input type="text" class="boxsizingBorder" id="type" name="type">
            <br>
            <label for="web_address">Web Address:</label>
            <input type="text" class="boxsizingBorder" id="web_address" name="web_address">
            <br>
            <label for="manager_medicare_number">Manager Medicare Number:</label>
            <input type="text" class="boxsizingBorder" id="manager_medicare_number" name="manager_medicare_number">
            <br>
            <div style="display:flex;justify-content: center;">
              <input type="submit" value="Update Facility" style="width:180px">
            </div>
          </form>
        </h4>
        <h4 style="margin-bottom:20px;">
          <form action="create_employee()" class="grid-form">
            <label for="medicare_number">Medicare Number:</label>
            <input type="text" class="boxsizingBorder" id="medicare_number" name="medicare_number">
            <br>
            <label for="last_name">Last Name:</label>
            <input type="text" class="boxsizingBorder" id="last_name" name="last_name">
            <br>
            <label for="first_name">First Name:</label>
            <input type="text" class="boxsizingBorder" id="first_name" name="first_name">
            <br>
            <label for="birth_date">Birth Date:</label>
            <input type="text" class="boxsizingBorder" id="birth_date" name="birth_date">
            <br>
            <label for="address">Address:</label>
            <input type="text" class="boxsizingBorder" id="address" name="address">
            <br>
            <label for="postal_code">Postal Code:</label>
            <input type="text" class="boxsizingBorder" id="postal_code" name="postal_code">
            <br>
            <label for="city">City:</label>
            <input type="text" class="boxsizingBorder" id="city" name="city">
            <br>
            <label for="province">Province:</label>
            <input type="text" class="boxsizingBorder" id="province" name="province">
            <br>
            <label for="phone_number">Phone Number:</label>
            <input type="text" class="boxsizingBorder" id="phone_number" name="phone_number">
            <br>
            <label for="citizenship">Citizenship:</label>
            <input type="text" class="boxsizingBorder" id="citizenship" name="citizenship">
            <br>
            <label for="email">Email:</label>
            <input type="text" class="boxsizingBorder" id="email" name="email">
            <br>
            <label for="role">Role:</label>
            <input type="text" class="boxsizingBorder" id="role" name="role">
            <br>
            <div style="display:flex;justify-content: center;">
              <input type="submit" value="Update Employee" style="width:180px">
            </div>
          </form>
        </h4>
        <h4 style="margin-bottom:12px;">
          <form action="create_employee()" class="grid-form">
            <label for="faculty_phone_number">Faculty Phone Number:</label>
            <input type="text" class="boxsizingBorder" id="faculty_phone_number" name="faculty_phone_number">
            <br>
            <label for="faculty_name">Faculty Name:</label>
            <input type="text" class="boxsizingBorder" id="faculty_name" name="faculty_name">
            <br>
            <label for="employee_medicare_number">Employee Medicare Number:</label>
            <input type="text" class="boxsizingBorder" id="employee_medicare_number" name="employee_medicare_number">
            <br>
            <label for="date">Date:</label>
            <input type="text" class="boxsizingBorder" id="date" name="date">
            <br>
            <label for="start_time">Start Time:</label>
            <input type="text" class="boxsizingBorder" id="start_time" name="start_time">
            <br>
            <label for="end_time">End Time:</label>
            <input type="text" class="boxsizingBorder" id="end_time" name="end_time">
            <br>
            <div style="display:flex;justify-content: center;">
              <input type="submit" value="Update Schedule" style="width:180px">
            </div>
          </form>
        </h4>
        <h4 style="margin-bottom:12px;">
          <form action="create_employee()" class="grid-form">
            <label for="faculty_phone_number">Faculty Phone Number:</label>
            <input type="text" class="boxsizingBorder" id="faculty_phone_number" name="faculty_phone_number">
            <br>
            <label for="faculty_name">Faculty Name:</label>
            <input type="text" class="boxsizingBorder" id="faculty_name" name="faculty_name">
            <br>
            <label for="employee_medicare_number">Employee Medicare Number:</label>
            <input type="text" class="boxsizingBorder" id="employee_medicare_number" name="employee_medicare_number">
            <br>
            <label for="type">Type:</label>
            <input type="text" class="boxsizingBorder" id="type" name="type">
            <br>
            <label for="dose_number">Dose Number:</label>
            <input type="text" class="boxsizingBorder" id="dose_number" name="dose_number">
            <br>
            <label for="date">Date:</label>
            <input type="text" class="boxsizingBorder" id="date" name="date">
            <br>
            <div style="display:flex;justify-content: center;">
              <input type="submit" value="Update Vaccination" style="width:180px">
            </div>
          </form>
        </h4>
        <h4 style="margin-bottom:12px;">
          <form action="create_employee()" class="grid-form">
            <label for="employee_medicare_number">Employee Medicare Number:</label>
            <input type="text" class="boxsizingBorder" id="employee_medicare_number" name="employee_medicare_number">
            <br>
            <label for="type">Type:</label>
            <input type="text" class="boxsizingBorder" id="type" name="type">
            <br>
            <label for="date">Date:</label>
            <input type="text" class="boxsizingBorder" id="date" name="date">
            <br>
            <div style="display:flex;justify-content: center;">
              <input type="submit" value="Update Infection" style="width:180px">
            </div>
          </form>
        </h4>
      </div>
      <hr class="solid">
      <div class="grid">
        <h4>
          <form action="create_facility()" style="margin-bottom:24px;" class="grid-form">
            <label for="name">Name:</label>
            <input type="text" class="boxsizingBorder" id="name" name="name">
            <br>
            <label for="phone-number">Phone Number:</label>
            <input type="text" class="boxsizingBorder" id="phone-number" name="phone-number">
            <br>
            <div style="display:flex;justify-content: center;">
              <input type="submit" value="Delete Facility" style="width:180px">
            </div>
          </form>
        </h4>
        <h4 style="margin-bottom:20px;">
          <form action="create_employee()" class="grid-form">
            <label for="medicare_number">Medicare Number:</label>
            <input type="text" class="boxsizingBorder" id="medicare_number" name="medicare_number">
            <br>
            <div style="display:flex;justify-content: center;">
              <input type="submit" value="Delete Employee" style="width:180px">
            </div>
          </form>
        </h4>
        <h4 style="margin-bottom:12px;">
          <form action="create_employee()" class="grid-form">
            <label for="faculty_phone_number">Faculty Phone Number:</label>
            <input type="text" class="boxsizingBorder" id="faculty_phone_number" name="faculty_phone_number">
            <br>
            <label for="faculty_name">Faculty Name:</label>
            <input type="text" class="boxsizingBorder" id="faculty_name" name="faculty_name">
            <br>
            <label for="employee_medicare_number">Employee Medicare Number:</label>
            <input type="text" class="boxsizingBorder" id="employee_medicare_number" name="employee_medicare_number">
            <br>
            <label for="date">Date:</label>
            <input type="text" class="boxsizingBorder" id="date" name="date">
            <br>
            <label for="start_time">Start Time:</label>
            <input type="text" class="boxsizingBorder" id="start_time" name="start_time">
            <br>
            <div style="display:flex;justify-content: center;">
              <input type="submit" value="Delete Schedule" style="width:180px">
            </div>
          </form>
        </h4>
        <h4 style="margin-bottom:12px;">
          <form action="create_employee()" class="grid-form">
            <label for="faculty_phone_number">Faculty Phone Number:</label>
            <input type="text" class="boxsizingBorder" id="faculty_phone_number" name="faculty_phone_number">
            <br>
            <label for="faculty_name">Faculty Name:</label>
            <input type="text" class="boxsizingBorder" id="faculty_name" name="faculty_name">
            <br>
            <label for="employee_medicare_number">Employee Medicare Number:</label>
            <input type="text" class="boxsizingBorder" id="employee_medicare_number" name="employee_medicare_number">
            <br>
            <label for="type">Type:</label>
            <input type="text" class="boxsizingBorder" id="type" name="type">
            <br>
            <label for="dose_number">Dose Number:</label>
            <input type="text" class="boxsizingBorder" id="dose_number" name="dose_number">
            <br>
            <div style="display:flex;justify-content: center;">
              <input type="submit" value="Delete Vaccination" style="width:180px">
            </div>
          </form>
        </h4>
        <h4 style="margin-bottom:12px;">
          <form action="create_employee()" class="grid-form">
            <label for="employee_medicare_number">Employee Medicare Number:</label>
            <input type="text" class="boxsizingBorder" id="employee_medicare_number" name="employee_medicare_number">
            <br>
            <label for="type">Type:</label>
            <input type="text" class="boxsizingBorder" id="type" name="type">
            <br>
            <label for="date">Date:</label>
            <input type="text" class="boxsizingBorder" id="date" name="date">
            <br>
            <div style="display:flex;justify-content: center;">
              <input type="submit" value="Delete Infection" style="width:180px">
            </div>
          </form>
        </h4>
      </div>
      <div style="margin-bottom:60px" />
    </div>
  </div>
</body>

</html>