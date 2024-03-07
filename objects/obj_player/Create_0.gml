live_auto_call;

enum states
{
	normal,
	mach,
	jump,
	slide,
	hurt,
	wallslide,
	bounce,
	actor,
	hitstun,
	dresser,
	dead,
}
#macro mach2_time 30

depth = -6;
hp = 4;
image_speed = 0.35;
hsp = 0;
vsp = 0;
grounded = false;
grav = 0.5;
state = states.normal;
hsp_carry = 0;
vsp_carry = 0;
platformid = noone;
xscale = 1;
yscale = 1;
movespeed = 0;
mach2 = 0;
jumpstop = false;
inv = 0;
getLife = 0
dresserMenu = 0
customizing = 0
deadCooldown = 240
ofScreen=0

input_buffer_jump = 0;

verticalpos = 0;
verticalspd = 0;

targetRoom = 0;
targetDoor = "A";

scr_player_addslopemomentum = function(acc, dec) {
	with (instance_place(x, y + 1, obj_slope)) {
		if (sign(image_xscale) == -sign(other.xscale) && other.movespeed < 19)
			other.movespeed += acc;
		else if (other.movespeed > 12)
			other.movespeed -= dec;
	}
}
scr_hurtplayer = function() {
	if (state == states.hurt || state == states.dead || inv > 0)
		exit;
	
	hp--;
	sound_play_3d(sfx_hurt, x, y);
	if (hp <= 0) {
		state = states.dead
		vsp = -18
		hsp = 0
		deadCooldown = 120
	}else {
		grounded = false;
		movespeed = 0;
		hsp = xscale * -6;
		vsp = -10;
		global.collect = clamp(global.collect-5,0,99999)
		state = states.hurt;
		sprite_index = spr_hurt;
	}
}

// effects
machsnd = noone;
machsnd_play = noone;
part_time = 0;
jumpclouds = 0;

set_machsnd = function(sound) {
	if (machsnd == sound)
		exit;
	
	if (machsnd != noone)
		audio_stop_sound(machsnd_play);
	
	if (sound != noone) {
		machsnd = sound;
		machsnd_play = audio_play_sound(sound, 0, true);
	}else
		machsnd = noone;
}

charSPR = function(_char) {
	switch(_char){
		case "N" :
			//Default Sprites
			spr_wallslide = spr_player_wallslide
			spr_wallslidedown = spr_player_wallslidedown
			spr_stop = spr_player_stop
			spr_idle = spr_player_idle
			spr_turn = spr_player_turn
			spr_mach1 =spr_player_mach1
			spr_mach2 = spr_player_mach2
			spr_mach2jump = spr_player_mach2jump
			spr_mach2fall = spr_player_mach2fall
			spr_mach3 = spr_player_mach3
			spr_runland = spr_player_runland
			spr_stopping = spr_player_stopping
			spr_glidejumpstart = spr_player_glidejumpstart
			spr_jump = spr_player_jump
			spr_fall = spr_player_fall
			spr_forkstart = spr_player_forkstart
			spr_backflip = spr_player_backflip
			spr_backflipfall = spr_player_backflipfall
			spr_glidejump = spr_player_glidejump
			spr_glidefallstart = spr_player_glidefallstart
			spr_glidefall = spr_player_glidefall
			spr_bounce = spr_player_bounce
			spr_dive = spr_player_dive
			spr_crouchslip = spr_player_crouchslip
			spr_longjump = spr_player_mach2jump
			spr_longjumpend = spr_player_longjumpend
			spr_hurt = spr_player_hurt
			spr_enterdoor = spr_player_enterdoor
			spr_dies = spr_player_dies
			spr_exitdoor = spr_player_exitdoor
			
			// TV Sprites
			spr_tvMach3 = spr_expr_mach3
			spr_tvHurt = spr_expr_hurt
			spr_tvIdle = spr_expr_idle
			spr_tvLaugh = spr_expr_laugh
			
			// Draw Relacted
			OgColors = [[0,0,0],[248,224,128],[167,127,14],[255,255,255],[255,170,131],[169,56,0],[248,0,0],[216,136,24]]
			curentPalette = 10
			paletteList= [	
				[2,[216,136,24]], //Default
				[1,[48,80,120],2,[40,48,64],7,[192,128,56]], //Hardoween
				[1,[88,192,0],2,[8,104,0],4,[248,184,0],6,[160,58,0],7,[208,120,0]], //Money
				[1,[48,168,248],2,[40,80,168],4,[192,128,56],5,[106,27,27],7,[216,104,160]], //Doise
				[1,[224,48,0],2,[88,0,0],4,[96,208,72],5,[93,108,24],7,[229,155,134]], //Blood Red
				[1,[152,80,248],2,[80,0,184],4,[136,164,200],5,[85,47,88],6,[88,0,184],7,[224,48,0]], //TV Prurple
				[1,[0,0,0],2,[0,0,0],5,[114,49,71],7,[88,0,184]], //Black IDR
				[1,[192,128,56],2,[120,56,0],5,[114,49,71],6,[248,0,0],7,[48,80,120]], //Shitty
				[1,[255,255,255],2,[136,168,200],6,[248,0,0],7,[48,80,120]], //Familiar Candy Maker
				[1,[232,80,152],2,[168,40,96],4,[224,48,0],5,[129,15,61],6,[88,0,184],7,[224,48,0]], //Pinkish Red
				[1,[248,112,24],2,[160,56,0],7,[248,224,128]], //Mooney				
			]
			customPalettes = []
			var _i = 0
			repeat(3){
				customPalettes[_i] = [0,[0,0,0],1,[255,255,255],2,[128,128,128],3,[255,255,255],4,[255,170,131],5,[169,56,0],6,[248,0,0],7,[98,98,98]]
				_i++
			}
			inverted = 0
			chanCol = 0
			
			//STATES
			var _funcName = "noise"
			_i = 0
			var _name = ["normal","jump","wallslide","slide","hurt"]
			repeat(array_length(_name)) {
				variable_instance_set(id,$"state_{_name[_i]}",asset_get_index($"scr_{_funcName}_{_name[_i]}"))
				_i++
			}
		break
	}
}

getInput = function(){
	key_left = -keyboard_check(vk_left);
	key_left2 = -keyboard_check_pressed(vk_left);
	key_right = keyboard_check(vk_right);
	key_right2 = keyboard_check_pressed(vk_right);
	key_up = keyboard_check(vk_up);
	key_up2 = keyboard_check_pressed(vk_up);
	key_down = keyboard_check(vk_down);
	key_down2 = keyboard_check_pressed(vk_down);
	key_jump = keyboard_check_pressed(ord("Z"));
	key_jump2 = keyboard_check(ord("Z"));
	key_grab = keyboard_check_pressed(ord("X"));
	key_grab2 = keyboard_check(ord("X"));
	key_taunt = keyboard_check_pressed(ord("C"));
	key_taunt2 = keyboard_check(ord("C"));
	move = key_left + key_right;
	upmove = key_up - key_down
}

//Set Behavior
charSPR("N")
getInput()


