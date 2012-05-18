

//global variables for all three examples
var bgcolor = 240; 			//starting bgcolor in decimal
var steps = 10;				//the factor, a distance between colors
var down = true;			//direction, if going up or down when calculating bgcolor value
var switchingPoint = 160;	//the numeric value where the foreground color need to change
var fgColorHi = "white";
var fgColorLo = "black";

function alternate(id){
	
	if(document.getElementById){						//check that browser has capabilities
		var table = document.getElementById(id);		//get just the selected table not all of them
		var rows = table.getElementsByTagName("tr");	//get all table rows
		for(i = rows.length-1; i >0 ; i--){				//alternate styles			
			//manipulate rows	
			doGradient(rows[i]);
		}
	}
}


function doGradient(row){
//	document.write(bgcolor.toString(16));fff5ebe1d7cdc3
	bgcolorValue = "ff"+padHex() + bgcolor.toString(16)+ padHex() + bgcolor.toString(16) ;
//document.write(bgcolorValue); #fffffff5f5ffebebffe1e1ffd7d7ffcdcdffc3c3ff
	row.style.backgroundColor = "#"+bgcolorValue;
	if(down && (bgcolor-steps) > 0){	//if subtracting, prevent negative values
		bgcolor = (bgcolor - steps);
	}else{							
		bgcolor = (bgcolor + steps);
		down = false;
	}
	if(bgcolor > 255){					//prevent too high values
		bgcolor = (bgcolor - steps);
		down = true;
	}
	if(bgcolor < switchingPoint){		//change color of text (foreground color) if below a certain value (160)
		row.style.color = fgColorHi;
	}else{
		row.style.color = fgColorLo;
	}
}

function padHex(){
	return (bgcolor < 16) ? "0" : "";
}

//888888888888888888888888888888888888888888888888888888888










