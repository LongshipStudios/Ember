//Fade out overlay
overlay_alpha = clamp(overlay_alpha - overlay_fade_inc_out, 0, 1);

//If we are faded out
if(overlay_alpha == 0)
{
	//End
}
else
{
	alarm[0] = 1; //Keep fading
}