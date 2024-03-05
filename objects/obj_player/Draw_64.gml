live_auto_call;

if(global.dressing) {

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
		var _c_C = customPalettes[real(string_digits(curentPalette))-1][dresserMenu*2-1]
		draw_sprite_ext(spr_gameframe_pixel,0,SCREEN_WIDTH/2-250,SCREEN_HEIGHT/2+250,10,10,0,make_color_rgb(_c_C[0],_c_C[1],_c_C[2]),1)
		draw_sprite_ext(spr_gameframe_pixel,0,SCREEN_WIDTH/2-150,SCREEN_HEIGHT/2+250,10,10,0,make_color_rgb(_c_C[0],0,0),1)
		draw_sprite_ext(spr_gameframe_pixel,0,SCREEN_WIDTH/2-100,SCREEN_HEIGHT/2+250,10,10,0,make_color_rgb(0,_c_C[1],0),1)
		draw_sprite_ext(spr_gameframe_pixel,0,SCREEN_WIDTH/2-50,SCREEN_HEIGHT/2+250,10,10,0,make_color_rgb(0,0,_c_C[2]),1)
	}
}

/*
if(currentPal == "custom") {
	var _i = 0
	var _array = []
	repeat(array_length(custom_palette)) {
		var _crt = custom_palette[_i]
		_array[_i] = [array_get(OgColors,_i),[_crt.r,_crt.g,_crt.b,_crt.a]]
		_i++
	}
	scr_sSupreme_set(inverted,_array)
	
}else
	pal_swap_set(spr_palette,currentPal,0)
draw_sprite_ext(sprite_index, -1, SCREEN_WIDTH/2, SCREEN_HEIGHT/2-200, 5,5,image_angle, image_blend, image_alpha);
if(currentPal == "custom")
	shader_reset()
else
	pal_swap_reset()
	
if(currentPal == "custom") {
	var _crt = custom_palette[csPal]
	var _og = OgColors[csPal]
	draw_sprite_ext(spr_gameframe_pixel,0,SCREEN_WIDTH/2, SCREEN_HEIGHT/2+50,20,20,0,make_color_rgb(_crt.r,0,0),1)
	draw_sprite_ext(spr_gameframe_pixel,0,SCREEN_WIDTH/2, SCREEN_HEIGHT/2+125,20,20,0,make_color_rgb(0,_crt.g,0),1)
	draw_sprite_ext(spr_gameframe_pixel,0,SCREEN_WIDTH/2, SCREEN_HEIGHT/2+200,20,20,0,make_color_rgb(0,0,_crt.b),1)
	draw_sprite_ext(spr_gameframe_pixel,0,SCREEN_WIDTH/2+120, SCREEN_HEIGHT/2+125,20,20,0,make_color_rgb(_og[0],_og[1],_og[2]),1)
}*/
}else {
	
for(var i = 0; i < max(hp, 4); i++)
	draw_sprite_ext(spr_healthHUD, 0, 32 + 78 * i, 16, 1, 1, 0, i >= hp ? c_black : c_white, 1);
draw_healthbar(32, 112, 288, 128, (movespeed / 19) * 100, c_black, c_blue, c_red, 0, true, true);
draw_set_font(global.fnt_counter)
draw_text(96,158,global.collect)
}
