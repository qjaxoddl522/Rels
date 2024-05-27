/// @description UI드로우
var hx = VIEW_W/2;
var hy = 8;
draw_set_alpha(alpha);

//각 플레이어 UI
for(var i=0; i<array_length(players); ++i){
	if instance_exists(obj_player1) and instance_exists(obj_player2){
		var pcx = camera_get_view_x(view_get_camera(abs(i))), pcy = camera_get_view_y(view_get_camera(abs(i)));
		var pxOther = camera_get_view_x(view_get_camera(abs(i-1))), pyOther = camera_get_view_y(view_get_camera(abs(i-1)));
		
		//다른 플레이어 위치 표시
		var opx = clamp(players[abs(i-1)].x-pcx+(hx*i), 0+sprite_get_width(spr_entityLoc)/2+(hx*i), hx-sprite_get_width(spr_entityLoc)/2+(hx*i));
		var opy = clamp(players[abs(i-1)].y-pcy-sprite_get_height(spr_player1Idle), sprite_get_height(spr_entityLoc)/2, VIEW_H-sprite_get_height(spr_entityLoc)/2);
		draw_sprite(spr_entityLoc, abs(i-1), opx, opy);

		//딜레이 표시
		var dx = (sprite_get_height(spr_stateIcon)/2)+(hx*i)+hy, dy = VIEW_H-hy-sprite_get_height(spr_stateIcon)/2;
		draw_sprite(spr_stateIcon, players[i].behavior, dx, dy);
		
		if !players[i].isReady{
			var delaySurf = surface_create(sprite_get_width(spr_stateIcon), sprite_get_height(spr_stateIcon));
		
			surface_set_target(delaySurf);
			draw_clear_alpha(c_black, 0);
		
			draw_sprite_ext(spr_stateIcon, 0, sprite_get_width(spr_stateIcon)/2, sprite_get_height(spr_stateIcon)/2, 1, 1, 0, c_black, 0.7);
			gpu_set_blendmode(bm_subtract);
			var sc = players[i].isMoving ? 0 : ((players[i].maxDelay*game_get_speed(gamespeed_fps))-players[i].alarm[0])/(players[i].maxDelay*game_get_speed(gamespeed_fps));
			switch(players[i].behavior){
				case 0: sc = players[i].isMoving ? 0 : sc; break;
				case 1: sc = players[i].isAttacking ? 0 : sc; break;
				case 2: sc = players[i].isReloading ? 0 : sc; break;
			}
			draw_sprite_ext(spr_stateIcon, 0, sprite_get_width(spr_stateIcon)/2, sprite_get_height(spr_stateIcon)/2, sc, sc, 0, c_black, 1);
			gpu_set_blendmode(bm_normal);
			surface_reset_target();
		
			draw_surface(delaySurf, dx-sprite_get_width(spr_stateIcon)/2, dy-sprite_get_height(spr_stateIcon)/2);
			if players[i].alarm[0] > 0{
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				draw_set_font(font_keyDesc);
				scr_draw_text_outline(dx, dy, string_format(players[i].alarm[0]/game_get_speed(gamespeed_fps), 2, 1), c_black, c_white);
			}
			surface_free(delaySurf);
		}
		
		//탄창 표시
		var ammoStx = hx*(i+1)-6, ammoSty = dy-hy;
		for(var j=players[i].ammoMax; j>0; --j){
			draw_sprite(spr_ammoIcon, 1, ammoStx-(sprite_get_width(spr_ammoIcon)+4)*j, ammoSty);
		}
		for(var j=players[i].ammo; j>0; --j){
			draw_sprite(spr_ammoIcon, 0, ammoStx-(sprite_get_width(spr_ammoIcon)+4)*j, ammoSty);
		}
	}
	//체력바 표시
	if abs(pLowestHealth[i]+pRecoveryMax[i]-hpRec_mark[i]) >= .5{
		hpRec_mark[i] += ((pLowestHealth[i]+pRecoveryMax[i])-hpRec_mark[i])/20;
	}else{
		hpRec_mark[i] = round(pLowestHealth[i]+pRecoveryMax[i]);
	}
	if abs(pHealth[i]-hp_mark[i]) >= .5{
		hp_mark[i] += (pHealth[i]-hp_mark[i])/20;
	}else{
		hp_mark[i] = round(pHealth[i]);
	}
}

draw_sprite_ext(spr_healthbar, 0, hx-24, hy, -1, 1, 0, c_white, alpha);
draw_sprite_ext(spr_healthbar, 1, hx-24, hy, -1, 1, 0, c_white, alpha);
draw_sprite_part_ext(spr_healthbar, 1, 0, 0, sprite_get_width(spr_healthbar)*(hpRec_mark[0]/pMaxHealth[0]), sprite_get_height(spr_healthbar), hx-24, hy, -1, 1, c_green, alpha);
draw_sprite_part_ext(spr_healthbar, 2, 0, 0, sprite_get_width(spr_healthbar)*(hp_mark[0]/pMaxHealth[0]), sprite_get_height(spr_healthbar), hx-24, hy, -1, 1, c_white, alpha);

if !gamePause remainEnemy = instance_number(objPa_enemy);
draw_sprite(spr_remainEnemy, 0, hx, hy);
draw_set_font(font_dialog);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text(hx, hy+sprite_get_height(spr_remainEnemy)*3/4, room!=room_31 ? string(remainEnemy) : "?");

draw_sprite_ext(spr_healthbar, 0, hx+24, hy, 1, 1, 0, c_white, alpha);
draw_sprite_ext(spr_healthbar, 1, hx+24, hy, 1, 1, 0, c_white, alpha);
draw_sprite_part_ext(spr_healthbar, 1, 0, 0, sprite_get_width(spr_healthbar)*(hpRec_mark[1]/pMaxHealth[1]), sprite_get_height(spr_healthbar), hx+24, hy, 1, 1, c_green, alpha);
draw_sprite_part_ext(spr_healthbar, 2, 0, 0, sprite_get_width(spr_healthbar)*(hp_mark[1]/pMaxHealth[1]), sprite_get_height(spr_healthbar), hx+24, hy, 1, 1, c_white, alpha);

draw_set_alpha(1);

if global.missionState != ms.start and global.missionState != ms.playing{
	if endalpha > 0 and endalpha <= 1.5{
		endalpha = endalpha+0.02;
		draw_set_color(c_black);
		draw_set_alpha(endalpha);
		draw_rectangle(0, 0, VIEW_W, VIEW_H, 0);
		draw_set_alpha(1);
		draw_set_color(c_white);
	}else if endalpha > 1.5{
		room_goto(room != room_31 ? room_missonResult : room_ending);
	}
}