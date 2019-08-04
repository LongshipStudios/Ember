//Default light radius
rad = 175;
min_light_rad = 50;
max_light_rad = 175;
//Movement variables
spd = 190;
spdRampUpSpd = 0.7; //time in seconds to max speed
spdRampDownSpd = 0.05; //time in seconds from max to 0 speed
spdRampTimer = 0; //timer veriable for spdRamp
moveDir = 0;
xDir = 0;
xMove = 0;
yDir = 0;
yMove = 0;
movementInput = 0;
delta_time_sec = 0;

//Grab the id for the collision tile layer
var l = layer_get_id("Tiles_Collision");
tilemap_collision = layer_tilemap_get_id(l);
//tilemap_shadowcaster = layer_tilemap_get_id(layer_get_id("Tiles_Shadowcaster"));

//Whether the light is on or not
lightOn = true;

//Sprite bbox stuff (have to adjust for offset)
sprBBoxLeft = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
sprBBoxRight = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
sprBBoxBottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);
sprBBoxTop = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);

///init shadow casting
/**
vertex_format_begin();
vertex_format_add_position();
vertex_format_add_color();
VertexFormat = vertex_format_end();*/

//VBuffer = vertex_create_buffer();

surf = -1;

//LightPosRadius = shader_get_uniform(shd_light,"u_fLightPositionRadius");


if (gamepad_is_supported() && gamepad_is_connected(0))
{
	gamepad_set_axis_deadzone(0, 0.1);
}

draw_set_circle_precision(32);

//Audio stuffs
moveAudioEdge = false;
fireSound = audio_play_sound(snd_roaring_fire,120,true);
footstepSound = noone;

//footstepSound = audio_play_sound(snd_footstep_normal,120,true);

walk_anim_array[0] = spr_player_walk_right; //Right
walk_anim_array[1] = spr_player_walk_up; //Up
walk_anim_array[2] = spr_player_walk_left; //Left
walk_anim_array[3] = spr_player_walk_front; //Down
