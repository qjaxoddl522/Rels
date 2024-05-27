/// @description 일시정지 메뉴
if gamePause{
	aimPy = VIEW_H/2;
}else{
	aimPy = VIEW_H*3/2;
}

if abs(aimPy-py) > 1{
	py += (aimPy-py)/10;
}else{
	py = aimPy;
}

draw_sprite(spr_missionPanelHalf, 0, px, py);
draw_set_color(c_white);
draw_set_font(font_dialog);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(px, py-32, "일시정지됨");

var mey = py+8, reX = px-48, meX = px+48;
draw_sprite(spr_pauseMenu, 0, reX, mey);
draw_sprite(spr_pauseMenu, 1, meX, mey);

var range = sprite_get_width(spr_pauseMenu)/2;
var mx = device_mouse_x_to_gui(0), my = device_mouse_y_to_gui(0);
if mouse_check_button_pressed(mb_left){
	if (mx>reX-range and mx<reX+range) and (my>mey-range and my<mey+range){
		room_restart();
	}
	if (mx>meX-range and mx<meX+range) and (my>mey-range and my<mey+range){
		room_goto(room_mission);
	}
}
