/// @description Insert description here
// You can write your code in this editor

if (enemy_state = states.grow)
{
	enemy_state = states.appraoch;
	image_index = 0;
}

if( sprite_index = spr_shadow_flee)
{
	sprite_index = spr_shadow_idle;
}

if(enemy_state = states.attack)
{
	//kill the torch
	var nearest_torch = instance_nearest(x,y,obj_torch);
		if(instance_exists(nearest_torch))
		{
			if(point_distance(x,y,nearest_torch.x,nearest_torch.y) < attack_rad)
			{
				with(nearest_torch)
				{
					lit = false;
					sprite_index = spr_torch_unlit;
					rad = 0;
				}
			}
		}
		
	enemy_state = states.idle;
	isAttacking = false;
}