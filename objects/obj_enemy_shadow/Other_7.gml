/// @description Insert description here
// You can write your code in this editor

if (enemy_state = states.grow)
{
	enemy_state = states.appraoch;
}
else if (enemy_state = states.flee)
{
	enemy_state = states.idle;
	image_speed = 1;
}