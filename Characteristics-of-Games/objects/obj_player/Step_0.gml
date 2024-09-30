if(!global.paused){
	//show_debug_message(player_health);
	//player's movement
	if (keyboard_check(ord("A"))
		|| keyboard_check(ord("D"))
		|| keyboard_check(ord("W"))
		|| keyboard_check(ord("S")))
	{
		var walk_sound = choose(Walking, Walking2);
		audio_play_sound(walk_sound, 10, false);  // Play chosen sound with priority and no looping
    
		
		// Set an alarm for 60 steps (1 second at 60 FPS)

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

	if((mouse_check_button_pressed(mb_left) || keyboard_check(vk_space)) && attack_ready) {
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
		global.paused = true;
	
		sprite_index = spr_player_idle;
		player_attack = false;
		attack_ready = true; 
		
		player_xp -= xp_to_next_level;
		player_level += 1;
		xp_to_next_level *= 1.2;
		
		var upgrade_sound = choose(Upgrade, Upgrade2, Upgrade3, Upgrade4, Upgrade5, Upgrade6);
		audio_play_sound(upgrade_sound, 10, false);  // Play chosen sound with priority and no looping
    
	
		// randomly select 3 upgrades to choose from
		var _upgrade_choices = [
			"HP", 
			"Attack Damage", 
			"Attack Range", 
			"Attack Speed", 
			"Player Speed",
			"Lifesteal",
			"All Stats"
		]
		var _length = array_length(_upgrade_choices)
		
		var _ichoice1 = irandom_range(0, _length - 1);
		
		var _ichoice2 = irandom_range(0, _length - 1);
		while (_ichoice2 == _ichoice1) {
			_ichoice2 = irandom_range(0, _length - 1);
		}
		
		var _ichoice3 = irandom_range(0, _length - 1);
		while (_ichoice3 == _ichoice1 || _ichoice3 == _ichoice2) {
			_ichoice3 = irandom_range(0, _length - 1);
		}
		
		var _button_x = x - 96;
		var _button_y = y - 100;
	
		// take into account the edges of the GUI
		if (_button_x < 200 - 96) _button_x = 200 - 96;
		else if (_button_x > 800 - 96) _button_x = 800 -96;
		if (_button_y < 150 - 96) _button_y = 150 - 96;
		else if (_button_y > 850 - 96) _button_y = 850 - 96;
		
		var _button1 = instance_create_layer(_button_x, _button_y, "UI_Instances", obj_button);
	    _button1.button_text = _upgrade_choices[_ichoice1]; // Set text for button 1
	    _button1.button_action = _upgrade_choices[_ichoice1]; // Set action for button 1
		
		_button_y += 76
		var _button2 = instance_create_layer(_button_x, _button_y, "UI_Instances", obj_button);
	    _button2.button_text = _upgrade_choices[_ichoice2]; 
	    _button2.button_action = _upgrade_choices[_ichoice2]; 
		
		_button_y += 76
		var _button3 = instance_create_layer(_button_x, _button_y, "UI_Instances", obj_button);
	    _button3.button_text = _upgrade_choices[_ichoice3]; 
	    _button3.button_action = _upgrade_choices[_ichoice3]; 
	}	
}

if (player_health > max_health) {
	player_health = max_health
}
else if (player_health < 0) {
	audio_play_sound(GameOver, 10, false);
	room_goto(endMenu)
}