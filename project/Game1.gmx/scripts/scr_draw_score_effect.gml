// 0 = x
// 1 = y
// 2 = score


var red = 255 - (255 * (argument2 / 1000));
red = min(255, max(0, red));
var green = 255 * (argument2 / 1000);
green = min(255, max(0, green));
var blue = red + green / 2;
var color = make_colour_rgb(red, green, blue);
draw_set_font(fnt_score);
draw_set_halign(fa_left);
draw_text_transformed_colour(argument0, argument1, string(score), xscale, yscale, angle, color, color, color, color, alpha);


