if(instance_exists(obj_player))
{
	audio_listener_position(obj_player.x, obj_player.y, fade);
}

if(mouse_check_button_pressed(mb_left))
{
	audio_play_sound_at(snd_test, room_width div 2, room_height div 2, 0, 100, 200, 1, false, 100);
}