function scr_player_setPalette(){
	with(obj_player) {
		var _i = 0
		var _array = []
		var _crt = (!(is_string(curentPalette)))?paletteList[curentPalette]:customPalettes[real(string_digits(curentPalette))-1]
		var _t
		repeat(array_length(OgColors)){ // Get Colors
			if(array_get_index(_crt,_i) > -1){
				var _rI = array_length(_array)
				var _iT = array_get_index(_crt,_i)+1
				_array[_rI] = [OgColors[_i],[_crt[_iT][0],_crt[_iT][1],_crt[_iT][2]]]
				if(array_length(_array[_rI][0])==3){_t = 255}else {_t = _array[_rI][0][3]}
				_array[_rI][1][3] = _t
				if(array_length(_array[_rI][0])==3){_t = 255}else {_t = _array[_rI][0][3]}
				_array[_rI][0][3] = _t
			}
			_i++
		}
		return _array
	}
}