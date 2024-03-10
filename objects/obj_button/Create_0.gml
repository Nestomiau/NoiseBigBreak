scr_Touch = function() {
	image_index = 1
	if(save && ds_list_find_index(global.saveroom,id) < 0)
		ds_list_add(global.saveroom,id)
	var _b = self
	var _v = ["buttonDel","setVar"]
		with(all){
			if(variable_instance_exists(self,_v[0]+_b.index))
				instance_destroy()
			if(variable_instance_exists(self,_v[1]+_b.index))
				variable_instance_set(id,_b.changeVar,variable_instance_get(id,_v[1]+_b.index))
	}
}