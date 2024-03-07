live_auto_call

switch (sprite_index){
	case spr_longjump: if(spr_longjump != spr_mach2jump){sprite_index = spr_longjumpend} break
	case spr_enterdoor: image_index = image_number-1; break
	case spr_exitdoor : state = states.normal; sprite_index = spr_idle; break
}