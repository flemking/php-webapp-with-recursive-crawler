<?php

/**
 * Admin interface
 * 
 * PHP version 7.4
 * 
 * @category Web_Application
 * @package  Crawler
 * @author   JB <flemking@flemking.com>
 * @license  MIT License
 * @link     http://flemking.com.
 */

require 'includes/header.php';
require 'db/dbconnect.php';
if (!isset($_SESSION["username"])) {
    echo 'Access denied';
    exit();
}
?>

<form class="w-fit bg-white shadow-md rounded p-8 mx-auto flex flex-col" style="width: fit-content; padding: 20px; margin-top: 20px;" action="admin.php" method="POST">
    <button type="submit" style="background-color: #FFCC00;" class="bg-blue hover:bg-blue-700 text-gray font-bold py-2 px-4 my-3 rounded" name="crawl">Start Crawler</button>
    <?php
    if (file_exists("sitemap.html")) {
        echo "<a class='m-auto p-1' href='/sitemap.html'>Check out the sitemap</a>";
    } else {
        echo "No Sitemap available";
    } ?>
</form>

<?php
$sitemap_query = "SELECT * FROM sitemap";
$sitemap_result = mysqli_query($connection, $sitemap_query);
if ($_SESSION['sitemap'] == true) { ?>
    <form class="w-fit bg-white shadow-md rounded p-8 mx-auto flex flex-col mt-3" style="width: fit-content; padding: 20px; margin-top: 20px;" action="admin.php" method="POST">
        <button type="submit" style="background-color: #FFCC00;" class="bg-blue hover:bg-blue-700 text-gray font-bold py-2 px-4 my-3 rounded" name="results">
            See results
        </button>
    </form><?php } ?>
<div style="display: flex; justify-content: space-between; flex-wrap: wrap; padding: 5rem;">
    <?php
    if (isset($_POST['results'])) {
        if (mysqli_num_rows($sitemap_result) > 0) {
            echo "<h1 style='flex: 1; flex-basis: 100%; text-align: center; margin-bottom: 3rem;'> HomePage </h1>";
            while ($link = mysqli_fetch_assoc($sitemap_result)) {
                $text = unserialize($link['text']);
                $url = $link['url'];
                echo '<div style="flex-basis: 20%">';
                echo '<h2>' . $url . '</h2>';
                echo Generate_Link_List_html($text);
                echo '</div>';
            }
        }
    }
    ?>
</div>
<?php



/**
 * Implements the crawling script.
 * 
 * @param string $url          // URL to crawl
 * @param string $base_url     // Basename
 * @param int    $depth        // Current Depth
 * @param int    $maxDepth     // Maximum depth
 * @param array  $crawledLinks // List of seen links
 * 
 * @return array
 */
function Start_crawler($url, $base_url, $depth = 0, $maxDepth = 1000, &$crawledLinks = [])
{
    if ($depth > $maxDepth || in_array($url, $crawledLinks)) {
        return []; // Stop crawling when maximum depth is reached (also prevent infinite loops)
    }
    $crawledLinks[] = $url;

    $curl = curl_init();
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_TIMEOUT, 10);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    $result = curl_exec($curl);
    curl_close($curl);

    if ($result) {
        //Create a new DOM document
        $dom = new DOMDocument();

        @$dom->loadHTML($result);

        $links = $dom->getElementsByTagName('a');
        $internalLinks = [];
        foreach ($links as $link) {
            $text = $link->nodeValue;
            $href = $link->getAttribute('href');

            // Check if the URL is not starting with "http" or contains a "/"
            if (strpos($href, $url) === 0 || strpos($href, '/') === 0 || strpos($href, "http") !== 0) {
                $internalLinks[$href] = str_replace("'", "", $text);
            }
        }
        // Remove duplicate internal links
        $uniqueInternalLinks = array_unique($internalLinks);
        $uniqueInternalLinks = array_diff_key($uniqueInternalLinks, ["#" => "", "/" => "", "javascript:;" => "", "" => "", "javascript:void(0);" => ""]);


        $subLinks = [];
        foreach ($uniqueInternalLinks as $subLink => $subText) {
            if (strpos($subLink, $base_url) === 0) {
                $subsLinks[$subLink] = Start_crawler($subLink, '/', $depth + 1, $maxDepth, $crawledLinks);
            } elseif (strpos($subLink, '/') === 0) {
                $subLinks[$subLink] = Start_crawler("$base_url$subLink", '/', $depth + 1, $maxDepth, $crawledLinks);
            } else {
                $subLinks[$subLink] = Start_crawler("$base_url/$subLink", '/', $depth + 1, $maxDepth, $crawledLinks);
            }
        }
        return $subLinks;
    } else {
        return [];
    }
}

if (isset($_POST['crawl'])) {
    // Deleting existing sitemap data
    $del_query = "DELETE FROM sitemap";
    $del_result = mysqli_query($connection, $del_query);

    // checking for sitemap and removing it
    $sitemap = "sitemap.html";
    if (file_exists($sitemap)) {
        $success = unlink($sitemap);
        if (!$success) {
            throw new Exception("Cannot delete $sitemap");
        }
    }
    // Writing the head of the sitemap
    $file = fopen($sitemap, "w") or die("Unable to open file!");
    $sitemap_html = '<h1> HomePage Sitemap </h1><br>';

    foreach (Start_crawler($_SERVER['HTTP_HOST'], $_SERVER['HTTP_HOST']) as $the_url => $the_sub_urls) {

        $sitemap_html .= '<div class="link-container">';
        $sitemap_html .= '<h2>' . $the_url . '</h2>';
        $sitemap_html .= Generate_Link_List_html($the_sub_urls);
        $sitemap_html .= '</div>';

        // saving to DB
        $value = serialize($the_sub_urls);
        $query = "INSERT INTO sitemap (text, url) VALUES ('$value','$the_url')";
        $result = mysqli_query($connection, $query);

        /* query failed */
        if (empty($result)) {
            printf("One Query failed - Please retry \n");
        }
    }

    // End of the site map
    fwrite($file, $sitemap_html);
    fclose($file);

    echo "<meta http-equiv='refresh' content='0'>";
}

/**
 * Implements the crawling script.
 * 
 * @param array $data // URL to crawl
 * 
 * @return string
 */
function Generate_Link_List_html($data)
{
    if (empty($data)) {
        return '';
    }

    $html = '<ul>';
    foreach ($data as $current_url => $subData) {
        $html .= '<li>';
        $html .= "<a href=$current_url>$current_url</a>";
        $html .= Generate_Link_List_html($subData);
        $html .= '</li>';
    }
    $html .= '</ul>';

    return $html;
}

require 'includes/footer.php';
