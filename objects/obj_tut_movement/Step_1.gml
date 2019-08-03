/// @description Insert description here
// You can write your code in this editor

if (gamepad_is_supported() && gamepad_is_connected(0))
{
	sprite_index = spr_tut_controller;
}
else 
{
	sprite_index = spr_tut_keyboard;
}