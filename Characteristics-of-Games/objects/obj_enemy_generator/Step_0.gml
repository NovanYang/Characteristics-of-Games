if(!global.paused){
	// Decrease the spawn timer by each frame
	spawn_timer -= 1;


	var cam = view_camera[0];
	var cam_x = camera_get_view_x(cam);
	var cam_y = camera_get_view_y(cam);
	var cam_w = camera_get_view_width(cam);
	var cam_h = camera_get_view_height(cam);

	// Check if it's time to spawn a new enemy and if the number of enemies is below the maximum
	if (spawn_timer <= 0 && current_enemies < max_enemies) {
		// Reset the spawn timer
		spawn_timer = spawn_interval;

		// Generate a random position outside the camera
		var spawn_x, spawn_y;

		switch (irandom(3)) {
			case 0:  // Left of the camera
				spawn_x = cam_x - camera_margin;
				spawn_y = irandom_range(cam_y - camera_margin, cam_y + cam_h + camera_margin);
				break;
			case 1:  // Right of the camera
				spawn_x = cam_x + cam_w + camera_margin;
				spawn_y = irandom_range(cam_y - camera_margin, cam_y + cam_h + camera_margin);
				break;
			case 2:  // Above the camera
				spawn_x = irandom_range(cam_x - camera_margin, cam_x + cam_w + camera_margin);
				spawn_y = cam_y - camera_margin;
				break;
			case 3:  // Below the camera
				spawn_x = irandom_range(cam_x - camera_margin, cam_x + cam_w + camera_margin);
				spawn_y = cam_y + cam_h + camera_margin;
				break;
		}

		// Create the enemy with increasing health and damage
		var new_enemy = instance_create_layer(spawn_x, spawn_y, "Instances", obj_enemy);
		new_enemy.enemy_health = current_health;
		new_enemy.enemy_damage = current_damage;
		new_enemy.xp_drop = xp_drop;

		// Update the number of enemies
		current_enemies += 1;
	}


	//growth control
	growth_timer ++;
	if(growth_timer > growth_duration){
		growth_timer = 0;
		//show_debug_message("Grow!");
		current_health += 0.5;
		current_damage += 0.05;
		spawn_interval -= 10;
		xp_drop += 1;
	}

	//prevent the enemy from growing too much
	if(spawn_interval < 20){
		spawn_interval = 20;
	}
	if(current_health > 30){
		current_health = 30;
	}
	if(current_damage > 5){
		current_damage = 5
	}	
}

