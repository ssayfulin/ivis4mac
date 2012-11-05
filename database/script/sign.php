<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
		<title>MAMP</title>
	</head>
	<body>
<?php

include "connect.inc";
include "sign.inc";

// open connection mysql
$connect = new connect();
$service = $connect->setConnection();

$pr = new sign();
 
echo "<table><tr>";

// $a = $pr->getSign($service, 1);
// showSign($a);

// echo "</td><td>";
// $a = $pr->getSign($service, 2);
// showSign($a);
// echo "</td><td>";

// $a = $pr->getSign($service, 3);
// showSign($a);
// echo "</td><td>";
// $a = $pr->getSign($service, 4);
// showSign($a);
// echo "</td><td>";
// $a = $pr->getSign($service, 5);
// showSign($a);
// echo "</td><td>";
// $a = $pr->getSign($service, 6);
// showSign($a);
// echo "</td><td>";

for($k=0; $k < 19; $k++)
{
	echo "<td>";
	$a = $pr->getSign($service, $k);
	showSign($a);
	echo "</td>";
}

echo "</tr></table>";
	
$pr->setSign($service,2,2,1);	
	
// close connection mysql
$connect->closeConnection($service);


function showSign($value)
{
	echo "<b> $value[0] </b>";
	echo "<br>";
	$b = $value[1];
	echo "<select>";
	for($i=0; $i < sizeof($b); $i++)
	{
		$show = $b[$i];
		echo "<option value=".$i.">".$show."</option>";
	}
	echo "<option value=".$i++.">добавить</option>";
	echo "</select>";
};

?>
	</body>
</html>