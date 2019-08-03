/// @description Insert description here
// You can write your code in this editor

if (gamepad_is_supported() && gamepad_is_connected(0) && (gamepad_button_check(0, gp_face1) || gamepad_button_check(0, gp_face2) || gamepad_button_check(0, gp_face3) || gamepad_button_check(0, gp_face4)))
{
	room_goto_next();
}