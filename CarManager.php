<?php
require_once("DBController.php");

Class CarManager {

    /**
    * 
    * Makes query and returns cars list in array
    *
    * @return array
    */
	public function getCarsList()
	{
		$dbcontroller = new DBController();

		$query = 'SELECT cars.number AS cnumber,
						 cars.year_made AS cmade,
						 cars.model AS cmodel,
						 IFNULL((SELECT users.name FROM users INNER JOIN car_management ON users.id=car_management.user_id WHERE cars.id=car_management.cars_id AND car_management.date_from <= NOW() AND car_management.date_to >= NOW() LIMIT 1),
						 		(SELECT segments.name FROM segments INNER JOIN car_management ON segments.id=car_management.segments_id WHERE cars.id=car_management.cars_id AND car_management.date_from <= NOW() AND car_management.date_to >= NOW() LIMIT 1))
						 		AS cowner,
						 statuses.name AS cstatus,
						 IFNULL((SELECT users.name FROM car_management LEFT JOIN users ON users.id=car_management.user_id WHERE cars.id=car_management.cars_id ORDER BY car_management.date_to DESC LIMIT 1, 1),
						 		(SELECT segments.name FROM car_management LEFT JOIN segments ON segments.id=car_management.segments_id WHERE cars.id=car_management.cars_id ORDER BY car_management.date_to DESC LIMIT 1, 1))
						 		AS cex
				  FROM cars
		          LEFT JOIN statuses ON statuses.id=(SELECT car_status.status_id FROM car_status WHERE cars.id=car_status.cars_id AND car_status.date_from <= NOW() AND car_status.date_to >= NOW() LIMIT 1)';

		return $dbcontroller->execSelectQuery($query);
	}

}

?>