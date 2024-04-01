live_auto_call

if instance_exists(plr) {
	
	var camx = plr.x - CAMW / 2
	var camy = plr.y - CAMH / 2
	if (plr.object_index == obj_player) {
		chargecam = Approach(chargecam, plr.movespeed * plr.xscale * 4, 2);
		if (plr.state == states.jump && plr.mach2 >= plr.mach2_time && plr.vsp < 0)
			flycam = Approach(flycam, 100, 2)
		else
			flycam = Approach(flycam, -50, plr.vsp > 0 ? 4 : 2)
		
		camx += chargecam
		camy += flycam
	}
	
	camx = clamp(camx, 0, room_width - CAMW)
	camy = clamp(camy, 0, room_height - CAMH)

	camera_set_view_pos(view_camera[0], camx, camy)
	
	plr.ofScreen=(plr.y > room_height)
}
