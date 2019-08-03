/// @description Insert description here
// You can write your code in this editor

//Stats
spd = 1;

//Movement variables
moveDir = 0;
xMove = 0;
yMove = 0;

//Default state
enemy_state = states.idle;
//Radius to transition to next set of animations.
tasty_rad = 250;
attack_rad = 60;

//Sprite bbox stuff (have to adjust for offset)
sprBBoxLeft = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
sprBBoxRight = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
sprBBoxBottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);
sprBBoxTop = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);

//Grab the id for the collision tile layer
var l = layer_get_id("Tiles_Collision");
tilemap_collision = layer_tilemap_get_id(l);