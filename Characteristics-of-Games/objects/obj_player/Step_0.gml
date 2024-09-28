if(!global.paused){
	//show_debug_message(player_health);
	//player's movement
	if (keyboard_check(ord("A"))
		|| keyboard_check(ord("D"))
		|| keyboard_check(ord("W"))
		|| keyboard_check(ord("S")))
	{
		if(keyboard_check(ord("A")) && (x - player_x_speed - 1 > 0)){
			player_walk = true;
			x_velocity = -player_x_speed;
			image_xscale = -1;
		}
		else if(keyboard_check(ord("D")) && (x + player_x_speed + 1 < room_width)){
			player_walk = true;
			x_velocity = player_x_speed;
			image_xscale = 1;
		} else {
			x_velocity = 0;
		}

		if(keyboard_check(ord("W")) && (y - player_y_speed - 1 > 0)){
			player_walk = true;
			y_velocity = -player_y_speed;
		}

		else if(keyboard_check(ord("S")) && (y + player_y_speed + 1 < room_height)){
			player_walk = true;
			y_velocity = player_y_speed;
		} else {
			y_velocity = 0;
		}
	}
	else {
		player_walk = false;
		player_idle = true;
		x_velocity = 0;
		y_velocity = 0;
	}

	if (player_walk) {
		player_idle = false;
	}

	if(player_idle && !player_attack){
		sprite_index = spr_player_idle;
	}
	if(player_walk && !player_attack){
		sprite_index = spr_player_walk;
	}

	if (x_velocity != 0 && y_velocity != 0) {
		x_velocity /= sqrt(2)
		y_velocity /= sqrt(2)
	}

	// update position
	x += x_velocity
	y += y_velocity

	if(mouse_check_button_pressed(mb_left) && attack_ready) {
		player_attack = true;
		attack_ready = false;
		
		// Choose and play a random attack sound effect
		var attack_sound = choose(SwordSwing, SwordSwing2);
		audio_play_sound(attack_sound, 10, false);  // Play chosen sound with priority and no looping
    
		// Choose attack sprite
		sprite_index = choose(spr_player_attack_1, spr_player_attack_2, spr_player_attack_3);
		image_speed = attack_speed;
		// Calculate the direction towards the mouse
		var angle = point_direction(x, y, mouse_x, mouse_y);
	
		// Create the sword beam in the direction of the mouse cursor
		var beam = instance_create_layer(x, y, "Instances", obj_player_attack_effect);
	
		if(mouse_x < x){
			image_xscale = -1.0;
		}
		else if (mouse_x > x){
			image_xscale = 1.0;
		}
	
		// Set the direction of the sword beam to face the mouse
		beam.image_xscale = attack_range;
		beam.image_yscale = attack_range;
		beam.direction = angle;
		beam.image_angle = angle;
	}

	//player level up 
	if (player_xp >= xp_to_next_level) {
		player_xp -= xp_to_next_level;
		player_level += 1;
		xp_to_next_level *= 1.2;
		
		
		var button1 = instance_create_layer(x - 100, y - 50, "Instances", obj_button);
	    button1.button_text = "Max HP"; // Set text for button 1
	    button1.button_action = "Max HP"; // Set action for button 1

	    var button2 = instance_create_layer(x - 200, y - 50, "Instances", obj_button);
	    button2.button_text = "Attack Damage"; // Set text for button 2
	    button2.button_action = "Attack Damage"; // Set action for button 2
		
		var button3 = instance_create_layer(x - 100, y - 100, "Instances", obj_button);
	    button3.button_text = "Attack Range"; // Set text for button 3
	    button3.button_action = "Attack Range"; // Set action for button 3
		
		var button4 = instance_create_layer(x - 200, y - 100, "Instances", obj_button);
	    button4.button_text = "Attack Speed"; // Set text for button 4
	    button4.button_action = "Attack Speed"; // Set action for button 4
	
	
	}	
}