live_auto_call

if(state == states.dresser || state == states.dead || state == states.actor)
	exit

if(!other.image_index)
	with (other) {scr_Touch()}
