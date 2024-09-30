// Define a variable for the delay timer
if (!timer_initialized) {
    hover_timer = 0;  // Initialize the hover timer
    timer_initialized = true;
}

// Convert mouse position to GUI coordinates for accurate hover detection
var mouse_gui_x = device_mouse_x_to_gui(0); // 0 means "use the first mouse device"
var mouse_gui_y = device_mouse_y_to_gui(0);

// Check if the mouse is over the button (using GUI coordinates)
is_hovered = (
    mouse_x >= x
    && mouse_x <= x + width
    && mouse_y >= y
    && mouse_y <= y + height
);

var _the_player = instance_nearest(x, y, obj_player);

// If the button is hovered, start the timer
if (is_hovered) {
    hover_timer += 1;  // Increment timer while the button is hovered
} else {
    hover_timer = 0;  // Reset the timer if not hovered
}

// Check if 15 frames has passed while hovering
if (hover_timer >= 15) {
    if (mouse_check_button_pressed(mb_left)) {
        sprite_index = spr_button_pressed;
        
        // Perform the action associated with the button
        switch (button_action) {
            case "HP":
                _the_player.max_health += 35;
                _the_player.player_health += 35;
                break;
            case "Attack Damage":
                _the_player.attack_damage += 0.75;
                break;
            case "Attack Range":
                _the_player.attack_range += 0.18;
                break;
            case "Attack Speed":
                _the_player.attack_speed += 0.07;
                break;
            case "Player Speed":
                _the_player.player_x_speed += 0.25;
                _the_player.player_y_speed += 0.25;
                break;
            case "Lifesteal":
                _the_player.life_steal += 0.07;
                break;
            case "All Stats":
                _the_player.player_x_speed += 0.05;
                _the_player.player_y_speed += 0.05;
                _the_player.max_health += 10;
                _the_player.player_health += 10;
                _the_player.attack_damage += 0.3;
                _the_player.attack_speed += 0.03;
                _the_player.life_steal += 0.02;
                break;
        }

        // Destroy all buttons in the list
        for (var i = 0; i < array_length(global.button_list); i++) {
            var button_id = global.button_list[i];
            if (instance_exists(button_id)) {
                instance_destroy(button_id);
            }
        }

        // Clear the button list
        global.button_list = [];
        
        global.paused = false;

        // Reset hover timer after performing action
        hover_timer = 0;
    }
}
