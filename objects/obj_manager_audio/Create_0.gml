audio_falloff_set_model(audio_falloff_inverse_distance);
fade = 0;

audio_listener_orientation( 0, -1, 0, 0, 0, -1);

//Cave ambience
audio_play_sound(snd_cave_ambiance,10,true);