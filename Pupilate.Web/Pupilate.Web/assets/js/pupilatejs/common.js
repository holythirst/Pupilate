	function GetYear(element)
	{
	    var dteNow = new Date();
	    var intYear = dteNow.getFullYear();
	    document.getElementById(element).innerHTML = intYear.toString();
	    //element.innerHTML = intYear.toString();
	    //return intYear;
	}