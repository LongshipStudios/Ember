switch(sprite_index)
{
	case spr_player_walk_front: //Add other walks here
	if(!lightOn && movementInput)
	{
		 sprite_index = walk_anim_array[round(moveDir) mod 4]; //Gets the correct walk anim for the move direction
	}
	else
	{
		if(lightOn)
		{
			sprite_index = spr_player_idle_start; //Transition to fire ele being out and about
		}
		else
		{
			sprite_index = spr_player_idle_dark; //Play idle anim with fire ele hiding
		}
	}
	break;
	
	
	case spr_player_idle_loop:
	if(!lightOn && movementInput)
	{
		sprite_index = spr_player_idle_exit; //Gets the correct walk anim for the move direction
	}
	else
	{
		if(lightOn)
		{
			sprite_index = spr_player_idle_loop; //Fire ele is now fully out and about
		}
		else
		{
			sprite_index = spr_player_idle_exit; //Play idle anim with fire ele hiding
		}
	}
	break;
	
	
	case spr_player_idle_start:
	if(!lightOn && movementInput)
	{
		sprite_index = spr_player_idle_exit; //Gets the correct walk anim for the move direction
	}
	else
	{
		if(lightOn)
		{
			sprite_index = spr_player_idle_loop; //Fire ele is now fully out and about
		}
		else
		{
			sprite_index = spr_player_idle_dark; //Play idle anim with fire ele hiding
		}
	}
	break;
	
	
	case spr_player_idle_exit:
	if(!lightOn && movementInput)
	{
		sprite_index = walk_anim_array[round(moveDir) mod 4]; //Gets the correct walk anim for the move direction
	}
	else
	{
		if(lightOn)
		{
			sprite_index = spr_player_idle_start; //Fire ele is coming out
		}
		else
		{
			sprite_index = spr_player_idle_dark; //Play idle anim with fire ele hiding
		}
	}
	break;
	
	
	case spr_player_idle_dark:
	if(!lightOn && movementInput)
	{
		sprite_index = walk_anim_array[round(moveDir) mod 4]; //Gets the correct walk anim for the move direction
	}
	else
	{
		if(lightOn)
		{
			sprite_index = spr_player_idle_start; //Bring back out fire ele
		}
		else
		{
			sprite_index = spr_player_idle_dark; //Keep fire ele away
		}
	}
	break;
}