draw_self();

// Health bar parameters
var bar_width = 40; // Width of the health bar
var bar_height = 6;  // Height of the health bar
var bar_x = x - bar_width / 2; // Center the health bar under the player
var bar_y = y + sprite_height / 2 - 10; // Place the health bar below the player sprite

// Calculate health percentage
var health_percent = player_health / max_health;

// Draw the background of the health bar (grey color)
draw_set_color(c_gray);
draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, false);

// Draw the current health (green color)
draw_set_color(c_red);
draw_rectangle(bar_x, bar_y, bar_x + (bar_width * health_percent), bar_y + bar_height, false);

