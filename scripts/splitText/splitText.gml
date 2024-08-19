/**
*This code takes a long string and splits it into smaller strings in an array
*/

function splitText(currentText){
draw_set_font(spr_font_fundant);
show_debug_message("Input: " + string(currentText));
show_debug_message("String Length: " + string(string_length(currentText)));
	textArray = [];
	var incrementString = "";
	for (var i = 0; i < string_length(currentText); i++) {
		// use string_pos to find place where " " is
	var incrementChar = string_char_at(currentText, i + 1);
	

	incrementString = string_insert(incrementChar, incrementString, i + 1);
	if ((string_width(incrementString) > 850)) {
		incrementChar = " ";
	}	
	    // if the incremented String is longer than 750 pixels and there is a space at I
	if (((string_width(incrementString) > 750) && (incrementChar == " "))) {
			array_push(textArray, incrementString);
			show_debug_message("branch 1: " + string((string_width(incrementString))));
			incrementString = "";
		} 
		


		
	}
	array_push(textArray, incrementString);
	show_debug_message("Output:" + string(textArray));
	return textArray;
}

function splitTextLength(currentText, lengthToSplit){
draw_set_font(spr_font_fundant);
show_debug_message("Input: " + string(currentText));
show_debug_message("String Length: " + string(string_length(currentText)));
	textArray = [];
	var incrementString = "";
	for (var i = 0; i < string_length(currentText); i++) {
		// use string_pos to find place where " " is
	var incrementChar = string_char_at(currentText, i + 1);
	

	incrementString = string_insert(incrementChar, incrementString, i + 1);
	if ((string_width(incrementString) > lengthToSplit + 100)) {
		incrementChar = " ";
	}	
	    // if the incremented String is longer than 750 pixels and there is a space at I
	if (((string_width(incrementString) > lengthToSplit) && (incrementChar == " "))) {
			array_push(textArray, incrementString);
			show_debug_message("branch 1: " + string((string_width(incrementString))));
			incrementString = "";
		} 
		


		
	}
	array_push(textArray, incrementString);
	show_debug_message("Output:" + string(textArray));
	return textArray;
}