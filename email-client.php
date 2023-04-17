<?php
include "init_db.php";
mysqli_query($db, "LOCK TABLES MailStack READ");
$r = mysqli_query($db, "SELECT * FROM MailStack");
// MailStack: {`Facility Name`, Recipient, Subject, Content}

$assoc = mysqli_fetch_assoc($r);
if (!$assoc){
    mysqli_free_result($r);
    mysqli_query($db, "UNLOCK TABLES");
    exit("No emails to send at this moment.");
}
$i = 0;
while (!is_null($assoc)){
    $content = $assoc["Content"];
    $subject = $assoc["Subject"] . " TO: " . $assoc["Recipient"];
    $shellOutput = shell_exec("echo \"$content\" | mail -s \"$subject\" jonnam2@gmail.com");
    $i++;
    $assoc = mysqli_fetch_assoc($r);
}
mysqli_free_result($r);
mysqli_multi_query($db, "UNLOCK TABLES; DELETE FROM MailStack;");
date_default_timezone_set('America/Toronto');
echo("$i emails were sent at " . date('m/d/Y h:i:s a'));
?>
