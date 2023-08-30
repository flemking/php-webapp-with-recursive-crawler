<?php

session_start();

// Connecting to the database
$connection = mysqli_connect("localhost", "root", "root", "webapp");

// Checking for an error
if (mysqli_error($connection)) {
    echo "Connection to database failed";
}

// deleting the temporal datas
$query = "DELETE FROM sitemap WHERE added_time < date_sub(now(), interval 1 hour)";
$result = mysqli_query($connection, $query);

if (empty($result)) {
    printf("One Query failed \n");
}

$sitemap_query = "SELECT * FROM sitemap";
$sitemap_result = mysqli_query($connection, $sitemap_query);
if (mysqli_num_rows($sitemap_result) > 0) {
    $_SESSION['sitemap'] = true;
} else {
    $_SESSION['sitemap'] = false;
}
