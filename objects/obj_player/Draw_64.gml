// Draw health bar
var bar_width = max_health > 250 ? 500 : max_health * 2; // The width of the bar will scale with player hp
var bar_height = 20;  // Height of the health bar
var bar_x = 20; 
var bar_y = 20; 

// Calculate health percentage
var health_percent = player_health / max_health;

// Draw the background of the health bar (grey color)
draw_set_color(c_gray);
draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, false);

// Draw the current health (green color)
draw_set_color(c_red);
draw_rectangle(bar_x, bar_y, bar_x + (bar_width * health_percent), bar_y + bar_height, false);

// outline
draw_set_color(c_black);
draw_rectangle(bar_x - 1, bar_y - 1, bar_x + bar_width + 1, bar_y + bar_height + 1, true);


// draw xp bar
var xp_bar_width = 500;
var xp_bar_height = 20;
var xp_bar_x = 20;
var xp_bar_y = 50;

var xp_percentage = player_xp / xp_to_next_level;

draw_set_color(c_gray);
draw_rectangle(xp_bar_x, xp_bar_y, xp_bar_x + xp_bar_width, xp_bar_y + xp_bar_height, false);

xp_color = make_color_rgb(124, 197, 255);
draw_set_color(xp_color);
draw_rectangle(xp_bar_x, xp_bar_y, xp_bar_x + (xp_bar_width * xp_percentage), xp_bar_y + xp_bar_height, false);

// outline
draw_set_color(c_black);
draw_rectangle(xp_bar_x - 1, xp_bar_y - 1, xp_bar_x + xp_bar_width + 1, xp_bar_y + xp_bar_height + 1, true);


// draw level
var _level__x = 540;
var _level_y = 45;

draw_set_font(pixel_font)
draw_set_color(c_ltgray)
draw_text(_level__x, _level_y, "LVL " + string(player_level)); // Draw button text


// draw enemies slain
var _slain__x = 20;
var _slain_y = 80;

draw_set_font(pixel_font)
draw_set_color(c_ltgray)
draw_text(_slain__x, _slain_y, "Slain " + string(enemies_killed)); // Draw button text