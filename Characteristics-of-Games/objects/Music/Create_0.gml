/// @description Insert description here
// You can write your code in this editor
// Play the BGM at zero volume
global.bgm = audio_play_sound(BGM, 5, true);
global.bgm_volume = 0; // Start at volume 0
global.fade_speed = 0.01; // Adjust the speed of the fade (0.01 is gradual)