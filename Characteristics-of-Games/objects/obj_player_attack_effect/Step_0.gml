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
