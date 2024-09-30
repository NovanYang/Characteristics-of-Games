/// @description Input delay and checks for movement and button presses
var up, down, accept, back;

// Only allow input checks after the 2-second delay
if (input_delay_timer > 0) {
    input_delay_timer--;  // Countdown the delay timer
} else {
    // Input checks for movement and button presses once delay is over
    up     = keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(0, gp_padu);
    down   = keyboard_check_pressed(vk_down) || gamepad_button_check_pressed(0, gp_padd);
    accept = mouse_check_button_pressed(mb_left) || keyboard_check_pressed(ord("F")) || gamepad_button_check_pressed(0, gp_face1) || keyboard_check_pressed(vk_space);
    back   = keyboard_check_pressed(ord("D")) || gamepad_button_check_pressed(0, gp_face2);

    // Check for movement (up and down) if the timer has finished
    if (up && image_index > 0) {
        image_index--;
    }

    if (down && image_index < image_number - 1) {  // Use image_number for total frames
        image_index++;
    }

    // Check for 'accept' input if the timer has finished
    if (accept) {
        if (image_index == 1) {
            game_end();  // End game
        } else if (image_index == 0) {
            audio_play_sound(Button, 10, false);
            room_goto(rm_main);  // Go to the main room
        }
    }
}
