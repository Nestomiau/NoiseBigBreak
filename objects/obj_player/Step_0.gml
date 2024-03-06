live_auto_call;

if !keyboard_check(vk_control) && keyboard_check_pressed(ord("R"))
{
	ds_list_clear(global.saveroom);
	event_perform(ev_create, 0);
	targetDoor = "";
	audio_stop_all();
	room_restart();
}

getInput()

if key_jump
	input_buffer_jump = 10;
if input_buffer_jump > 0
	input_buffer_jump--;


switch state
{
	case states.normal:
		state_normal()
	break;	
	case states.jump:
	case states.bounce:
		state_jump()
	break;
	case states.wallslide:
		state_wallslide()
	break;	
	case states.slide:
		state_slide()
	break;
	case states.hurt:
		state_hurt()
	break;
	case states.dresser :
		scr_noise_dresser()
	break;
}

if grounded && state == states.normal
{
	if movespeed > 12
		set_machsnd(sfx_mach3);
	else if sprite_index == spr_mach2
		set_machsnd(sfx_mach2);
	else if sprite_index == spr_mach1
		set_machsnd(sfx_mach1);
	else
		set_machsnd(noone);
}
else
	set_machsnd(noone);

if state != states.jump && state != states.normal
	mach2 = 0;

if state == states.wallslide or (state == states.jump && mach2 >= mach2_time && vsp < 0)
	grav = 0.25;
else
	grav = 0.5;

// collide destructibles
if state == states.bounce
{
	with instance_place(x, y + vsp + 1, obj_destroyable)
	{
		other.vsp = -14;
		other.grounded = false;
		if(!isMetal)
			instance_destroy();
	}
}

with instance_place(x + hsp, y, obj_destroyable)
	if(other.movespeed > destroyspeed || (other.state == states.slide && (!isMetal || other.movespeed > destroyspeed)))
		instance_destroy();
with instance_place(x, y + vsp + 1, obj_destroyable)
	if(other.movespeed > destroyspeed || (other.state == states.slide && (!isMetal || other.movespeed > destroyspeed)))
		instance_destroy();

scr_collide_player();

if inv > 0
{
	image_alpha = 1 - (floor(inv / 3) % 2);
	inv--;
}
else
{
	image_alpha = 1;
	inv = 0;
}

// spikes
var spike = instance_nearest(x, y, obj_spike);
if spike && abs(distance_to_object(spike)) < 1
{
	if state == states.bounce
	{
		vsp = -14;
		grounded = false;
	}
	else
		scr_hurtplayer();
}

if mouse_check_button_pressed(mb_left)
{
	x = mouse_x;
	y = mouse_y;
}

if(state == states.slide && sprite_index != spr_dive)
	mask_index = spr_player_maskdown
else
	mask_index = spr_player_mask

getLife--