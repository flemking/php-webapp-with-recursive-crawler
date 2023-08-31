# PHP web app with Recursive crawling feature

## Setup

- Copy the files to your MAMP or XAMPP root directory.
  - You can do this by running while in the root directory: `git clone https://github.com/flemking/php-webapp-with-recursive-crawler.git .`.
- Next, add a database named `webapp` to your MySQL admin panel.
- Then _import_ the data using the .sql file, you can find it here: `db/webapp.sql`.

## Usage

- Login as an admin using the credentials: `admin:admino`.
- Go to the Admin page and launch the Crawler.
  - Click on the `See Results` button to see the Crawling results:
  - You can see all the internal links inside the homepage listed as `<h2>`s and
    all the links inside those pages in a list blow them.
- Visit the created `sitemap.html` file at localhost:PORT/**sitemap.html**.
