if(ds_list_find_index(global.saveroom,id)>-1&&save) {
	with(all){
		if(variable_instance_exists(id,$"runFunction{other.index}"))
			variable_instance_get(id,$"runFunction{other.index}")()
	}
}