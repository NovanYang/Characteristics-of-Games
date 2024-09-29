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
var xp_bar_x = 60;
var xp_bar_y = 50;


// Draw XP sprite in front of the XP bar
var exp_x = xp_bar_x - 40;  // X position of the XP sprite (adjust as needed)
var exp_y = xp_bar_y - 4;   // Y position of the XP sprite (adjust as needed)
draw_sprite(spr_exp, 0, exp_x, exp_y);  // Draw the XP sprite

var xp_percentage = player_xp / xp_to_next_level;

draw_set_color(c_gray);
draw_rectangle(xp_bar_x, xp_bar_y, xp_bar_x + xp_bar_width, xp_bar_y + xp_bar_height, false);

xp_color = make_color_rgb(124, 197, 255);
draw_set_color(xp_color);
draw_rectangle(xp_bar_x, xp_bar_y, xp_bar_x + (xp_bar_width * xp_percentage), xp_bar_y + xp_bar_height, false);

// outline
draw_set_color(c_black);
draw_rectangle(xp_bar_x - 1, xp_bar_y - 1, xp_bar_x + xp_bar_width + 1, xp_bar_y + xp_bar_height + 1, true);


<<<<<<< HEAD
pixel_font = font_add("ThaleahFat.ttf", 24, false, false, 32, 128);

draw_set_font(pixel_font)
// Draw player's current level above or near the XP bar
var level_text_x = xp_bar_x + xp_bar_width + 20;  // Position to the right of the XP bar
var level_text_y = xp_bar_y ;  // Vertically aligned with the XP bar
draw_set_color(c_white);  // Set the text color to white
draw_text(level_text_x, level_text_y, "Level: " + string(player_level));



// Draw health bar
var bar_width = max_health > 250 ? 500 : max_health * 2; // The width of the bar will scale with player hp
var bar_height = 20;  // Height of the health bar
var bar_x = 60; // Shift the health bar to the right to make space for the heart sprite
var bar_y = 20; 

// Draw heart sprite in front of the health bar
var heart_x = bar_x - 40;  // X position of the heart (adjust as needed)
var heart_y = bar_y - 4;   // Y position of the heart (adjust as needed)
draw_sprite(spr_heart, 0, heart_x, heart_y);  // Draw the heart sprite

// Calculate health percentage
var health_percent = player_health / max_health;
=======
// draw level
var _level__x = 540;
var _level_y = 45;

draw_set_font(pixel_font)
draw_set_color(c_ltgray)
draw_text(_level__x, _level_y, "LVL " + string(player_level)); // Draw button text
>>>>>>> 41deb0e88d0d29e00f20d60d54d221f9744459cf


// draw enemies slain
var _slain__x = 20;
var _slain_y = 80;

<<<<<<< HEAD
// outline
draw_set_color(c_black);
draw_rectangle(bar_x - 1, bar_y - 1, bar_x + bar_width + 1, bar_y + bar_height + 1, true);


// Draw player lives
var lives_x = 20;  // X position of the text
var lives_y = 80;  // Y position of the text
=======
draw_set_font(pixel_font)
draw_set_color(c_ltgray)
draw_text(_slain__x, _slain_y, "Slain " + string(enemies_killed)); // Draw button text
>>>>>>> 41deb0e88d0d29e00f20d60d54d221f9744459cf
