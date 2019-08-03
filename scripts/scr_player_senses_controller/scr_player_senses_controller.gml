if (lightOn == false)
{
	//obj_player.LightPosRadius.visible = true;
	audio_sound_gain(fireSound, 0, 200);
}
else
{
	//obj_player.LightPosRadius.visible = false;
	audio_sound_gain(fireSound, 1, 200);
}