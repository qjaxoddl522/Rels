/// @description 인게임 뷰 조정
for(var i=0; i<array_length(players); ++i){
	if instance_exists(players[i]){
		//화면 흔들기
		if shake and view == i{
			shakeX = random_range(-pow, pow);
			shakeY = random_range(-pow, pow);
		}else{
			shakeX = 0;
			shakeY = 0;
		}
		
		//목표좌표
		if !instance_exists(obj_dialogBox){
			aimX[i] = lerp(players[i].x, players[i].cursor.x, 0.7);
			aimY[i] = lerp(players[i].y, players[i].cursor.y, 0.6);
		}else if obj_dialogBox.inEvent{
			aimX[i] = obj_dialogBox.viewX[i];
			aimY[i] = obj_dialogBox.viewY[i];
		}
		
		//실제로 더해지는 좌표
		var c = view_get_camera(i);
		var xx = (clamp(aimX[i]-view_get_wport(i)/2, 0, room_width-camera_get_view_width(c))-camera_get_view_x(c))/15;
		var yy = (clamp(aimY[i]-view_get_hport(i)/2-ui_h, 0, room_height-camera_get_view_height(c))-camera_get_view_y(c))/15;
		camera_set_view_pos(c, camera_get_view_x(c)+xx+shakeX, camera_get_view_y(c)+yy+shakeY);
	}
}