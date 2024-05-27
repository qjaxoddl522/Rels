/// @description 시작화면, 타이머
stAlpha = max(0, stAlpha-.02);

draw_set_color(c_black);
draw_set_alpha(stAlpha);
draw_rectangle(0, 0, VIEW_W, VIEW_H, false);
draw_set_alpha((1-stAlpha)/2);
if rec_disap != 2{draw_rectangle(0, rh1, VIEW_W, rh2, false);}
draw_set_alpha(1);
draw_set_color(c_white);

if stAlpha == 0{
	tx += (aim_tx-tx)/20;
	if aim_tx-tx <= 2 and aim_tx = VIEW_W/2+2{
		aim_tx = VIEW_W*2;
		rec_disap = 1;
	}
	if rec_disap == 1{
		if abs(rh1-rh2) > 2{
			rh1 += 1;
			rh2 -= 1;
		}else{
			rec_disap = 2;
		}
	}
	draw_set_font(font_missionComplete);
	draw_text(tx, ty, "Mission Start");
}

draw_set_font(global.font_price);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(VIEW_W/2, 48, string(second div 60)+":"+string_format(second%60, 2, 0));