/// @description 대미지 드로우
draw_set_font(global.font_damage);
draw_set_color(c_white);
draw_set_alpha(alpha);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if damage != 0{
	draw_text(x, y, damage);
}else{
	draw_text(x, y, "Miss");
}

x += xx;
y += yy;
yy += acY;

alpha -= yy>0 ? 0.02 : 0;
if alpha <= 0
	instance_destroy();

draw_set_alpha(1);