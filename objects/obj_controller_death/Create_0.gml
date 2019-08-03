//Start fade-in
alarm[0] = 5;

//Color and alpha for overlay
overlay_alpha = 1;
overlay_color = c_black;

//How fast to fade in and out the overlay
overlay_fade_inc_in = 0.1;
overlay_fade_inc_out = 0.1;

//Flag for room end. If this flag is checked whenever fading in the overlay terminates, the room will restart.
flag_game_end = false;