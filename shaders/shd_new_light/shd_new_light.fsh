//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	//v_vColour.a = v_vColour.r;
    //gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	vec4 col =  texture2D( gm_BaseTexture, v_vTexcoord );
	
	
	col.r = 1.0 - col.r;
	col.g = 1.0 - col.g;
	col.b = 1.0 - col.b;//*/
	
	col.a = col.r;
	
	col.r = 1.0 - col.r;
	col.g = 1.0 - col.g;
	col.b = 1.0 - col.b;//*/
	
    gl_FragColor = col;
}