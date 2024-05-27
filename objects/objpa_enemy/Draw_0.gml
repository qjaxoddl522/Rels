/// @description 자동 드로우 끄기
//캐릭터 및 무기 드로우
if gridSight[# x div TILE_W, y div TILE_H] == 1
{
	draw_self();
	
	if hp_alpha > 0{
		draw_set_alpha(hp_alpha);
		var wid = TILE_W*4/5, hei = 2;
		var yy = 12;
		draw_set_color(c_black);
		draw_rectangle(x-wid/2-1, y+yy-hei/2-1, x+wid/2+1, y+yy+hei/2+1, false);
		draw_set_color(c_red);
		draw_rectangle(x-wid/2, y+yy-hei/2, x-wid/2+wid*(hp_mark/hp_max), y+yy+hei/2, false);
		
		draw_set_alpha(1);
	}
	hp_alpha = max(hp_alpha-0.02, 0);
}