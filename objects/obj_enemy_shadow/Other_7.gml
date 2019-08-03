/// @description Insert description here
// You can write your code in this editor

if (enemy_state = states.grow)
{
	enemy_state = states.appraoch;
	image_index = 0;
}
else if (enemy_state = states.flee)
{
	enemy_state = states.idle;
	image_speed = 1;
	image_index = 0;
}