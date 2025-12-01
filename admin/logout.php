<?php
include '../lib/session.php';
Session::init();
session_destroy();
header("Location:../login.php");
exit;


