/// @description Insert description here
// You can write your code in this editor

//On collide with player. Load next level

//Play Audio
audio_play_sound(snd_win_tone,10,false);
if (instance_number(obj_tiny_flames) <= 1)
{
	//Play Success Noise
	room_goto_next();
}
instance_destroy();