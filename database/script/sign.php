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
$a = $pr->getSign($service, 6);
showSign($a);

$a = $pr->getSign($service, 5);
showSign($a);

$a = $pr->getSign($service, 2);
showSign($a);
	
	
$pr->setSign($service,2,2,1);	
	
// close connection mysql
$connect->closeConnection($service);




function showSign($value)
{
	echo "<p>-------------</p>";	
	echo "<b> $value[0] </b>";
	echo "<br>";
	$b = $value[1];
	for($i=0; $i < sizeof($b); $i++)
	{
		$show = $b[$i];
		echo "<br>";
		echo $show;
	}
};
?> 


	</body>
</html>