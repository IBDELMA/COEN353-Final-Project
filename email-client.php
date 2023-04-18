<?php
include "init_db.php";
date_default_timezone_set('America/Toronto');
mysqli_query($db, "LOCK TABLES MailStack READ");
$r = mysqli_query($db, "SELECT * FROM MailStack");
// MailStack: {`Facility Name`, Recipient, Subject, Content}

$assoc = mysqli_fetch_assoc($r);
if (!$assoc){
    mysqli_free_result($r);
    mysqli_query($db, "UNLOCK TABLES");
    exit("No emails to send at this moment.\n");
}

$i = 0;
$logInsertArray = array();
while (!is_null($assoc)){
    $facilityName = $assoc["Facility Name"];
    $recipient = $assoc["Recipient"];
    $subject = $assoc["Subject"];
    $content = $assoc["Content"];
    $shellOutput = shell_exec("echo \"$content\" | mail -s \"$subject\" jonnam2@gmail.com");
    
    $facilityName = mysqli_real_escape_string($db, $facilityName);
    $recipient = mysqli_real_escape_string($db, $recipient);
    $subject = mysqli_real_escape_string($db, $subject);
    $content = mysqli_real_escape_string($db, substr($content, 0, 80));
    $logInsertQuery = "INSERT INTO Log (`Date`, Receiver, Sender, Subject, Body) VALUES(NOW(), '$recipient', '$facilityName', '$subject', '$content')";
    $logInsertArray[$i] = $logInsertQuery;
    $i++;
    $assoc = mysqli_fetch_assoc($r);
}
mysqli_free_result($r);

mysqli_multi_query($db, "UNLOCK TABLES; DELETE FROM MailStack;");
while (mysqli_next_result($db)) {;}

foreach ($logInsertArray as $query){
    $res = mysqli_query($db, $logInsertQuery);
}
echo("$i emails were sent at " . date('m/d/Y h:i:s a') . "\n");

// crontab commands to execution every 30 seconds
// * * * * * /encs/pkg/php-5.5.38/root/bin/php -f /home/j/j_perl/353email/email-test.php >/dev/null 2>&1
// * * * * * (sleep 30; /encs/pkg/php-5.5.38/root/bin/php -f /home/j/j_perl/353email/email-test.php) >/dev/null 2>&1
?>
