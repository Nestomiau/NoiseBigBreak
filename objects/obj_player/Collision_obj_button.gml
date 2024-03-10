live_auto_call

if(state == states.dresser || state == states.dead || state == states.actor)
	exit

if(!other.image_index){
	other.image_index = 1
	var _v = "buttonDel"+other.index
	with(all){
		if(variable_instance_exists(self,_v))
			instance_destroy()
	}
}