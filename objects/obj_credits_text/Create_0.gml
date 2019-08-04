/// @description Insert description here
// You can write your code in this editor
audio_play_sound(snd_credits_music,10,true);

list = ds_list_create();

ds_list_add(list, "Alexander \"ASPePeX\" Scheurer - Stuff");
ds_list_add(list, "Bobby Frazier - Designer");
ds_list_add(list, "Brian Edwards - Sound");
ds_list_add(list, "Erin Fitzmorris - Artist");
ds_list_add(list, "Firelizard135 - Artist");
ds_list_add(list, "Gmandev - Programmer");
ds_list_add(list, "Narsis - Programmer");

randomize();
ds_list_shuffle(list);
