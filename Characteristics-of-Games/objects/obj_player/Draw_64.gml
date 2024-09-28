var xp_bar_width = 500;
var xp_bar_height = 20;
var xp_bar_x = 20;
var xp_bar_y = 20;

var xp_percentage = player_xp / xp_to_next_level;

draw_set_color(c_gray);
draw_rectangle(xp_bar_x, xp_bar_y, xp_bar_x + xp_bar_width, xp_bar_y + xp_bar_height, false);

xp_color = make_color_rgb(124, 197, 255);
draw_set_color(xp_color);
draw_rectangle(xp_bar_x, xp_bar_y, xp_bar_x + (xp_bar_width * xp_percentage), xp_bar_y + xp_bar_height, false);

draw_set_color(c_black);
draw_rectangle(xp_bar_x - 1, xp_bar_y - 1, xp_bar_x + xp_bar_width + 1, xp_bar_y + xp_bar_height + 1, true);

