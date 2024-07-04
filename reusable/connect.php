<!-- connecting the connection string -->
<?php
$connect = mysqli_connect('localhost', 'root', 'root', 'publishedbooks');
      if(!$connect){
        die("Connection Failed: " . mysqli_connect_error());
      }