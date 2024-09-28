/// @description Insert description here
// You can write your code in this editor
// Draw Event for obj_button
if (is_hovered) {
    draw_set_color(hovered_color); // Change color if hovered
} else {
    draw_set_color(button_color);   // Default button color
}
draw_rectangle(x, y, x + 60, y + 30, false); // Draw button rectangle
draw_set_color(c_black);            // Set text color
draw_text(x + 5, y + 5, button_text); // Draw button text



