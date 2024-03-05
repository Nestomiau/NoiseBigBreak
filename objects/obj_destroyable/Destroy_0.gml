repeat 6 
	instance_create(x + 32, y + 32, obj_debris,dStruct);
if(contain != []) {
		var _i = 0
		var _a
		repeat(array_length(contain)){
			_a = contain[_i]
			instance_create(x+_a[1],y+_a[2],_a[0],_a[3])
			_i++
		}
	}
ds_list_add(global.saveroom, id);
