if(!global.paused){
	// find the nearest player
	var the_player = instance_nearest(x, y, obj_player);

	// perform correct attack effect when player object exist
	if (the_player != noone) {
		//get the correct angle for the attack effect
		var angle_to_player = point_direction(x, y, the_player.x, the_player.y);

		// Calculate the new position
		var new_x = x + lengthdir_x(enemy_speed, angle_to_player);
		var new_y = y + lengthdir_y(enemy_speed, angle_to_player);

		// Check for collisions with other enemies at the new position
		if (!place_meeting(new_x, y, obj_enemy)) {
			x = new_x; // Move horizontally only if no collision with another enemy
		}
		else{
			//when studck somehow, add timer
			stuck_timer += 1
		}
		if (!place_meeting(x, new_y, obj_enemy)) {
			y = new_y; // Move vertically only if no collision with another enemy
		}
		else{
			//when studck somehow, add timer
			stuck_timer += 1
		}
	}

	//only repel for certain amount of time
	if(repeled){
		repeled_timer++
	}
	//return to noremal movment
	if(repeled_timer > repel_duration){
		//reset timer
		repeled_timer = 0
		//set state correctly
		repeled = false;
		//reset h and v speed
		hspeed = 0;
		vspeed = 0;
	}

	//destory self when health is below 0
	if(enemy_health <= 0){
		//create correct kill effect
		instance_create_layer(x, y, "Instances", obj_enemy_killed_effect);
		//update enemy gener
		obj_enemy_generator.current_enemies -= 1;
		instance_destroy(id);
		obj_player.player_xp += xp_drop;
		
		audio_play_sound(EnemyKilled, 10, false);
		
	}

	//show_debug_message(enemy_health);
	if(place_meeting(x, y, obj_player)){
		var the_player = instance_place(x, y, obj_player);
		instance_create_layer(the_player.x, the_player.y, "Instances", obj_player_get_hit_effect);
		the_player.player_health -= enemy_damage;
	}

	//when stuck for long time, destory it
	if(stuck_timer > 500){
		//show_debug_message("stuck clear");
		//update enemy gener
		obj_enemy_generator.current_enemies -= 1;
		instance_destroy(id)
	}
}


