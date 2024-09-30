//set the initial sprite size to be bigger
image_xscale = 1.5;
image_yscale = 1.5;

var _player_level = instance_nearest(x, y, obj_player).player_level - 1;

//enemy stats
//enemy health
enemy_health = 2 + 0.2 * _player_level;
//enemy speed
enemy_speed = 1 + 0.07 * _player_level;
//enemy attack
enemy_damage = 0.1 + 0.05 * _player_level;
//enemy XP
xp_drop = 20 + 1.5 * _player_level;

//repel effect
repeled = false;
repeled_timer = 0;
repel_duration = 20;

//hit detect
can_hit = true;

//stuck detection
stuck_timer = 0

