if(state==states.hitstun){
	scaredCooldown--
	if(!scaredCooldown){
		sprite_index=spr_idle
		state=states.normal
		image_speed=.4
	}
	if(grounded){hsp=Approach(hsp,0,accel)}
}
if((state==states.normal||state==states.mach)&&canScare){
	if(distance_to_object(obj_player)<scaredDist&&obj_player.movespeed>=scaredSpd&&sign(image_xscale)!=sign(obj_player.xscale)){
		sprite_index=spr_scared
		image_speed=.3
		state=states.hitstun
		scaredCooldown=maxScaredCooldown
		vsp=scaredJump

	}
}

if(instance_place(x,y,obj_player)){
	if(obj_player.movespeed>scaredSpd||obj_player.state==states.slide){
		global.collect+=dieValue
		if (global.collect>=global.collectHigh) {
			if(obj_player.hp < 5) {
				obj_player.hp++;
				obj_player.getLife = 180
				global.collectHigh+=20
			}
		}
		instance_destroy()
	}
}