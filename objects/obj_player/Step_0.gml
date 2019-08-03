//// Movement
delta_time_sec = delta_time/1000000;
movementInput = false;

//Keyboard Movement
upKeyPressed = keyboard_check(ord("W")) || keyboard_check(vk_up);
leftKeyPressed = keyboard_check(ord("A")) || keyboard_check(vk_left);
downKeyPressed = keyboard_check(ord("S")) || keyboard_check(vk_down);
rightKeyPressed = keyboard_check(ord("D")) || keyboard_check(vk_right);

//Add up gamepad dpad if present
if (gamepad_is_supported() && gamepad_is_connected(0))
{
	upKeyPressed = upKeyPressed || gamepad_button_check(0, gp_padu);
	leftKeyPressed = leftKeyPressed || gamepad_button_check(0, gp_padl);
	downKeyPressed = downKeyPressed || gamepad_button_check(0, gp_padd);
	rightKeyPressed = rightKeyPressed || gamepad_button_check(0, gp_padr);
}

//set xDir yDir if gamepad sticks are used
if (gamepad_is_supported() && gamepad_is_connected(0))
{
	xDir = clamp(gamepad_axis_value(0, gp_axislh) + gamepad_axis_value(0, gp_axisrh), -1, 1);
	yDir = clamp(gamepad_axis_value(0, gp_axislv) + gamepad_axis_value(0, gp_axisrv), -1, 1);
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
	spdRampTimer = clamp(spdRampTimer + delta_time_sec, 0, spdRampUpSpd);
	var actualspeed = lerp(0, spd, spdRampTimer/spdRampUpSpd);
	
	lightOn = false;
}
else
{
	spdRampTimer = clamp(spdRampTimer - delta_time_sec, 0, spdRampDownSpd);
	var actualspeed = lerp(0, spd, spdRampTimer/spdRampDownSpd);
	
	//lightOn = true;
	lightOn = false;
}

moveDir = point_direction(0,0,xDir,yDir);
xMove = round(lengthdir_x(actualspeed,moveDir) * delta_time_sec);
yMove = round(lengthdir_y(actualspeed,moveDir) * delta_time_sec);

//Do move
scr_move_collide();
scr_player_senses_controller();