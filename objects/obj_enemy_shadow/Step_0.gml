/// @description Insert description here
// You can write your code in this editor

//Track player
moveDir = point_direction(x,y,obj_player.x,obj_player.y);
	
xMove = lengthdir_x(spd,moveDir);
yMove = lengthdir_y(spd,moveDir);
	
x += xMove;
y += yMove;