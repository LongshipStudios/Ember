var col = $eb814c;
surface_set_target(obj_player.surf);

gpu_set_blendmode(bm_max);
draw_circle_color(x,y-20,rad/1.5,c_orange,c_black,false);
with(obj_torch) { draw_circle_color(x,y-20,rad/1.5,c_orange,c_black,false); }

draw_circle_color(x,y-20,rad,c_gray,c_black,false);
with(obj_torch) { draw_circle_color(x,y-20,rad,c_gray,c_black,false); }

gpu_set_blendmode(bm_normal);

draw_set_alpha(0.9);
gpu_set_blendmode_ext(bm_src_alpha,bm_zero);
gpu_set_colorwriteenable(false, false, false, true);

draw_circle_color(x,y-20,rad,c_black,c_black,false);
with(obj_torch) { draw_circle_color(x,y-20,rad,c_black,c_black,false); }

draw_set_alpha(0.8);
draw_circle_color(x,y-20,rad*0.8,c_black,c_black,false);
with(obj_torch) { draw_circle_color(x,y-20,rad*0.8,c_black,c_black,false); }

draw_set_alpha(0.7);
draw_circle_color(x,y-20,rad*0.6,c_black,c_black,false);
with(obj_torch) { draw_circle_color(x,y-20,rad*0.6,c_black,c_black,false); }

draw_set_alpha(0.6);
draw_circle_color(x,y-20,rad*0.4,c_black,c_black,false);
with(obj_torch) { draw_circle_color(x,y-20,rad*0.4,c_black,c_black,false); }

draw_set_alpha(0.5);
draw_circle_color(x,y-20,rad*0.2,c_black,c_black,false);
with(obj_torch) { draw_circle_color(x,y-20,rad*0.2,c_black,c_black,false); }

draw_set_alpha(1);
gpu_set_colorwriteenable(true, true, true, true);
gpu_set_blendmode(bm_normal);

surface_reset_target();