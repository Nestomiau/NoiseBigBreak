scr_Touch = function() {
	image_index = 1
	if(save && ds_list_find_index(global.saveroom,id) < 0)
		ds_list_add(global.saveroom,id)
	with(all){
		if(variable_instance_exists(self,"buttonDel"+other.index))
			instance_destroy()
		if(variable_instance_exists(self,"setVar"+other.index))
			variable_instance_set(id,other.changeVar,variable_instance_get(id,"setVar"+other.index))
	}
}