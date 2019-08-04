//Fade in overlay
overlay_alpha = clamp(overlay_alpha + overlay_fade_inc_in, 0, 1);

//If we are faded in
if(overlay_alpha == 1)
{
	//If we should end the game, end it
	if(flag_game_end)
	{
		room_restart();
	}
}
else
{
	alarm[1] = 2; //Keep fading
}