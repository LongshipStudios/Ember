/// @description Insert description here
// You can write your code in this editor

path_start(pth_saw_trap_horiz, 2, path_action_stop, 0);

//sndMain = audio_play_sound_at(snd_circular_saw,x,y,0,120,500,1,false,10);

emitter = audio_emitter_create();
audio_falloff_set_model(audio_falloff_inverse_distance);
audio_emitter_position(emitter,x,y,0)
audio_emitter_falloff(emitter,50,1,3);

audio_play_sound_on(emitter, snd_circular_saw, false, 90);