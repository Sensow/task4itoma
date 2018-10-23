<?php
class DBController {
	public $conn = NULL;
	private $host = "localhost";
	private $user = "root";
	private $password = "";
	private $database = "task4itoma";

	function __construct() {
		$conn = $this->connectDB();
		if(!empty($conn)) {
			$this->conn = $conn;			
		}
	}

    /**
    * 
    * Connects to MySQL database
    *
    * @return object
    */
	function connectDB() {
		$conn = mysqli_connect($this->host, $this->user, $this->password, $this->database);
		return $conn;
	}

    /**
    * 
    * Executes given query
    *
    * @param string $query - SQL query string
    * @return array
    */
	function execQuery($query) {
        $conn = $this->connectDB();    
        $result = mysqli_query($conn, $query);
        if (!$result) {
            //check for duplicate entry
            if($conn->errno == 1062) {
                return false;
            } else {
                trigger_error(mysqli_error($conn), E_USER_NOTICE);
            }
        }		
        $affectedRows = mysqli_affected_rows($conn);
		return $affectedRows;
    }

    /**
    * 
    * Executes given select query
    *
    * @param string $query - SQL select query string
    * @return array
    */
	function execSelectQuery($query) {
		$result = mysqli_query($this->conn,$query);
		while($row=mysqli_fetch_assoc($result)) {
			$resultset[] = $row;
		}
		if(!empty($resultset))
			return $resultset;
	}
}
?>
