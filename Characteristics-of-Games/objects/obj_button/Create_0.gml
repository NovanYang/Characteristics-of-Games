// Create Event for obj_button
button_text = "";        // Text to display on the button
button_action = "";      // Action to perform when clicked

width = 192
height = 64

button_color = c_white;  // Button color
hovered_color = c_gray;  // Color when hovered
pressed_color = c_black; // Color when pressed
is_hovered = false;      // State variable to track hover state

// Add this button instance to the global button list
array_push(global.button_list, self); // Add this button instance to the list
