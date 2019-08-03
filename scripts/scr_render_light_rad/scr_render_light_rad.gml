var _x = argument0;
var _y = argument1;
var _rad = argument2;

surface_set_target(obj_player.surf);

gpu_set_blendmode(bm_add);
draw_circle_color(_x,_y,_rad,c_orange,c_black,false);
gpu_set_blendmode(bm_normal);

gpu_set_blendmode_ext(bm_src_alpha,bm_zero);
draw_set_alpha(0.5);
gpu_set_colorwriteenable(false, false, false, true);

draw_circle_color(_x,_y,_rad,c_black,c_black,false);

gpu_set_colorwriteenable(true, true, true, true);
gpu_set_blendmode(bm_normal);

surface_reset_target();