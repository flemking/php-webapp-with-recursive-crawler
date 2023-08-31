<?php

function crawl_page($url)
{
    $curl = curl_init();
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_TIMEOUT, 10);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    $result = curl_exec($curl);
    curl_close($curl);

    if ($result) {
        echo $result;
        //Create a new DOM document
        $dom = new DOMDocument();

        @$dom->loadHTML($result);

        $links = $dom->getElementsByTagName('a');

        $internalLinks = [];
        foreach ($links as $link) {
            $text = $link->nodeValue;
            $href = $link->getAttribute('href');
            // echo $href . "<br>";

            // Check if the URL is not starting with "http" or contains a "/"
            if (strpos($href, $url) === 0 || strpos($href, '/') === 0 || strpos($href, "http") !== 0) {
                $internalLinks[$href] = str_replace("'", "", $text);
            }
        }
        // Remove duplicate internal links
        $uniqueInternalLinks = array_unique($internalLinks);
        $uniqueInternalLinks = array_diff($uniqueInternalLinks, ["#", "/", "javascript:;", ""]);

        return $uniqueInternalLinks;
    } else {
        echo "URL issue";
    }
    /*
    if ($result) {
        // echo $result;
        $stripped_file = strip_tags($result, "<>");
        preg_match_all("/<a[\s]+[^>]*?href[\s]?=[\s\"\']+" . "(.*?)[\"\']+.*?>" . "([^<]+|.*?)?<\/a>/", $stripped_file, $matches, PREG_SET_ORDER);
        foreach ($matches as $match) {
            $href = $match[1];
            if (0 !== strpos($href, 'http')) {
                $path = '/' . ltrim($href, '/');
                // if (extension_loaded('http')) {
                //     $href = http_build_url($href, array('path' => $path));
                // } else {
                //     $parts = parse_url($href);
                //     $href = $parts['scheme'] . '://';
                //     if (isset($parts['user']) && isset($parts['pass'])) {
                //         $href .= $parts['user'] . ':' . $parts['pass'] . '@';
                //     }
                //     $href .= $parts['host'];
                //     if (isset($parts['port'])) {
                //         $href .= ':' . $parts['port'];
                //     }
                //     $href .= $path;
                // }
                echo $path . '<br>';
            }
            // crawl_page($href, $depth - 1);
        }
    } */
}

function start_crawler($url, $base_url = "http://localhost:8888", $depth = 0, $maxDepth = 1, &$crawledLinks = [])
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
            // echo $subLink;
            if (strpos($subLink, '#') === 0) {
                continue;
            }
            if (strpos($subLink, $base_url) === 0) {
                $subsLinks[$subLink] = start_crawler($subLink, '', $depth + 1, $maxDepth, $crawledLinks);
            } elseif (strpos($subLink, '/') === 0) {
                $subLinks[$subLink] = start_crawler("$base_url$subLink", '', $depth + 1, $maxDepth, $crawledLinks);
            } else {
                $subLinks[$subLink] = start_crawler("$base_url/$subLink", '', $depth + 1, $maxDepth, $crawledLinks);
            }
        }
        return $subLinks;
        // return $uniqueInternalLinks;
    } else {
        return [];
    }
}

// crawl_page('http://' . $_SERVER['HTTP_SELF'] . '/blog');
// var_dump(start_crawler("http://localhost:8888"));
// var_dump(start_crawler("https://flemking.com/contact-page/"));
// var_dump($_SERVER['HTTP_HOST']);
// echo "Hello World";

$crawl_data = start_crawler("http://localhost:8888");
// $crawl_data = start_crawler("http://crawl.local", "http://crawl.local");

function generate_link_list_html($data)
{
    if (empty($data)) {
        return '';
    }

    $html = '<ul>';
    foreach ($data as $current_url => $subData) {
        // $baseurl = $_SERVER['HTTP_HOST'];
        $html .= '<li>';
        $html .= "<a href=$current_url>$current_url</a>";
        $html .= generate_link_list_html($subData);
        $html .= '</li>';
    }
    $html .= '</ul>';

    return $html;
}

// foreach ($crawl_data as $current_url => $data) {
//     echo '<div class="link-container">';
//     echo '<h2>' . $current_url . '</h2>';
//     echo generate_link_list_html($data);
//     echo '</div>';
// }

echo "\nfull data: ";
var_dump($crawl_data);


// include('footer.php');
