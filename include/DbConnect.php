<?php
/**
 * Handling database connection
 *
 * @author Gayan Chathuranga <chathurangagc@gmail.com>
 * @link   http://cits.lk
 */
class DbConnect {

    private $conn;

    function __construct() {        
    }

    /**
     * Establishing database connection
     * @return database connection handler
     */
    function connect() {
        include_once dirname(__FILE__) . '/Config.php';

        // Connecting to mysql database
        $this->conn = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);

         // $this->conn = new PDO('mysql:host='.DB_HOST.';dbname='.DB_NAME, DB_USERNAME, DB_PASSWORD);
         // $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Check for database connection error
        if (mysqli_connect_errno()) {
            echo "Failed to connect to MySQL: " . mysqli_connect_error();
        }

        // returing connection resource
        return $this->conn;
    }

}

?>
