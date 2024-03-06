function scr_sSupreme_set(_shader = 1, _invert = 0,_colors = [],_cleanC = 1) {
	if(_shader)
		shader_set(shd_sSupreme)
	var _i = 1
	if(_cleanC) {
		var _param
		repeat(10){
			_param = shader_get_uniform(shd_sSupreme,$"v_c{_i}")
			shader_set_uniform_f_array(_param,[-1,0,0,0])
			_param = shader_get_uniform(shd_sSupreme,$"v_c{_i}S")
			shader_set_uniform_f_array(_param,[-1,0,0,0])
			_i++
		}	
	}_i = 0
	//Colors
	repeat(array_length(_colors)){
		scr_sSupreme_colorS(_colors[_i][0],_colors[_i][1],_i+1)
		_i++
	}
	//Invert
	if(_invert = 1){
		_i = shader_get_uniform(shd_sSupreme,"i_invert")
		shader_set_uniform_i(_i,1)
	}
}
function scr_sSupreme_colorS(_v1,_v2,_idx){
	var _param
	var _i = 0
	
	var _r1 = []
	var _r2 = []
	repeat(4){_r1[_i] = _v1[_i]/255; _i++;} _i = 0
	repeat(4){_r2[_i] = _v2[_i]/255; _i++;}
	
	_param = shader_get_uniform(shd_sSupreme,$"v_c{_idx}")
	shader_set_uniform_f_array(_param,_r1)
	_param = shader_get_uniform(shd_sSupreme,$"v_c{_idx}S")
	shader_set_uniform_f_array(_param,_r2)
	
}
function scr_sSupreme_reset(){
	if(shader_current() != -1)
		shader_reset()
}