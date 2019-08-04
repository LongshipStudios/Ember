if(instance_exists(obj_controller_death))
{

	with(obj_controller_death)
	{
		if(!flag_game_end)
		{
			alarm[1] = 1;
			flag_game_end = true;
		}
	}
	//Audio
	audio_stop_all();
	audio_play_sound(snd_death_tone,200,false);
}

