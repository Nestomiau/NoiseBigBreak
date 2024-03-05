/*
if(!global.dressing)
	exit


getInput()
if(key_jump) {
	global.dressing = 0
	state = states.normal
}

if(!dresserMenu) {
	if(-key_left2 && currentPal != "custom"){
		if(currentPal == 1){
			currentPal = "custom"
		}else
			currentPal = defaultPalletes[array_get_index(defaultPalletes,currentPal)-1]
	}
	
	if(key_right2){
		if(currentPal == "custom")
			currentPal = 0
		if(currentPal < 13)
			currentPal = defaultPalletes[array_get_index(defaultPalletes,currentPal)+1]
	}
}else{
	var _colors = ["r","g","b"]
	var _crt = _colors[dresserMenu-1]
	var _struct = struct_get(custom_palette[csPal],_crt)
	if(key_right && _struct < 254)
		struct_set(custom_palette[csPal],_crt,_struct+5)
	else if(-key_left && _struct > 1)
		struct_set(custom_palette[csPal],_crt,_struct-5)
	if(key_grab && csPal > 0)
		csPal--
	if(key_taunt && csPal < array_length(custom_palette)-1)
		csPal++
}

if(key_down2 && dresserMenu < 3 && currentPal == "custom")
	dresserMenu++ 
if(key_up2 && dresserMenu > 0)
	dresserMenu--
*/