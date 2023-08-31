# Explanation

## **The problem to be solved in my own words**

- Create a dynamic web app with a backend admin access page
  where the admin can login, trigger a button that will
  run a script that crawls the homepage(ideally the entire website)
  for internal links and view the result of the crawl.
- The crawl script should update the sitemap page
  and store the result temporarily in a database
- Visitors(non-admins) should be able to view the sitemap page.

## **A technical spec of how I will solve it**

- Set up the database to store the crawling results
- Create a dynamic web app that will be crawled
- Create the admin interface
- Write the crawl script

## **The technical decisions I made and why**

- I will be using MySQL for the database: because I'm using MAMP for my local environment
- I used an HTML template to create the scaffolding of the website to gain time.
- I have also make sure to not use any php third party libraries to showcase my native php coding abilities.
- I decided to not create a sign up form for the admin interface since we don't need new admins.

## **How the code itself works and why**

Most of the crawl script can be found inside the admin.php file.

I made sure to protect the `admin.php` file from users accessing it without the admin privileges.
So here's how the code works:

- First I scrap the homepage using `curl` (code below).

  ```php
    $curl = curl_init();
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_TIMEOUT, 10);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    $result = curl_exec($curl);
    curl_close($curl);
  ```

- Then I create a DOM element using the html response I got.
- After that I extract the links by targeting the `<a>` tags (as you can see below):

  ```php
  $dom = new DOMDocument();
  @$dom->loadHTML($result);
  $links = $dom->getElementsByTagName('a');
  ```

- I then filter all the links and only keep those who are internal links
- Finally I store them temporaly to the database and use them to create the sitemap file.

## **How the solution achieves the admin’s desired outcome per the user story**

To summerize the solution needed in one sentence: I need the admin of the website to be able to see a list of all the internal links inside the homepage and generate a sitemap.html file that can be viewed by any user.

Here is how I achieved that:

- The admin of the website can login using the login page:
  ![Login Page](./screenshots/Homepage%20-%20login.png)
  ![Login Creds](./screenshots/Login%20page.png)

- When logged in, the admin can click on the big yellow button to launch the crawl session.
- After the crawl is done, the admin can see the results by clicking on the `See Results` button.
  ![Launch Crawl](./screenshots/AdminPage%20Before%20Crawl.png)
  ![Launch Crawl](./screenshots/Admin%20page%20-%20After%20Crawl.png)

- Anyone can also see the sitemap.html file.

- Notice that the admin can also logout.

## What I wasn't able to accomplish or make correctly work (yet)

`🔻 It’s built with modern OOP with PSR. It uses procedural where it makes sense.` =>
I did use OOP most of the time, but I'm not sure if I used Procedural where it makes sense. I started learning more about that.

`🔻 Your app or plugin passes phpcs inspection.` =>
I fixed most of the phpcs inspection issues but I'm searching for a way to make it automatically fix everything. I'm using vscode but I couldn't make the formatting plugins work: may be it's the way my computer is set up, I'll surely find a solution soon.

`🔻 Automatically test that your code works as expected by writing unit and integration tests.` =>
I don't have experience write test for PHP, I know we use PHPUnit to write tests. I'm investing some time this week to learn it.

`🔻 Wire your GitHub repo to Travis CI.` =>
Learning how to do that effectively.

`🔻 It’s built using our package template (see the README.md).` =>
I couldn't correctly setup the package template: want to ask for help about this.
