//// Movement
delta_time_sec = delta_time/1000000;

if (movementInput)
{
	moveAudioEdge = true;
}
else
{
	moveAudioEdge = false;
}

movementInput = false;

xMove = 0;
yMove = 0;

//Keyboard Movement
upKeyPressed = keyboard_check(ord("W")) || keyboard_check(vk_up);
leftKeyPressed = keyboard_check(ord("A")) || keyboard_check(vk_left);
downKeyPressed = keyboard_check(ord("S")) || keyboard_check(vk_down);
rightKeyPressed = keyboard_check(ord("D")) || keyboard_check(vk_right);
lanternDimPressed = keyboard_check(vk_space);

//Add up gamepad dpad if present
if (gamepad_is_supported() && gamepad_is_connected(0))
{
	upKeyPressed = upKeyPressed || gamepad_button_check(0, gp_padu);
	leftKeyPressed = leftKeyPressed || gamepad_button_check(0, gp_padl);
	downKeyPressed = downKeyPressed || gamepad_button_check(0, gp_padd);
	rightKeyPressed = rightKeyPressed || gamepad_button_check(0, gp_padr);
	lanternDimPressed = lanternDimPressed || gamepad_button_check(0, gp_face1);
}

//set xMove yMove if gamepad sticks are used
if (gamepad_is_supported() && gamepad_is_connected(0) && (gamepad_axis_value(0, gp_axislh) != 0 || gamepad_axis_value(0, gp_axislv) != 0 || gamepad_axis_value(0, gp_axisrh) != 0 || gamepad_axis_value(0, gp_axisrv) != 0))
{
	xDir = gamepad_axis_value(0, gp_axislh) + gamepad_axis_value(0, gp_axisrh);
	yDir = gamepad_axis_value(0, gp_axislv) + gamepad_axis_value(0, gp_axisrv);
	movementInput = true;
}

//overwrite xDir yDir if binary Inputs are used
if (rightKeyPressed || leftKeyPressed || downKeyPressed || upKeyPressed)
{
	xDir = rightKeyPressed - leftKeyPressed;
	yDir = downKeyPressed - upKeyPressed;
	movementInput = true;
}

//If we have inputs
if(movementInput)
{
	if(!moveAudioEdge)
	{
		//turn on footsteps
		footstepSound = audio_play_sound(snd_footstep_normal,120,true);
	}
	spdRampTimer = clamp(spdRampTimer + delta_time_sec, 0, spdRampUpSpd);
	var actualspeed = lerp(0, spd, spdRampTimer/spdRampUpSpd);
	
	lightOn = false;
	
//	audio_sound_gain(footstepSound, 1, 200);
}
else
{
	if(moveAudioEdge)
	{
		audio_stop_sound(footstepSound);
	}
	spdRampTimer = clamp(spdRampTimer - delta_time_sec, 0, spdRampDownSpd);
	var actualspeed = lerp(0, spd, spdRampTimer/spdRampDownSpd);
	
	if(lanternDimPressed)
	{
		lightOn = false;
	}
	else
	{
		lightOn = true;
	}
	
//	audio_sound_gain(footstepSound, 0, 100);
}

moveDir = point_direction(0,0,xDir,yDir);
xMove = round(lengthdir_x(actualspeed,moveDir) * delta_time_sec);
yMove = round(lengthdir_y(actualspeed,moveDir) * delta_time_sec);

//Do move*/
scr_move_collide();
scr_player_senses_controller(); //Light on/off stuff i.e. sound

//Anims
//walk anim mod 4 isn't correct I dont think but not sure of correct fix....ZZZZZZ.....

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
	
	case spr_player_walk_up: //Add other walks here
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
	
	case spr_player_walk_left: //Add other walks here
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
	
	case spr_player_walk_right: //Add other walks here
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