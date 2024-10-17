/**
* converts string into object or sprite
* type is either "spr" or "obj" depeding on what you want to convert TO, both in string form
*/

function convertTo(type, name){
	//spr and obj types
		if (type != "name") {
			if (stringContains(name, "spr_") || stringContains(name, "obj_")) { 
				var nameRemovedFirstFour = string_copy(name, 5, string_length(name));
				var objName = asset_get_index(type + "_" + nameRemovedFirstFour);
				if (objName == -1) {
					show_debug_message(("Converted from name to " + type + "_" + underScoredName + "and could not find asset"));
				}
				return objName;
			} else {
				var underScoredName = string_replace_all(name, " ", "_");
	
				var objName = asset_get_index(type + "_" + underScoredName);
				if (objName == -1) {
					show_debug_message((type + "_" + underScoredName));
				}
				return objName;
			}
		} else {
			if (typeof(name) != "string") {
				name = object_get_name(name);
			}
			var nameRemovedFirstFour = string_copy(name, 5, string_length(name));
			var underScoredName = string_replace_all(nameRemovedFirstFour, "_", " ");
			
			return underScoredName;
		}
}