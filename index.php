<!DOCTYPE html>
<html>
<body>

<h1>Itoma Practical Task</h1>

<style>
	table, th, td {
	    border: 1px solid #000000;
	    padding: 8px;
	}
</style>

<table>
	<thead>
		<th>Number</th>
		<th>Year</th>
		<th>Model</th>
		<th>Current owner</th>
		<th>Status</th>
		<th>Ex owner</th>
	</thead>
	<tbody>
	<?php
		require_once("CarManager.php");
		$cm = new CarManager();
		$cars = $cm->getCarsList();

		foreach($cars as $car)
		{
			?>
			<tr>
				<td><?php echo $car['cnumber']; ?></td>
				<td><?php echo $car['cmade']; ?></td>
				<td><?php echo $car['cmodel']; ?></td>
				<td><?php echo $car['cowner']; ?></td>
				<td><?php echo $car['cstatus']; ?></td>
				<td><?php echo $car['cex']; ?></td>
			</tr>
			<?php
		}
	?>
	</tbody>
</table>

</body>
</html>
