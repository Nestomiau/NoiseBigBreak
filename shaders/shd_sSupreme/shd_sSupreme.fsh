varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec4 v_c1;
uniform vec4 v_c1S;
uniform vec4 v_c2;
uniform vec4 v_c2S;
uniform vec4 v_c3;
uniform vec4 v_c3S;
uniform vec4 v_c4;
uniform vec4 v_c4S;
uniform vec4 v_c5;
uniform vec4 v_c5S;
uniform vec4 v_c6;
uniform vec4 v_c6S;
uniform vec4 v_c7;
uniform vec4 v_c7S;
uniform vec4 v_c8;
uniform vec4 v_c8S;
uniform vec4 v_c9;
uniform vec4 v_c9S;
uniform vec4 v_c10;
uniform vec4 v_c10S;
uniform int i_invert;

void gles_custompal(inout vec4 sample) {
	if(sample == v_c1 && v_c1.r != -1.0)
		sample = v_c1S;
	else if(sample == v_c2 && v_c2.r != -1.0)
		sample = v_c2S;
	else if(sample == v_c3 && v_c3.r != -1.0)
		sample = v_c3S;	
	else if(sample == v_c4 && v_c4.r != -1.0)
		sample = v_c4S;
	else if(sample == v_c5 && v_c5.r != -1.0)
		sample = v_c5S;	
	else if(sample == v_c6 && v_c6.r != -1.0)
		sample = v_c6S;
	else if(sample == v_c7 && v_c7.r != -1.0)
		sample = v_c7S;
	else if(sample == v_c8 && v_c8.r != -1.0)
		sample = v_c8S;	
	else if(sample == v_c9 && v_c9.r != -1.0)
		sample = v_c9S;
	else if(sample == v_c10 && v_c10.r != -1.0)
		sample = v_c10S;	
}

void gles_invertcolor(inout vec4 sample){
	if(i_invert == 1)
		sample = vec4(1.0-sample.r,1.0-sample.g,1.0-sample.b,sample.a);;
}
void main() {
	vec4 sample = texture2D( gm_BaseTexture, v_vTexcoord);
	gles_custompal(sample);
	gles_invertcolor(sample);
	gl_FragColor = v_vColour * sample;
}
