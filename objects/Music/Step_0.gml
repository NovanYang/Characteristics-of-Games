/// @description Insert description here
// You can write your code in this editor
// Gradually increase the volume
if (global.bgm_volume < 1) {
    global.bgm_volume += global.fade_speed; // Increase volume by fade_speed
    if (global.bgm_volume > 1) {
        global.bgm_volume = 1; // Cap the volume at 1 (maximum)
    }
    audio_sound_gain(global.bgm, global.bgm_volume, 0); // Set the new volume
}
