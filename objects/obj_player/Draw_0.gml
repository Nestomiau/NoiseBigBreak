live_auto_call

scr_multiUse_set(,inverted,plrPal)
draw_sprite_ext(sprite_index, -1, x, y, image_xscale * xscale, image_yscale * yscale, angle, image_blend, image_alpha);
scr_multiUse_reset()
draw_sprite(mask_index,0,x,y)