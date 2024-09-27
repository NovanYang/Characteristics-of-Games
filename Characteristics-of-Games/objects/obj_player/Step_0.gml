//player's movement
if(keyboard_check(ord("A")) && (x - player_x_speed - 1 > 0)){
	player_walk = true;
	player_idle = false;
	x -= player_x_speed;
	image_xscale = -1;
}
else if(keyboard_check(ord("D")) && (x + player_x_speed + 1 < room_width)){
	player_walk = true;
	player_idle = false;
	x += player_x_speed;
	image_xscale = 1;
}
else if(keyboard_check(ord("W")) && (y - player_y_speed - 1 > 0)){
	player_walk = true;
	player_idle = false;
	y -= player_y_speed;
}

else if(keyboard_check(ord("S")) && (y + player_y_speed + 1 < room_height)){
	player_walk = true;
	player_idle = false;
	y += player_y_speed;
}
else{
	player_walk = false;
	player_idle = true;
}

if(player_idle){
	sprite_index = spr_player_idle;
}
if(player_walk){
	sprite_index = spr_player_walk;
}