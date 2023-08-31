<?php

/**
 * Post_Slide
 * 
 * PHP version 7.4
 * 
 * @category Web_Application
 * @package  Crawler
 * @author   JB <flemking@flemking.com>
 * @license  MIT License
 * @link     http://flemking.com.
 */
?>

<div class="col-md-6 px-0">
    <div class="position-relative overflow-hidden" style="height: 250px;">
        <img class="img-fluid w-100 h-100" src=<?php echo $img ?> style="object-fit: cover;">
        <div class="overlay">
            <div class="mb-2">
                <a class="badge badge-primary text-uppercase font-weight-semi-bold p-2 mr-2" href=""><?php echo $category ?></a>
                <a class="text-white" href=""><small><?php echo $time ?></small></a>
            </div>
            <a class="h6 m-0 text-white text-uppercase font-weight-semi-bold" href=""><?php echo $title ?></a>
        </div>
    </div>
</div>