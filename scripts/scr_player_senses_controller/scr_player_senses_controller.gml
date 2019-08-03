if (obj_player.lightOn == true)
{
	//obj_player.LightPosRadius.visible = true;
	audio_stop_sound(snd_roaring_fire);
}
else
{
	//obj_player.LightPosRadius.visible = false;
	audio_play_sound(snd_roaring_fire,10,true);
}