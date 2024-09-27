// Find the nearest player
var the_player = instance_nearest(x, y, obj_player);

// Check if the player exists
if (the_player != noone) {
    // Calculate the direction to the player
    var angle_to_player = point_direction(x, y, the_player.x, the_player.y);

    // Calculate the new position
    var new_x = x + lengthdir_x(enemy_speed, angle_to_player);
    var new_y = y + lengthdir_y(enemy_speed, angle_to_player);

    // Check for collisions with other enemies at the new position
    if (!place_meeting(new_x, y, obj_enemy)) {
        x = new_x; // Move horizontally only if no collision with another enemy
    }
    if (!place_meeting(x, new_y, obj_enemy)) {
        y = new_y; // Move vertically only if no collision with another enemy
    }
}

if(repeled){
	repeled_timer++
}
if(repeled_timer > repel_duration){
	repeled_timer = 0
	repeled = false;
	hspeed = 0;
	vspeed = 0;
}

if(enemy_health <= 0){
	instance_create_layer(x, y, "Instances", obj_enemy_killed_effect);
	instance_destroy(id);
}

//show_debug_message(enemy_health);
