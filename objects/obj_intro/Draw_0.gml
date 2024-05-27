/// @description 
draw_sprite_ext(spr_introPicture, scene, VIEW_W/2, VIEW_H/2-48, 2, 2, 0, c_white, 1);

draw_set_font(font_dialog);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text_ext(VIEW_W/2, VIEW_H/2+64, dialogue[scene], font_get_size(font_dialog)+2, VIEW_W-64);