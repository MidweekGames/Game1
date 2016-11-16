draw_set_colour($FFFFFF); // bgr
draw_set_font(fnt_score);
draw_set_halign(fa_center);
draw_text(view_wview[0] / 2, 20, "Score: " + string(score));
