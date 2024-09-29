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

if (is_hovered) {
    if (mouse_check_button_pressed(mb_left)) {
		sprite_index = spr_button_pressed
		
        // Perform the action associated with the button
        switch (button_action) {
            case "Max HP":
				_the_player.max_health += 15;
				_the_player.player_health += 15;
				
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
		
		global.paused = false;
    }
}
