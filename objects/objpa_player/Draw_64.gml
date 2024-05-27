/// @description 에임, 명중률 드로우
//에임 드로우
if isReady and aimId != noone and instance_exists(aimId) and (!instance_exists(obj_dialogBox) or obj_dialogBox.inEvent or (room=room_11 or room=room_12)){
	var spr = spr_cursorAttack; //에임 스프라이트
	var _x = aimId.x-camera_get_view_x(view_get_camera(player))+camera_get_view_width(view_get_camera(player))*player
	, _y = aimId.y-camera_get_view_y(view_get_camera(player));
	
	if hitRate == noone{//명중률 계산
		hitRate = scr_hitRate(weaponStat[pWeapon[player][0]][1], aimId);
	}
	if cursorIndex < sprite_get_number(spr_cursorAttack)-1
		cursorIndex += sprite_get_speed(spr_cursorAttack)/game_get_speed(gamespeed_fps);
	draw_sprite(spr_cursorAttack, cursorIndex, _x, _y);
	if cursorIndex == sprite_get_number(spr_cursorAttack)-1{
		var _color;
		if hitRate>0.8
			_color = c_lime;
		else if hitRate>0.5
			_color = c_yellow;
		else
			_color = c_red;
		draw_set_color(_color);
		draw_set_font(font_keyDesc);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text(_x, _y-24, string_format(hitRate*100, 3, 1)+"%");
	}
} else{
	cursorIndex = 0;
	hitRate = noone;
}