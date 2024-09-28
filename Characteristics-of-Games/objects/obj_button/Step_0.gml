// Convert mouse position to GUI coordinates for accurate hover detection
var mouse_gui_x = device_mouse_x_to_gui(0); // 0 means "use the first mouse device"
var mouse_gui_y = device_mouse_y_to_gui(0);

// Check if the mouse is over the button (using GUI coordinates)
is_hovered = (mouse_gui_x >= x && mouse_gui_x <= x + 60 && mouse_gui_y >= y && mouse_gui_y <= y + 30);

if (is_hovered) {
    if (mouse_check_button_pressed(mb_left)) {
        // Perform the action associated with the button
        switch (button_action) {
            case "Max HP":
                // player_max_health += 10; // Example action
				
				show_message("Increase Max HP");
                break;
            case "Attack Damage":
                // player_attack_power += 5; // Example action
				show_message("Increase Attack Damage");
                break;
            case "Attack Range":
                // Example action

				show_message("Increase Attack RANGE");
                break;
            case "Attack Speed":
                // Example action
				show_message("Increase Attack Speed");
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

    }
}
