///Fades light and sound based on player movement

//Player is moving, so turn off light and fire sounds, increase general volume.
if (lightOn == false)
{
	obj_player.rad  = max(0,rad-10);
	audio_sound_gain(fireSound, 0, 200);
	//TODO: Gain on all other sounds increase
}
else
{
	obj_player.rad = min(180,rad+10);
	audio_sound_gain(fireSound, 1, 200);
	//TODO: Gain on all other sounds decrease

}