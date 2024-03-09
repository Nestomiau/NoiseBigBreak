var _x = 0
var _OBJ = []

repeat((room_width-(room_width)mod(32))/32){
	var _y = 0
	repeat((room_height-(room_height)mod(32))/32){
		with(instance_place(_x,_y,obj_destroyable)){
			if(array_get_index(_OBJ,id) == -1) {
				draw_sprite(sprite_index,image_index,x,y)
				_OBJ[array_length(_OBJ)] = id
			}
		}
		_y+=32
	}
	_x+=32
}