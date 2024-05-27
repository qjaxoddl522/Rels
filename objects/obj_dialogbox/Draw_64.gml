/// @description 대화창
draw_sprite_ext(spr_dialogBox, 0, VIEW_W/2, VIEW_H, xscale, alpha, 0, c_white, alpha);
if xscale == 1{
	draw_sprite(spr_dialogBox, 1, VIEW_W/2, VIEW_H);
	
	var tx = VIEW_W/2-sprite_get_width(spr_dialogBox)/2+8, ty = VIEW_H-sprite_get_height(spr_dialogBox)+24;
	draw_set_font(font_dialog);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(name=="Rels" ? c_red : c_white);
	draw_text_ext(tx, ty, text_copy, font_get_size(font_dialog)+6, VIEW_W-16);
	draw_set_halign(fa_center);
	draw_text(tx+40, ty-22, name);
	
	if text_count >= string_length(text){
		if arrow_alpha > 1 or arrow_alpha < 0
			arrow_alpha_spd *= -1;
		arrow_alpha += arrow_alpha_spd;
		draw_sprite_ext(spr_dialogBox, 2, VIEW_W/2, VIEW_H, 1, 1, 0, c_white, arrow_alpha);
	}
}