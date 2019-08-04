if(instance_exists(obj_controller_death))
{
	with(obj_controller_death)
	{
		if(!flag_game_end)
		{
			alarm[1] = 2;
			flag_game_end = true;
		}
	}
	//Audio0
	audio_stop_all();
	audio_play_sound(snd_death_tone,200,false);
}

