<?php
include "init_db.php";
date_default_timezone_set('America/Toronto');
$r = mysqli_query($db, "SELECT s.`Facility Name`, f.Address, pc.City, pc.Province, f.`Postal Code`, e.`Medicare Number`, e.`First Name`, e.`Last Name`, e.Email, s.`Date`, DAYNAME(s.`Date`) AS `Day Name`, s.`Start Time`, s.`End Time` FROM Scheduled s
    JOIN Facility f ON s.`Facility Name` = f.Name AND s.`Facility Phone Number` = f.`Phone Number`
    JOIN PostalCode pc ON f.`Postal Code` = pc.`Postal Code` 
    JOIN Employee e ON s.`Employee Medicare Number` = e.`Medicare Number` 
    WHERE DATEDIFF(s.`Date`, CURDATE()) < 8 AND DATEDIFF(s.`Date`, CURDATE()) > 0
    ORDER BY s.`Facility Name`, s.`Employee Medicare Number`, s.`Date` ASC");
// {Facility Name|Address |City |Province|Postal Code|
//  Medicare Number |First Name|Last Name|Email|Date|Day Name|
//  Start Time|End Time|}

$assoc = mysqli_fetch_assoc($r);
if (!$assoc){
    exit("No schedule emails to send at this moment.\n");
}

$i = 0;
$logInsertArray = array();

$firstDay = new \DateTime('now +1 day');
$scheduleDates = date_format($firstDay, 'l Y-m-d') . " to " . date_format(date_modify($firstDay, '+6 day'), 'l Y-m-d');

// The email body 
// should include the facility name, the address of the facility, the employee’s first-name, 
// last-name, email address, and details of the schedule for the coming week. Details include 
// day of the week, start time and end time. The body of the message should also include an 
// entry for every day of the week followed by the starting hour and end hour for that day. A 
// message “No Assignment” is displayed if the employee is not scheduled for that specific 
// entry.



while (!is_null($assoc)){
    $facilityName = $assoc["Facility Name"];
    $subject = $facilityName . " Schedule for " . $scheduleDates;
    $recipient = $assoc["Email"];
    $content = $facilityName . " " . $assoc["Address"] . " " . $assoc["City"]. " " . $assoc["Province"]. " " . $assoc["Postal Code"] . "\nSchedule for " . $scheduleDates . "\n" . 
        "For " . $assoc["First Name"] . " ". $assoc["Last Name"] . " ". $assoc["Email"] . "\n\n";
    $medicare = $assoc["Medicare Number"];
    while ($assoc["Facility Name"] == $facilityName && $medicare == $assoc["Medicare Number"]){
        $content .= $assoc["Day Name"] . "  " . $assoc["Start Time"] . " to " . $assoc["End Time"] . "\n";
        $assoc = mysqli_fetch_assoc($r);
    }
    $shellOutput = shell_exec("echo \"$content\" | mail -s \"$subject\" jonnam2@gmail.com");
    
    $facilityName = mysqli_real_escape_string($db, $facilityName);
    $recipient = mysqli_real_escape_string($db, $recipient);
    $subject = mysqli_real_escape_string($db, $subject);
    $content = mysqli_real_escape_string($db, substr($content, 0, 80));
    $logInsertQuery = "INSERT INTO Log (`Date`, Receiver, Sender, Subject, Body) VALUES(NOW(), '$recipient', '$facilityName', '$subject', '$content')";
    $logInsertArray[$i] = $logInsertQuery;
    $i++;
}
mysqli_free_result($r);


while (mysqli_next_result($db)) {;}

foreach ($logInsertArray as $query){
    $res = mysqli_query($db, $query);
}
echo("$i emails were sent at " . date('m/d/Y h:i:s a') . "\n");

// crontab commands to execution every 30 seconds
// * * * * * /encs/pkg/php-5.5.38/root/bin/php -f /home/j/j_perl/353email/email-schedule.php >/dev/null 2>&1
// * * * * * (sleep 30; /encs/pkg/php-5.5.38/root/bin/php -f /home/j/j_perl/353email/email-schedule.php) >/dev/null 2>&1
?>