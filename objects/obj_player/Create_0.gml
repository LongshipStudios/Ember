//Default light radius
rad = 180;

//Movement variables
spd = 300;
spdRampUpSpd = 0.7; //time in seconds to max speed
spdRampDownSpd = 0.3; //time in seconds from max to 0 speed
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

//Whether the light is on or not
lightOn = true;

//Sprite bbox stuff (have to adjust for offset)
sprBBoxLeft = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
sprBBoxRight = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
sprBBoxBottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);
sprBBoxTop = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);

///init shadow casting
vertex_format_begin();
vertex_format_add_position();
vertex_format_add_color();
VertexFormat = vertex_format_end();

VBuffer = vertex_create_buffer();

surf = -1;

LightPosRadius = shader_get_uniform(shd_light,"u_fLightPositionRadius");

fireSound = audio_play_sound(snd_roaring_fire,120,true);

if (gamepad_is_supported() && gamepad_is_connected(0))
{
	gamepad_set_axis_deadzone(0, 0.15);
}
