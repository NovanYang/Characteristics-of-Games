// Define the position for the heart
var heart_x = 10;  // X position of the heart
var heart_y = 10;  // Y position of the heart

// Draw the heart sprite
draw_sprite(spr_heart, 0, heart_x, heart_y);

// Draw health bar next to the heart
var bar_x = heart_x + 40;  // Offset the bar_x to be right next to the heart (40 pixels to the right)
var bar_y = heart_y + 5;       // Align it with the Y position of the heart
var bar_width = max_health > 250 ? 500 : max_health * 2; // The width of the bar will scale with player hp
var bar_height = 20;  // Height of the health bar


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


// Define the position for the EX sprite
var ex_x = 10;  // X position of the EX sprite
var ex_y = 50;  // Y position of the EX sprite (below the heart)

// Draw the EX sprite
draw_sprite(spr_exp, 0, ex_x, ex_y);

// Draw XP bar next to the EX sprite
var xp_bar_x = ex_x + 40;  // Offset the xp_bar_x to be right next to the EX sprite (40 pixels to the right)
var xp_bar_y = ex_y +5;       // Align it with the Y position of the EX sprite
var xp_bar_width = 500;
var xp_bar_height = 20;

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
var _level__x = 570;
var _level_y = 50;

draw_set_font(fnt_pixel)
draw_set_color(c_ltgray)
draw_text(_level__x, _level_y, "LVL " + string(player_level)); // Draw button text


// draw enemies slain
var _slain__x = 20;
var _slain_y = 80;

draw_set_font(fnt_pixel)
draw_set_color(c_ltgray)
draw_text(_slain__x, _slain_y, "Slain " + string(enemies_killed)); // Draw button text
