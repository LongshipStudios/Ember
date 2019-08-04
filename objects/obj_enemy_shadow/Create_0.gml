/// @description Insert description here
// You can write your code in this editor

//Stats
spd = 0.8;

//Movement variables
moveDir = 0;
xMove = 0;
yMove = 0;
canMove = false;
alarm[1] = 240;

//Default state
enemy_state = states.idle;
//Radius to transition to next set of animations.
tasty_rad = 250;
attack_rad = 60;

//Closest targetable instance
closest_nom = noone;

//Sprite bbox stuff (have to adjust for offset)
sprBBoxLeft = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
sprBBoxRight = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
sprBBoxBottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);
sprBBoxTop = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);

//Grab the id for the collision tile layer
var l = layer_get_id("Tiles_Collision");
tilemap_collision = layer_tilemap_get_id(l);

//Whether we can do a flee or not
do_flee = true;

//Audio
emitter = audio_emitter_create();
audio_falloff_set_model(audio_falloff_inverse_distance);
audio_emitter_position(emitter,x,y,0);
audio_emitter_falloff(emitter,50,1,1);
moveSound = audio_play_sound_on(emitter,snd_slime_move,true,80);
isAttacking = false;
