<?php
class sign 
{
	
	// params : service - connected Database; idSign 
	function getSign($service, $idSign)
	{
		$result = null;
		$request = "SELECT s.description, sd.description FROM sign as s, sign_detail as sd WHERE s.id_sign = '$idSign' AND s.id_sign = sd.id_sign";

		if($resultat=mysqli_query($service,$request))
		{
			$ncols=mysqli_num_fields($resultat);
			$elm = 0;
			while($ligne = mysqli_fetch_array($resultat))
			{
				for($i=0; $i < $ncols; $i++)
				{
					$result[1][$elm] = $ligne[1];
					$result[0] = $ligne[0];
				}
				$elm++;
			}
		}
		return $result;
	}
	
	// params : service - connected Database; idPerson; idSign; idSignDetail
	function setSign($service, $idPerson, $idSign, $idSignDetail)
	{
		$query = "INSERT INTO person_to_sign VALUES(null,'$idPerson','$idSign','$idSignDetail')";
		$result = mysqli_query($service,$query);
		if (!$result) 
		{
    		$message  = 'Invalid query: ' . mysql_error() . "\n";
    		$message .= 'Whole query: ' . $query;
    		die($message);
		}
	}
	
	// params : service - connected Database; idSign; idSignDetail
	function addNewSign($service, $idSign, $idSignDetail)
	{
		$query = "INSERT INTO sign_detail VALUES(null,'$idSign','$idSignDetail')";
		$result = mysqli_query($service,$query);
		if (!$result) 
		{
    		$message  = 'Invalid query: ' . mysql_error() . "\n";
    		$message .= 'Whole query: ' . $query;
    		die($message);
		}
	}
	
	// params : service - connected Database; idSign; description - description the sign
	function hasSameSign($service, $idSign, $description)
	{
		$query = "SELECT s.description, sd.description FROM sign as s, sign_detail as sd WHERE s.id_sign = '$idSign' AND s.id_sign = sd.id_sign AND sd.description = '$description'";
		if($resultat = mysqli_query($service,$request))
		{
			return true;
		} else 
		{
			return false;
		}	
	}
	function test()
	{
		return "true";
	}

	
}
?> 
