//This fires after everything else draws for our screen fade

draw_set_alpha(overlay_alpha);
draw_set_color(overlay_color);

draw_rectangle(0,0,room_width,room_height,false);

draw_set_alpha(1);
draw_set_color(c_black);