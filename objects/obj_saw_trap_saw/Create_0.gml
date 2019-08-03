/// @description Insert description here
// You can write your code in this editor

path_start(pth_saw_trap_horiz, 2, path_action_stop, 0);

//sndMain = audio_play_sound_at(snd_circular_saw,x,y,0,120,500,1,false,10);

emitter = audio_emitter_create();
audio_emitter_position(emitter,x,y,0)
audio_emitter_falloff(emitter,100,250,1);

audio_play_sound_on(emitter, snd_circular_saw, false, 100);