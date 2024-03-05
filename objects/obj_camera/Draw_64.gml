if(!global.drawTV || global.dressing)
	exit
	
if(plr.inv > 0 || plr.state == states.hurt)
	sprite_index = plr.spr_tvHurt
else if(plr.getLife > 0)
	sprite_index = plr.spr_tvLaugh
else if(plr.movespeed > 16 && plr.state != states.slide)
	sprite_index = plr.spr_tvMach3
else
	sprite_index = plr.spr_tvIdle


var _i = 0
var _array = []
var _crt = (!(is_string(plr.curentPalette)))?plr.paletteList[plr.curentPalette]:plr.customPalettes[real(string_digits(plr.curentPalette))-1]
var _t
repeat(array_length(plr.OgColors)){
	if(array_get_index(_crt,_i) > -1){
		var _rI = array_length(_array)
		var _iT = array_get_index(_crt,_i)+1
		_array[_rI] = [plr.OgColors[_i],[_crt[_iT][0],_crt[_iT][1],_crt[_iT][2]]]
		if(array_length(_array[_rI][0])==3){_t = 255}else {_t = _array[_rI][0][3]}
		_array[_rI][1][3] = _t
		if(array_length(_array[_rI][0])==3){_t = 255}else {_t = _array[_rI][0][3]}
		_array[_rI][0][3] = _t
	}
	_i++
}

scr_sSupreme_set(1,plr.inverted,_array)
draw_sprite(sprite_index,image_index,1250,20)
scr_sSupreme_reset()