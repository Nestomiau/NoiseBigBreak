if (fadeout) {
	image_alpha = Approach(image_alpha, 1, 0.1);
	if (image_alpha >= 1) {
		fadeout = false;
		show_debug_message(obj_player.targetRoom)
		room_goto(obj_player.targetRoom);
	}
}else {
	image_alpha = Approach(image_alpha, 0, 0.1);
	if (image_alpha <= 0)
		instance_destroy();
}
