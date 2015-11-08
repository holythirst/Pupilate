        	function setGrades(T1, T2, E, T, G, R)
{
	// Define those variables!
	var cT1 = Number(T1);
	alert('Please select your state' + T1);
	var cT2 = document.getElementById(T2).value;
	var cE = document.getElementById(E).value;
	var cT = document.getElementById(T).value;
	var cG = document.getElementById(G).value;
	var cR = document.getElementById(R).value;
	//var cAvg = parseFloat(document.getElementById('cAvg').value);
	//var cTotal = parseFloat(document.getElementById('cTotal').value);
			
	// Calculate the total points earned!	
	if(cT1 = "")
	{
		if(cT2 = "")
		{
			if(cE = "")
			{
				document.getElementById('T').value = "";
				document.getElementById('G').value = "";
				document.getElementById('R').value = "";
			}
			else
			{
				document.getElementById('T').value = cE;
			} 
		} 
		else
		{
			if(cE = "")
			{
				document.getElementById('T').value = cE;
			}
			else
			{
				document.getElementById('T').value = Number(cT2) + Number(cE);
			}
		}
	}
	else 
	{
		if(cT2 = "")
		{
			if(cE = "")
			{
				document.getElementById('T').value = cT1;
			}
			else
			{
				document.getElementById('T').value = Number(cT1) + Number(cE);
			} 
		} 
		else
		{
			if(cE = "")
			{
				document.getElementById('T').value = Number(cT1) + Number(cE);
			}
			else
			{
				document.getElementById('T').value = Number(cT1) + Number(cT2) + Number(cE);
			}
		}
	}
	
	// Select letter grade!
	if(cT >= 75)
	{
		document.getElementById('G').value = "A1";
		document.getElementById('R').value = "Excellent";
	}
	else if(70 >= Number(cT) && Number(cT) < 75)
	{
		document.getElementById('G').value = "A1";
		document.getElementById('R').value = "Very Good";
	}
	else if(65 >= Number(cT) && Number(cT) < 70)
	{
		document.getElementById('G').value = "B3";
		document.getElementById('R').value = "Good";
	}
	else if(60 >= Number(cT) && Number(cT) < 65)
	{
		document.getElementById('G').value = "C4";
		document.getElementById('R').value = "Credit";
	}
	else if(55 >= Number(cT) && Number(cT) < 60)
	{
		document.getElementById('G').value = "C4";
		document.getElementById('R').value = "Credit";
	}
	else if(50 >= Number(cT) && Number(cT) < 55)
	{
		document.getElementById('G').value = "C4";
		document.getElementById('R').value = "Credit";
	}
	else if(45 >= Number(cT) && Number(cT) < 50)
	{
		document.getElementById('G').value = "C4";
		document.getElementById('R').value = "Credit";
	}
	else if(40 >= Number(cT) && Number(cT) < 45)
	{
		document.getElementById('G').value = "C4";
		document.getElementById('R').value = "Credit";
	}
	else
	{
		document.getElementById('G').value = "F9";
		document.getElementById('R').value = "Fail";
	}
	//var Total = cEngT + cMatT + cSub1T + cSub2T + cSub3T + cSub4T + cSub5T + cSub6T + cSub7T + cSub8T + cSub9T + cSub10T + cSub11T + cSub12T + cSub13T;
	//document.getElementById('Total').value = Total;
}