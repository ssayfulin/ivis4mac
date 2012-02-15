<?php
class connect {
	
	private $result;
	
	public function setConnection()
	{ 
		$str = mb_convert_encoding($str, 'UTF-8', 'UTF-8');
		$database='poiskdetei';
		$this->result = mysqli_connect('localhost','root','root',$database);
		$charset="SET NAMES 'utf8' COLLATE 'utf8_unicode_ci'";
		mysqli_query($this->result,$charset);
		if($this->result)
		{
			print("connection =>ok");
		}
		return  $this->result;
	}
	
	public function closeConnection($value)
	{
		mysqli_close($value); 
	}
}
?> 
