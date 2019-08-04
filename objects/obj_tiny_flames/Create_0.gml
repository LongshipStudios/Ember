/// @description Insert description here
// You can write your code in this editor

emitter = audio_emitter_create();
audio_emitter_position(emitter,x,y,0)
audio_emitter_falloff(emitter,100,250,1);

audio_play_sound_on(emitter, snd_firefly, true, 100);