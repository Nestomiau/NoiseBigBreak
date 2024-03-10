live_auto_call

if(!global.drawTV || global.dressing || instance_exists(plr))
	exit
	
if(plr.inv > 0 || plr.state == states.hurt)
	sprite_index = plr.spr_tvHurt
else if(plr.getLife > 0)
	sprite_index = plr.spr_tvLaugh
else if(plr.movespeed > 16 && plr.state != states.slide)
	sprite_index = plr.spr_tvMach3
else
	sprite_index = plr.spr_tvIdle

scr_sSupreme_set(1,plr.inverted,plr.plrPal)
draw_sprite(sprite_index,image_index,1250,20)
scr_sSupreme_reset()