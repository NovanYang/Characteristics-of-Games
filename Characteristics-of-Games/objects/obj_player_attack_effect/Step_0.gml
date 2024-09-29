var the_player = instance_nearest(x, y, obj_player);

if(the_player != noone) {
    // Calculate the direction towards the mouse cursor
	if(!angle_set){
		angle = point_direction(the_player.x, the_player.y, mouse_x, mouse_y);
		angle_set = true;
	}

    // Define the offset distance from the player's position
    var offset_distance = 20; // Adjust this value for your desired offset

    // Update the position of the object with the offset applied
    x = the_player.x + lengthdir_x(offset_distance, angle);
    y = the_player.y + lengthdir_y(offset_distance, angle);
}

// Check if the sword beam hits an enemy
if (place_meeting(x, y, obj_enemy)) {
    // Find the nearest enemy
    var hit_enemy = instance_nearest(x, y, obj_enemy);

    // Apply the repel effect to the enemy
    var angle_to_enemy = point_direction(x, y, hit_enemy.x, hit_enemy.y);

    // Set a repel force (adjust as necessary)
    var repel_force = 3; // Adjust to control the strength of the repel effect

    // Apply the repel effect by adjusting enemy's hspeed and vspeed
    hit_enemy.hspeed = lengthdir_x(repel_force, angle_to_enemy);
    hit_enemy.vspeed = lengthdir_y(repel_force, angle_to_enemy);
	hit_enemy.repeled = true;
	if(hit_enemy.can_hit){
		hit_enemy.enemy_health -= obj_player.attack_damage;
		
		// apply lifesteal
		obj_player.player_health += obj_player.attack_damage * obj_player.life_steal;
	}
	hit_enemy.can_hit = false;
	hit_enemy.sprite_index = spr_enemy_hit;
}

