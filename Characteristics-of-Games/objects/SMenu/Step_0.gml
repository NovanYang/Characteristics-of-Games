/// @description Insert description here
// You can write your code in this editor
var up, down, accept, back;

up 	   = keyboard_check_pressed(vk_up ) or gamepad_button_check_pressed(0, gp_padu);
down   = keyboard_check_pressed(vk_down) or gamepad_button_check_pressed(0, gp_padd);
accept = mouse_check_button_pressed(mb_left)or keyboard_check_pressed(ord("F")) or gamepad_button_check_pressed(0, gp_face1) or keyboard_check_pressed(vk_space);
back   = keyboard_check_pressed(ord("D")) or gamepad_button_check_pressed(0, gp_face2);

if up and image_index >0{
	
	image_index--;
	
}

if  down and image_index <image_index-1{
	
	image_index ++;
}

if image_index = 1 and accept{
	game_end();
}

if image_index = 0 and accept{
	audio_play_sound(Button, 10, false);
	room_goto(rm_main);
}