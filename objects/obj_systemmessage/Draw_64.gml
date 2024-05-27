/// @description 텍스트 드로우
y += (aimY-y)/10;
if abs(aimY-y)<1{
	y = aimY;
	alpha -= 0.02;
	if alpha<=0
		instance_destroy();
}

draw_set_color(c_white);
draw_set_font(font_dialog);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(alpha);
draw_text(x, y, text);

draw_set_alpha(1);