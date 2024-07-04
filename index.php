<?php
include 'reusable/connect.php';

// Query to retrieve data with a join
$sql = "SELECT bookid, title, authorname, price, publisheddate, coverimageurl
        FROM books
        JOIN authors ON books.authorid = authors.authorid";
$result = mysqli_query($connect, $sql);
// displauing the data from the database in a variable of results 
if (mysqli_num_rows($result) > 0) {
    echo "<!DOCTYPE html>
    <html>
    <head>
        <title>Book List</title>
        <link rel='stylesheet' type='text/css' href='reusable/style.css'>
    </head>
<body>                          
    <div><h1>Book List</h1>";
    echo "<div class='main-container'>";
        // Output data of each row
        echo "<div class='book-container'>";
            // the while loop to loop through all the content in the books table and relate it to the author
            while ($row = mysqli_fetch_assoc($result)) {
                echo "<div class='book-item'>";
                // displauing the book title as varchar 
                echo "<h2>" . $row["title"] . "</h2>";
                // author name being varchar as a foreign key using the author id
                echo "<p><strong>Author:</strong> " . $row["authorname"] . "</p>";

                // Conditional formatting based on price
                if ($row["price"] > 20) {
                    // if its above $20 its red, showing expensive as decimal datatype
                    echo "<p class='expensive'>Price: $" . $row["price"] . "</p>";
                } else {
                    // if its less than $20 its green, showing afforable as decimal datatype
                    echo "<p class='affordable'>Price: $" . $row["price"] . "</p>";
                }
                // date the book was published using date datatype in the database
                echo "<p><strong>Published Date:</strong> " . $row["publisheddate"] . "</p>";
                // an image logo related to the book
                echo "<img src='" . $row["coverimageurl"] . "' alt='" . $row["title"] . "'>";
                echo "</div>";
            }
        echo "</div>";
    echo "</div>";
    echo "
    </body>
    </html>";
} else {
    echo "0 results";
}

$connect->close();
?>