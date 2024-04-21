live_auto_call

if(state == states.dresser || state == states.dead || state == states.actor)
	exit

if(!other.image_index) {
	with (other) {
		image_index=1
		if(save&&ds_list_find_index(global.saveroom,id)<0)
			ds_list_add(global.saveroom,id)
		with(all){
			if(variable_instance_exists(id,$"runFunction{other.index}"))
				variable_instance_get(id,$"runFunction{other.index}")()
		}
	}
}