if(ds_list_find_index(global.saveroom,id) > -1 && type == 2)
	type = 0

with(instance_place(x,y,obj_doorX)){
	other.targetDoor = door
}