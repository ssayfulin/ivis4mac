<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
		<title>MAMP</title>
	<!--	<style type='text/css'>
			#textDiv { position:absolute; top:8; right:8; border-style:solid; border-width:thin; background:lightgrey;}
		</style>
	-->
	 <link type="text/css" rel="stylesheet" media="all" title="CSS" href="styleAjax.css" />
	</head>
	<body>
<?php

include "connect.inc";
include "sign.inc";

// constants messages
$INPUT_MESSAGE_ENTER_SIGN = "введите новую примету здесь";

$idSignShow = 5;
// open connection mysql
$connect = new connect();
//$service = $connect->setConnection();

$GLOBALS["service"] = $connect->setConnection();

//$pr = new sign();
$GLOBALS["pr"] = new sign();

echo "<table><tr>";
	echo "<td>";
	$a = $GLOBALS["pr"]->getSign($GLOBALS["service"], $idSignShow);
	showSign($a, $idSignShow);
	echo "</td>";
echo "</tr></table>";
	
//$pr->setSign($service,2,2,1);	
	
// close connection mysql
$connect->closeConnection($service);

function showSign($value,$idSign)
{
	echo "<b> $value[0] </b>";
	echo '<input type="button" value="add" >';
	// if admin => can edit sign
	echo '<input type="button" value="edit" >';
	echo "<br>";
	$b = $value[1];
	echo '<select id="list" name='.$idSign.' onChange="onChange()">';
	for($i=0; $i < sizeof($b); $i++)
	{
		$show = $b[$i];
		echo "<option value=".$i.">".$show."</option>";
	}
	echo '<option value=".$i++.">добавить</option>';
	echo "</select>";
};

?>
<div id="textDiv"/>
<script type="text/javascript">

	function onChange()
	{
		var text = document.getElementById('list').options[document.getElementById('list').selectedIndex].text;
		var value = document.getElementById('list').options[document.getElementById('list').selectedIndex].value;
		var listSize = document.getElementById('list').length;
		var selectedIndex = document.getElementById('list').selectedIndex;
		
		// selected last item
		if(listSize - 1 == selectedIndex)
		{
			testAddTag();
		}else
		{
			// TODO : select normal	
			document.getElementById("textDiv").innerHTML = text;
		}
		
	}
	function testAddTag() 
	{
	var inputTag = '<div class="addSignBox"><table border="0"><tr><td><input type="text" id="inputSign" value="введите новую примету здесь" onClick="cleanInputSign()" onkeyup="writingSing()" /></td></tr> <tr align="right"><td> <input type="button" id="addSingButton" onClick="addNewSing('+"'list','/ajax/addSign.php','','','',"+"'"+document.getElementById('list').name+"');"+'" '+ 'value="Добавить примету" disabled="disabled"/><input type="button" onClick="cancelAddSign();" value="Отменить" /></td></tr></table></div>';
	//alert(inputTag);
	 if (document.getElementById)
    	{
    		document.getElementById("textDiv").innerHTML = inputTag;
    		
    		
    		// document.getElementById("inputText").focus();
    		
    	}
  		else if (document.all)
   		 {
   		 document.all["textDiv"].innerHTML = "other that getElementById";
    	}
  	}
  	
  	/////////////////////
  	//// check writing sing
  	/////////////////////
  	function writingSing()
  	{
  		// TODO : check if write the same sign
  		// TODO : remove left and right space
  		$valueInputSign = document.getElementById('inputSign').value;
  		if($valueInputSign == "")
  		{
  			document.getElementById('addSingButton').disabled = "disabled";
  		}else
  		{
  			document.getElementById('addSingButton').disabled = "";
  		}	
  	}
  	/////////////////////
  	//// clean Input Text
  	/////////////////////
  	function cleanInputSign()
  	{
  		$valueInputSign =  document.getElementById('inputSign').value;
  		if( "введите новую примету здесь" == $valueInputSign)
  		{
  			document.getElementById('inputSign').value = "";
  		}
  	}
  	/////////////////////
	//// Add new sign
	////////////////////
  	function addNewSing(obj,url,defMessage,post,callback,idSign)
  	{
  	  	$newSign = document.getElementById('inputSign').value;
  		//alert($newSign);
  		// check if new sing is empty
  		if($newSign == "")
  		{
  			alert("New sing can't be empty");
  		}

  		var ajaxObj;
  		//if (defMessage) document.getElementById(obj).innerHTML=defMessage;
  		if(window.XMLHttpRequest)
  		{ 
      		ajaxObj = new XMLHttpRequest(); 
  		} else if(window.ActiveXObject)
  				{ 
      				ajaxObj = new ActiveXObject("Microsoft.XMLHTTP");  
  				} else 
  				{ 
      				return; 
  				} 
  				

  		url = url+'?nameSign='+$newSign;
  		// FIXME : add idSign
  		url = url+'&idSign='+idSign;
  		//alert(url);
  		ajaxObj.open ((post?'POST':'GET'), url);
  		if (post&&ajaxObj.setRequestHeader)
      		ajaxObj.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=windows-1251;");
 
  		ajaxObj.onreadystatechange = ajaxCallBack(obj,ajaxObj,(callback?callback:null));
  		ajaxObj.send(post); 
  		return false;
  	}
  	function ajaxCallBack(obj, ajaxObj, callback)
  	{
		return function()
				{
				//alert("return");
   		 			if(ajaxObj.readyState == 4)
   		 			{
       					if(callback) if(!callback(obj,ajaxObj))return;
       					if (ajaxObj.status==200)
        					updateObj(obj, ajaxObj.responseText);
       					else 
       						updateObj(obj, ajaxObj.status+' '+ajaxObj.statusText,1,1);
    				}
				}
	}
	function updateObj(obj, data, bold, blink)
	{ 
   		//if(bold)data=data.bold();
   		//if(blink)data=data.blink();
   		//alert(data);
   		document.getElementById(obj).innerHTML = data; // упрощенный вариант, работает не во всех браузерах
   		document.getElementById("textDiv").innerHTML = "";
   		
  } 
  
  	/////////////////////
	//// Cancel add new sign 
	////////////////////
  	function cancelAddSign()
  	{
  	// FIXME :code repiated
  	if (document.getElementById)
    	{
    		document.getElementById("textDiv").innerHTML = "";
    	}
  		else if (document.all)
   		 {
   		 document.all["textDiv"].innerHTML = "";
    	}
  	}

</script>
</body>
</html>