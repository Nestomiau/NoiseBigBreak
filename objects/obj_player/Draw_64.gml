live_auto_call

if(global.dressing) { // Dressing HUD

	draw_sprite_stretched(spr_gameframe_caption,1,0,0,SCREEN_WIDTH,SCREEN_HEIGHT)

	pSwap_set(spr_palette,curentPalette)
	draw_sprite_ext(sprite_index,image_index,SCREEN_WIDTH/2,SCREEN_HEIGHT/2,5,5,0,c_white,1);
	scr_shaders_reset()
}