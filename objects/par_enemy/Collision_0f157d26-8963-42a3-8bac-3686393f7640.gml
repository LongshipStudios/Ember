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
}