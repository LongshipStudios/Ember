///Fades light and sound based on player movement

//Player is moving, so turn off light and fire sounds, increase general volume.
if (lightOn == false)
{
	obj_player.rad  = max(0,rad-20);
	audio_sound_gain(fireSound, 0, 100);
	
	//Increases volume of all directional/binaural sounds
	if(instance_exists(obj_manager_audio)) { obj_manager_audio.fade = clamp(obj_manager_audio.fade-1000, 0, 10000) }
}
else
{
	obj_player.rad = min(180,rad+10);
	audio_sound_gain(fireSound, 1, 200);
	
	//Decreases volume of all directional/binaural sounds
    if(instance_exists(obj_manager_audio)) { obj_manager_audio.fade = clamp(obj_manager_audio.fade+1000, 0, 10000) }
}