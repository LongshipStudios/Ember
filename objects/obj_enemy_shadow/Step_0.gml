/// @description Insert description here
// You can write your code in this editor


//If Players torch is on and monster is closer than torches radius

/*
Moves in small farm
Grow when close
Stay in tall form until scared away or outside radius
Attack animation
*/

/*
State machine

IDLE (0) -> APPROACH (1) -> ATTACK (2)
APPROACH -> FLEE (3)
*/
switch(enemy_state)
{
	case states.idle:
		image_speed = 1;
		sprite_index = spr_shadow_idle;
		if (collision_circle(x,y,tasty_rad,par_lightsource,false,false))
		{
			enemy_state = states.grow;
			image_index = 0;
		}
		else
		{
			break;
		}
	case states.grow:
		image_speed = 1;
		sprite_index = spr_shadow_grow;
		break;
	case states.appraoch:
		image_speed = 1;
		sprite_index = spr_shadow_proximity;
		if (collision_circle(x,y,attack_rad,par_lightsource,false,false))
		{
			enemy_state = states.attack;
			image_index = 0;
		}
		else
		{
			break;
		}
	case states.attack:
		image_speed = 1;
		sprite_index = spr_shadow_attack;
		break;
	case states.flee:
		image_speed = -1;
		sprite_index = spr_shadow_flee;
		break;
}

if(obj_player.lightOn && distance_to_object(obj_player) < obj_player.rad*0.6)
{
	enemy_state = states.flee;
	image_index = 0;
	moveDir = point_direction(x,y,obj_player.x,obj_player.y);
	
	xMove = lengthdir_x(spd*-1,moveDir);
	yMove = lengthdir_y(spd*-1,moveDir);
	
	scr_move_collide();
}
else
{
	//Track player
	moveDir = point_direction(x,y,obj_player.x,obj_player.y);
	
	xMove = lengthdir_x(spd,moveDir);
	yMove = lengthdir_y(spd,moveDir);
	
	scr_move_collide();
//move_towards_point(obj_player.x,obj_player.y,spd);
}	