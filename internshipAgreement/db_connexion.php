<?php
function OpenCon()
{
    $dbhost = "localhost";
    $dbuser = "root";
    $dbpass = "";
    $db = "hdm";

    $conn = new mysqli($dbhost, $dbuser, $dbpass, $db) or die("Connect failed: %s\n" . $conn->error);
    //$conn->set_charset('utf8mb4');

    return $conn;
}
function CloseCon($conn)
{
    $conn->close();
}
