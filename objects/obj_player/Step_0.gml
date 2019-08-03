//// Movement

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

//Get the x and y motion directions from input
var xDir = 0;
var yDir = 0;

//set xDir yDir if gamepad sticks are used
if (gamepad_is_supported() && gamepad_is_connected(0))
{
	xDir = clamp(gamepad_axis_value(0, gp_axislh) + gamepad_axis_value(0, gp_axisrh), -1, 1);
	yDir = clamp(gamepad_axis_value(0, gp_axislv) + gamepad_axis_value(0, gp_axisrv), -1, 1);
}

//overwrite xDir yDir if binary Inputs are used
if (rightKeyPressed || leftKeyPressed || downKeyPressed || upKeyPressed)
{
	xDir = rightKeyPressed - leftKeyPressed;
	yDir = downKeyPressed - upKeyPressed;
}

//If we have inputs
if(xDir != 0 || yDir!= 0)
{
	//Get the combined direction and assign movement values based on that
	moveDir = point_direction(0,0,xDir,yDir);
	
	xMove = round(lengthdir_x(spd,moveDir) * delta_time/1000000);
	yMove = round(lengthdir_y(spd,moveDir) * delta_time/1000000);
	
	lightOn = false;
}
else
{
	//If there are no inputs, we aren't moving
	moveDir = noone;
	
	xMove = 0;
	yMove = 0;
	
	lightOn = true;
}

//Do move
scr_move_collide();
scr_player_senses_controller();