/// @description 드로우
text_alpha = min(text_alpha+0.02, 1);
draw_set_font(font_missionComplete);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var c = c_red;
draw_text_color(VIEW_W/2, font_get_size(font_missionComplete)+2, "MISSION CLEAR!", c, c, c, c, text_alpha);

var yy = VIEW_H/2;
if text_alpha == 1 and relsGo{
	rels_alpha = once != 2 ? min(rels_alpha+0.01, 1) : max(rels_alpha-0.02, 0);
	
	draw_set_alpha(rels_alpha);
	draw_text(VIEW_W/2, yy, rels);
	/*draw_text(o, yy, "O");
	draw_text(v, yy, "V");
	draw_text(s1, yy, "S");
	draw_text(e1, yy, "E");
	draw_text(e2, yy, "E");
	draw_text(r1, yy, "R");
	draw_text(r2, yy, "R");
	draw_text(e3, yy, "E");
	draw_text(l, yy, "L");
	draw_text(s2, yy, "S");*/
	
	if rels_alpha==1 and once == 0{
		alarm[0] = 3*game_get_speed(gamespeed_fps);
		alarm[1] = 6*game_get_speed(gamespeed_fps);
		once = 1;
	}
}

if role_alpha > 0 {
	role_alpha = role_alpha+0.02;
	draw_set_alpha(role_alpha);
	draw_text(VIEW_W/2, yy, role);
}

if role_alpha > 6{
	draw_text(VIEW_W/2, VIEW_H-48, "END");
}
draw_set_alpha(1);