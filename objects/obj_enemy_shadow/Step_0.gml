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
		var tasty = collision_circle(x,y,tasty_rad,par_lightsource,false,false)
		if(instance_exists(tasty))
		{
			if(tasty.rad > 0)
			{
				enemy_state = states.grow;
				image_index = 0;
			}
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
		var potential_nom = collision_circle(x,y,attack_rad,par_lightsource,false,false)
		if(instance_exists(potential_nom))
		{
			if(potential_nom.rad > 0)
			{
				enemy_state = states.attack;
				image_index = 0;
			}
		}
		break;
		
	case states.attack:
		image_speed = 1;
		sprite_index = spr_shadow_attack;
		
		//Audio
		if(!isAttacking)
		{
			audio_stop_sound(moveSound);
			audio_play_sound_on(emitter,snd_slime_attack,false,100);
			isAttacking = true;
		}
		break;
	case states.flee:
		image_speed = 1;
		break;
}
if (canMove)
{
	if(obj_player.lightOn && distance_to_object(obj_player) < obj_player.rad*0.6 || do_flee == false)
	{
		if(do_flee)
		{
			alarm[0] = room_speed * 2;
			do_flee = false;
			image_index = 0;
			sprite_index = spr_shadow_flee;
		}
	
		enemy_state = states.flee;
		moveDir = point_direction(x,y,obj_player.x,obj_player.y);
	
		xMove = lengthdir_x(spd*-1,moveDir);
		yMove = lengthdir_y(spd*-1,moveDir);
	
		scr_move_collide();
	}
	else
	{
	
		closest_nom = instance_nearest(x,y,par_lightsource);
	
		if(!closest_nom.rad > 0)
		{
			closest_nom = instance_nearest(x,y,obj_player);
		}
		
		if(closest_nom != noone)
		{
			//Track player
			moveDir = point_direction(x,y,closest_nom.x,closest_nom.y);
	
			xMove = lengthdir_x(spd,moveDir);
			yMove = lengthdir_y(spd,moveDir);
	
			scr_move_collide();
		
		}
	//move_towards_point(obj_player.x,obj_player.y,spd);
	}	
}
image_xscale = -1 * sign(xMove);

audio_emitter_position(emitter,x,y,0);

if(obj_player.lightOn)
{
	audio_emitter_gain(emitter,0.1);
}
else
{
	audio_emitter_gain(emitter,1);
}