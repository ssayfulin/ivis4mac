<?php
include "../connect.inc";
include "../sign.inc";

// open connection mysql
$connect = new connect();
$service = $connect->setConnection();
// TODO : verification adding sign

$newSign ="";
if(isset($_GET['nameSign']))
{
	$newSign = $_GET['nameSign'];
}

$idSign = 0;
if(isset($_GET['idSign']))
{
	$idSign = $_GET['idSign'];
}
// add new sign
$pr = new sign();
$result = $pr->addNewSign($service, $idSign, $newSign);

// create select 
createSelect($service,$idSign);

// close connection mysql
$connect->closeConnection($service);

function createSelect($service,$value,$newSign)
{
	$pr = new sign();
	$dataBDD = $pr->getSign($service, $value);

	$b = $dataBDD[1];
	echo '<select id="list" onChange="onChange()">\n';
	for($i=0; $i < sizeof($b); $i++)
	{
		$show = $b[$i];
		echo "<option value=".$i.">".$show."</option>\n";
	}
	echo "<option value=".$i++.">добавить</option>\n";
	echo "</select>\n";
};
?>
