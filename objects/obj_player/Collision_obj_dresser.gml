if(key_up2 && state != states.dresser){
	state = states.dresser
	global.dressing = 1
	hsp = 0
	vsp = 0
	sprite_index = spr_idle
	movespeed = 0
	dresserMenu = 0
	customizing = 1
}
