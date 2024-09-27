//player's movement
if(keyboard_check(ord("A")) && (x - player_speed - 1 > 0)){
	x -= player_speed;
}

if(keyboard_check(ord("D")) && (x + player_speed + sprite_width + 1 < room_width)){
	x += player_speed;
}

if(keyboard_check(ord("W")) && (y - player_speed - 1 > 0)){
	y -= player_speed;
}

if(keyboard_check(ord("S")) && (y + player_speed + sprite_height + 1 < room_height)){
	y += player_speed;
}