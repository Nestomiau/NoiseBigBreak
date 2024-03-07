live_auto_call;

if(global.dressing) { // Dressing HUD

draw_sprite_stretched(spr_gameframe_caption,1,0,0,SCREEN_WIDTH,SCREEN_HEIGHT)
var _i = 0
var _array = []
var _crt = (!(is_string(curentPalette)))?paletteList[curentPalette]:customPalettes[real(string_digits(curentPalette))-1]
var _t
repeat(array_length(OgColors)){
	if(array_get_index(_crt,_i) > -1){
		var _rI = array_length(_array)
		var _iT = array_get_index(_crt,_i)+1
		_array[_rI] = [OgColors[_i],[_crt[_iT][0],_crt[_iT][1],_crt[_iT][2]]]
		if(array_length(_array[_rI][0])==3){_t = 255}else {_t = _array[_rI][0][3]}
		_array[_rI][1][3] = _t
		if(array_length(_array[_rI][0])==3){_t = 255}else {_t = _array[_rI][0][3]}
		_array[_rI][0][3] = _t
	}
	_i++
}
scr_sSupreme_set(1,inverted,_array)
draw_sprite_ext(sprite_index,image_index,SCREEN_WIDTH/2,SCREEN_HEIGHT/2,5,5,0,c_white,1);
scr_sSupreme_reset()

if(is_string(curentPalette)){
	if(dresserMenu > 0) {
		var _crd = [250,150,100,50]
		var _c_C = customPalettes[real(string_digits(curentPalette))-1][dresserMenu*2-1]
		draw_sprite_ext(spr_gameframe_pixel,0,SCREEN_WIDTH/2-_crd[0],SCREEN_HEIGHT/2+250,10,10,0,make_color_rgb(_c_C[0],_c_C[1],_c_C[2]),1)
		draw_sprite_ext(spr_gameframe_pixel,0,SCREEN_WIDTH/2-_crd[1],SCREEN_HEIGHT/2+250,10,10,0,make_color_rgb(_c_C[0],0,0),1)
		draw_sprite_ext(spr_gameframe_pixel,0,SCREEN_WIDTH/2-_crd[2],SCREEN_HEIGHT/2+250,10,10,0,make_color_rgb(0,_c_C[1],0),1)
		draw_sprite_ext(spr_gameframe_pixel,0,SCREEN_WIDTH/2-_crd[3],SCREEN_HEIGHT/2+250,10,10,0,make_color_rgb(0,0,_c_C[2]),1)
		if(!chanCol)
			draw_sprite_ext(spr_dresserSelect,0,SCREEN_WIDTH/2-_crd[customizing],SCREEN_HEIGHT/2+250,2,2,0,c_white,1)
	}
}
}else { // Normal HUD
	
for(var i = 0; i < max(hp, 4); i++)
	draw_sprite_ext(spr_healthHUD, 0, 32 + 78 * i, 16, 1, 1, 0, i >= hp ? c_black : c_white, 1);
draw_healthbar(32, 112, 288, 128, (movespeed / 19) * 100, c_black, c_blue, c_red, 0, true, true);
draw_set_font(global.fnt_counter)
draw_text(96,158,global.collect)
}