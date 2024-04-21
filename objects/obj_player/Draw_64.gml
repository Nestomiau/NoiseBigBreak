live_auto_call

if(global.dressing) { // Dressing HUD

draw_sprite_stretched(spr_gameframe_caption,1,0,0,SCREEN_WIDTH,SCREEN_HEIGHT)

scr_multiUse_set(1,plr.inverted,plr.plrPal)
draw_sprite_ext(sprite_index,image_index,SCREEN_WIDTH/2,SCREEN_HEIGHT/2,5,5,0,c_white,1);
scr_multiUse_reset()

if(is_string(curentPalette)){ // Display Custom Colors
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
}