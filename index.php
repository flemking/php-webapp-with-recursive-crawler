<?php

/**
 * Homepage
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
$page_title = 'Homepage';
require 'includes/header.php';
require 'db/dbconnect.php';
?>

<!-- Main News Slider Start -->
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-7 px-0">
            <div class="owl-carousel main-carousel position-relative">
                <?php
                $query = "SELECT * FROM posts ORDER BY postTime DESC LIMIT 3";
                $result = mysqli_query($connection, $query);
                if (mysqli_num_rows($result) > 0) {
                    while ($post = mysqli_fetch_assoc($result)) {
                        $id = $post['postID'];
                        $title = $post['postTitle'];
                        $desc = $post['postDesc'];
                        $tags = $post['postTag'];
                        $author = $post['postAuthor'];
                        $time = $post['postTime'];
                        $img = $post['post_img'];
                        $category = $post['post_cat'];
                ?>
                        <div class="position-relative overflow-hidden" style="height: 500px;">
                            <img class="img-fluid h-100" src=<?php echo $img ?> style="object-fit: cover;">
                            <div class="overlay">
                                <div class="mb-2">
                                    <a class="badge badge-primary text-uppercase font-weight-semi-bold p-2 mr-2" href=<?php echo "single.php?id=";
                                                                                                                        echo $id; ?>><?php echo $category ?></a>
                                    <a class="text-white" href=<?php echo "single.php?id=";
                                                                echo $id; ?>><?php echo $time ?></a>
                                </div>
                                <a class="h2 m-0 text-white text-uppercase font-weight-bold" href=<?php echo "single.php?id=";
                                                                                                    echo $id; ?>><?php echo $title ?></a>
                            </div>
                        </div>
                <?php
                        // include("includes/post_slide.php");
                    }
                }

                ?>
            </div>
        </div>

        <div class="col-lg-5 px-0">
            <div class="row mx-0">
                <?php
                $query = "SELECT * FROM posts ORDER BY postTime DESC LIMIT 4";
                $result = mysqli_query($connection, $query);

                if (mysqli_num_rows($result) > 0) {
                    while ($post = mysqli_fetch_assoc($result)) {
                        $id = $post['postID'];
                        $title = $post['postTitle'];
                        $desc = $post['postDesc'];
                        $tags = $post['postTag'];
                        $author = $post['postAuthor'];
                        $time = $post['postTime'];
                        $img = $post['post_img'];
                        $category = $post['post_cat'];
                ?>
                        <div class="col-md-6 px-0">
                            <div class="position-relative overflow-hidden" style="height: 250px;">
                                <img class="img-fluid w-100 h-100" src=<?php echo $img ?> style="object-fit: cover;">
                                <div class="overlay">
                                    <div class="mb-2">
                                        <a class="badge badge-primary text-uppercase font-weight-semi-bold p-2 mr-2" href=<?php echo "single.php?id=";
                                                                                                                            echo $id; ?>><?php echo $category ?></a>
                                        <a class="text-white" href=<?php echo "single.php?id=";
                                                                    echo $id; ?>><small><?php echo $time ?></small></a>
                                    </div>
                                    <a class="h6 m-0 text-white text-uppercase font-weight-semi-bold" href=<?php echo "single.php?id=";
                                                                                                            echo $id; ?>><?php echo $title ?></a>
                                </div>
                            </div>
                        </div>
                <?php }
                } ?>
            </div>
        </div>
    </div>
</div>
<!-- Main News Slider End -->


<!-- Breaking News Start -->
<div class="container-fluid bg-dark py-3 mb-3">
    <div class="container">
        <div class="row align-items-center bg-dark">
            <div class="col-12">
                <div class="d-flex justify-content-between">
                    <div class="bg-primary text-dark text-center font-weight-medium py-2" style="width: 170px;">Breaking News</div>
                    <div class="owl-carousel tranding-carousel position-relative d-inline-flex align-items-center ml-3" style="width: calc(100% - 170px); padding-right: 90px;">
                        <?php
                        $query = "SELECT * FROM posts ORDER BY postTime DESC";
                        $result = mysqli_query($connection, $query);

                        if (mysqli_num_rows($result) > 0) {
                            while ($post = mysqli_fetch_assoc($result)) {
                                $id = $post['postID'];
                                $title = $post['postTitle'];
                                $desc = $post['postDesc'];
                                $tags = $post['postTag'];
                                $author = $post['postAuthor'];
                                $time = $post['postTime'];
                                $img = $post['post_img'];
                                $category = $post['post_cat'];
                        ?>

                                <div class="text-truncate"><a class="text-white text-uppercase font-weight-semi-bold" href=<?php echo "single.php?id=";
                                                                                                                            echo $id; ?>><?php echo $title ?></a></div>
                        <?php }
                        } ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breaking News End -->


<!-- Featured News Slider Start -->
<div class="container-fluid pt-5 mb-3">
    <div class="container">
        <div class="section-title">
            <h4 class="m-0 text-uppercase font-weight-bold">Featured News</h4>
        </div>
        <div class="owl-carousel news-carousel carousel-item-4 position-relative">
            <?php
            $query = "SELECT * FROM posts ORDER BY postTime DESC";
            $result = mysqli_query($connection, $query);

            if (mysqli_num_rows($result) > 0) {
                while ($post = mysqli_fetch_assoc($result)) {
                    $id = $post['postID'];
                    $title = $post['postTitle'];
                    $desc = $post['postDesc'];
                    $tags = $post['postTag'];
                    $author = $post['postAuthor'];
                    $time = $post['postTime'];
                    $img = $post['post_img'];
                    $category = $post['post_cat'];
            ?>
                    <div class="position-relative overflow-hidden" style="height: 300px;">
                        <img class="img-fluid h-100" src=<?php echo $img ?> style="object-fit: cover;">
                        <div class="overlay">
                            <div class="mb-2">
                                <a class="badge badge-primary text-uppercase font-weight-semi-bold p-2 mr-2" href=<?php echo "single.php?id=";
                                                                                                                    echo $id; ?>><?php echo $category ?></a>
                                <a class="text-white" href=<?php echo "single.php?id=";
                                                            echo $id; ?>><small><?php echo $time ?></small></a>
                            </div>
                            <a class="h6 m-0 text-white text-uppercase font-weight-semi-bold" href=<?php echo "single.php?id=";
                                                                                                    echo $id; ?>><?php echo $title ?></a>
                        </div>
                    </div>
            <?php
                }
            } ?>
        </div>
    </div>
</div>
<!-- Featured News Slider End -->


<?php
require 'news_sidebar.php';
require 'includes/footer.php';
