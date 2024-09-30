/// @description Insert description here
// You can write your code in this editor
// Draw Event for obj_button
if (is_hovered) {
    sprite_index = spr_button_hover
} else {
    sprite_index = spr_button_blue
}

var gui_width = display_get_gui_width()
var gui_height = display_get_gui_height()

var cam_x = camera_get_view_x(view_camera[0])
var cam_y = camera_get_view_y(view_camera[0])

var view_width = camera_get_view_width(view_camera[0])
var view_height = camera_get_view_height(view_camera[0])

var _x = (x - cam_x) * (gui_width / view_width)
var _y = (y - cam_y) * (gui_height / view_height)

draw_set_font(fnt_pixel);
draw_set_color(c_dkgray)
draw_text(_x + 50, _y + 32, button_text + " UP"); // Draw button text
