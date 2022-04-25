<?php

if (isset ( $_GET["rotate"] )) {
	$rotate = strip_tags ($_GET["rotate"]);
	$pin = strip_tags ($_GET["pin"]);
	
	//test if value is a number
	if ( (is_numeric($rotate)) && ($rotate <= 7) && ($rotate >= 0) ) {
		//--------------------------------------------backward
		if (($rotate == 1)&&($pin == 02)){
			// run back-ward
			shell_exec("echo 0 >temp");
			$rotate = 0;
			system("gpio write 0 1");
			system("gpio write 2 1");
			system("gpio write 3 0");
			system("gpio write 7 0");
		}
		else{
		if (($rotate == 0)&&($pin == 02)){
			// stop back-ward
			shell_exec("echo 1 >temp");
			$rotate = 1;
			system("gpio write 0 0");
			system("gpio write 2 0");
			system("gpio write 3 0");
			system("gpio write 7 0");
			}
		}
		//--------------------------------------------forward
		if (($rotate == 1)&&($pin == 37)){
			// run for-ward
			shell_exec("echo 0 >temp");
			$rotate = 0;
			system("gpio write 0 0");
			system("gpio write 2 0");
			system("gpio write 3 1");
			system("gpio write 7 1");
		}
		else{
		if (($rotate == 0)&&($pin == 37)){
			// stop for-ward
			shell_exec("echo 1 >temp");
			$rotate = 1;
			system("gpio write 0 0");
			system("gpio write 2 0");
			system("gpio write 3 0");
			system("gpio write 7 0");
			}
		}
		//--------------------------------------------turn right
		if (($rotate == 1)&&($pin == 03)){
			// run turn-right
			shell_exec("echo 0 >temp");
			$rotate = 0;
			system("gpio write 0 1");
			system("gpio write 2 0");
			system("gpio write 3 1");
			system("gpio write 7 0");
		}
		else{
		if (($rotate == 0)&&($pin == 03)){
			// stop for-ward
			shell_exec("echo 1 >temp");
			$rotate = 1;
			system("gpio write 0 0");
			system("gpio write 2 0");
			system("gpio write 3 0");
			system("gpio write 7 0");
			}
		}
		//--------------------------------------------turn left
		if (($rotate == 1)&&($pin == 27)){
			// run turn-left
			shell_exec("echo 0 >temp");
			$rotate = 0;
			system("gpio write 0 0");
			system("gpio write 2 1");
			system("gpio write 3 0");
			system("gpio write 7 1");
		}
		else{
		if (($rotate == 0)&&($pin == 27)){
			// stop for-left
			shell_exec("echo 1 >temp");
			$rotate = 1;
			system("gpio write 0 0");
			system("gpio write 2 0");
			system("gpio write 3 0");
			system("gpio write 7 0");
			}
		}


		echo($rotate);
	}
	else { echo ("fail, it's not number".$pin); }
} //print fail if cannot use values
else { echo ("fail"); }


?>
