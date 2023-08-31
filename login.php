<?php

/**
 * Login
 * 
 * PHP version 7.4
 * 
 * @category Web_Application
 * @package  Crawler
 * @author   JB <flemking@flemking.com>
 * @license  MIT License
 * @link     http://flemking.com.
 */

/**
 * Implements session_start().
 */
require "db/dbconnect.php";
session_start();
?>
<?php
if (isset($_POST['submit'])) {

    $username = $_POST['username'];
    $password = $_POST['password'];

    /* Check login  correctness and if admin*/
    $query = "SELECT * FROM users WHERE username='$username' AND password='$password'";
    $result = mysqli_query($connection, $query);

    /* query failed */
    if ($result == false) {
        printf("Query failed \n");
        header("location:login.php");
    }

    if (mysqli_num_rows($result) == 1) {
        $_SESSION["username"] = mysqli_real_escape_string($connection, $username);
        $_SESSION["password"] = mysqli_real_escape_string($connection, $password);
        /* user type */
        $detail = mysqli_fetch_assoc($result);
        $_SESSION['usertype'] = $detail['usertype'];

        echo "<div class=\"alert alert-success container\" role=\"alert\">
        <span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span>
        <span class=\"sr-only\">Welcome:</span>
        You're connected
        </div>
        ";

        header('Location: ' . 'admin.php');
    } else {
        echo "<div class=\"alert alert-danger container\" role=\"alert\">
	  <span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span>
	  <span class=\"sr-only\">Error:</span>
	   Invalid Username or Password
		</div>
		";
    }
}

if (isset($_POST['logout'])) {
    // header('Location: ' . $_SERVER['REQUEST_URI']);
    session_destroy();
    header('Location: ' . 'index.php');
}
?>

<?php
require 'includes/header.php';
if (isset($_SESSION['username'])) {
?>
    <form class="w-fit bg-white shadow-md rounded p-8 mx-auto" style="width: fit-content; padding: 20px; margin-top: 20px;" action="login.php" method="POST">
        <button type="submit" style="background-color: #FFCC00;" class="bg-blue hover:bg-blue-700 text-gray font-bold py-2 px-4 my-3 rounded" name="logout">Logout</button>
    </form>

<?php } else { ?>
    <div class="w-full">
        <form class="w-fit bg-white shadow-md rounded p-8 mx-auto" style="width: fit-content; padding: 20px; margin-top: 20px;" action="login.php" method="POST">
            <div class=" text-gray-700 text-sm font-bold mb-2">
                <input type="text" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" placeholder="Username" name="username">
            </div>
            <div class=" text-gray-700 text-sm font-bold mb-2">
                <input type="password" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" placeholder="Password" name="password">
            </div>
            <button type="submit" style="background-color: #FFCC00;" class="bg-blue hover:bg-blue-700 text-gray font-bold py-2 px-4 my-3 rounded" name="submit">Sign In</button>
        </form>
    </div>
<?php
}
?>

<?php

require 'includes/footer.php';
