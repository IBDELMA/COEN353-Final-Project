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
    $facilityName = mysqli_real_escape_string($db, $assoc["Facility Name"]);
    $recipient = mysqli_real_escape_string($db, $assoc["Recipient"]);
    $subject = mysqli_real_escape_string($db, $assoc["Subject"]);
    $content = mysqli_real_escape_string($db, $assoc["Content"]);

    $shellOutput = shell_exec("echo \"$content\" | mail -s \"$subject\" jonnam2@gmail.com");
    $logInsertQuery = "INSERT INTO Log (`Date`, Receiver, Sender, Subject, Body) VALUES(CURDATE(), '$recipient', '$facilityName', '$subject', '$content')";
    $logInsertArray[$i] = $logInsertQuery;
    $i++;
    $assoc = mysqli_fetch_assoc($r);
}
mysqli_free_result($r);

mysqli_multi_query($db, "UNLOCK TABLES; DELETE FROM MailStack;");
while (mysqli_next_result($db)) {;}

foreach ($logInsertArray as $query){
    echo($logInsertQuery. "\n");
    $res = mysqli_query($db, $logInsertQuery);
    if ($res){
        echo("Success!\n");
    }
}
echo("$i emails were sent at " . date('m/d/Y h:i:s a') . "\n");
?>
