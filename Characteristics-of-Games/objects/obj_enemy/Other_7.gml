//return to idle animation after hit animation
if(sprite_index == spr_enemy_hit){
	sprite_index = spr_enemy_idle;
}

//set correct hit state
with(obj_enemy){
	can_hit = true;
}