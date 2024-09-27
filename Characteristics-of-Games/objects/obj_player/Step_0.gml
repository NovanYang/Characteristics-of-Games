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

if(player_idle){
	sprite_index = spr_player_idle;
}
if(player_walk){
	sprite_index = spr_player_walk;
}

if (x_velocity != 0 && y_velocity != 0) {
	x_velocity /= sqrt(2)
	y_velocity /= sqrt(2)
}

// update position
x += x_velocity
y += y_velocity