///Fades light and sound based on player movement

	
//Player is moving, so turn off light and fire sounds, increase general volume.
if (lightOn == false)
{
	obj_player.rad  = max(min_light_rad,rad-50);
	audio_sound_gain(fireSound, 0, 100);
//	audio_sound_gain(footstepSound, 1, 200);
	
	//Increases volume of all directional/binaural sounds
	if(instance_exists(obj_manager_audio)) { obj_manager_audio.fade = clamp(obj_manager_audio.fade-100000, 0, 1000000) }
}
else
{
	obj_player.rad = min(max_light_rad,rad+10);
	audio_sound_gain(fireSound, 1, 200);
//	audio_sound_gain(footstepSound, 0, 100);
	
	//Decreases volume of all directional/binaural sounds
    if(instance_exists(obj_manager_audio)) { obj_manager_audio.fade = clamp(obj_manager_audio.fade+100000, 0, 1000000) }
}