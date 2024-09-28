/// @description Insert description here
// You can write your code in this editor
// Step Event for obj_button
is_hovered = (mouse_x >= x && mouse_x <= x + 100 && mouse_y >= y && mouse_y <= y + 40); // Check if mouse is over the button

if (is_hovered) {
    if (mouse_check_button_pressed(mb_left)) {
        // Perform the action associated with the button
        switch (button_action) {
            case "Increase Max Health":
                //player_max_health += 10; // Example action
                break;
            case "Increase Attack Damage":
                //player_attack_power += 5; // Example action
                break;
				
			case "Increase Attack Range":
			    //player_attack_power += 5; // Example action
                break;
				
			case "Increase Attack Speed":
			    //player_attack_power += 5; // Example action
                break;
            
        }
        instance_destroy(); // Destroy the button after it's clicked
    }
}
