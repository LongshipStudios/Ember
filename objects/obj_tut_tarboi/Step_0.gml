/// @description Insert description here
// You can write your code in this editor

//if player within certain range then fade in, otherwise fade out....
//do fade later....

if (distance_to_object(obj_player) <= fadeDist)
{
	self.visible = true;
}
else
{
	self.visible = false;
}
x = obj_enemy_shadow.x;
y = obj_enemy_shadow.y - 96;