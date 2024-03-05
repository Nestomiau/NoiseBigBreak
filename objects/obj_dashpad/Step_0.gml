switch (state){
	case 0 :
		if(instance_place(x,y,obj_player)) {
			plr = instance_place(x,y,obj_player)
			plr.x = x
			plr.y = y
			plr.xscale = image_xscale
			plr.state = states.normal
			//plr.sprite_index = spr_player_mach3;
			state = 1
		}
	break case 1 :
		if (plr.movespeed >= minspeed)
			plr.movespeed += force
		else
			plr.movespeed = minspeed
		state = 2
	break case 2 :
		if(!instance_place(x,y,plr))
			state = 0
	break
}