// Control Variables
spawn_interval = 60;
spawn_timer = spawn_interval;
max_enemies = 100;
current_enemies = 0;

// Enemy Scaling Variables
base_health = 2;
base_damage = 0.1;
growth_timer = 0;
growth_duration = 600;

// Keep track of current enemy stats
current_health = base_health;
current_damage = base_damage;

// Camera boundaries for spawning enemies outside of the view
camera_margin = 100;
