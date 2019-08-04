/// @description Insert description here
// You can write your code in this editor

emitter = audio_emitter_create();
audio_falloff_set_model(audio_falloff_inverse_distance);
audio_emitter_position(emitter,x,y,0)
audio_emitter_falloff(emitter,100,1,2);

audio_play_sound_on(emitter, snd_firefly, true, 70);