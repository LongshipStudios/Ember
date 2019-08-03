/// @description Insert description here
// You can write your code in this editor


//If Players torch is on and monster is closer than torches radius
if(obj_player.lightOn && distance_to_object(obj_player) < obj_player.rad*0.6)
{
	//Don't move?
	moveDir = point_direction(x,y,obj_player.x,obj_player.y);
	
	xMove = lengthdir_x(spd*-1,moveDir);
	yMove = lengthdir_y(spd*-1,moveDir);
	
	x += xMove;
	y += yMove;
}
else
{
	//Track player
	moveDir = point_direction(x,y,obj_player.x,obj_player.y);
	
	xMove = lengthdir_x(spd,moveDir);
	yMove = lengthdir_y(spd,moveDir);
	
	x += xMove;
	y += yMove;
//move_towards_point(obj_player.x,obj_player.y,spd);
}	