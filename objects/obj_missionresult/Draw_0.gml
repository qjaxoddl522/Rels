/// @description 드로우
draw_sprite(spr_missionResultPaenl, 0, x, y);

text_alpha = (text_draw == 6 and aimY > room_height) ? max(text_alpha-0.02, 0) : min(text_alpha+0.02, 1);
draw_set_font(font_missionComplete);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var c = global.missionState == ms.clear ? c_white : c_red;
draw_text_color(VIEW_W/2, font_get_size(font_missionComplete)+2, global.missionState == ms.clear ? "MISSION CLEAR!" : "MISSION FAILED", c, c, c, c, text_alpha);

if text_alpha == 1 or (text_draw == 6 and aimY > room_height){
	if text_draw != 6{aimY = room_height/2+32;}
	y += (aimY-y)/15;
	if abs(aimY-y)<1 and once{
		once = false;
		y = aimY;
		alarm[0] = game_get_speed(gamespeed_fps);
	}
}

if !once{
	var xdis = sprite_get_width(spr_missionResultPaenl)/4;
	draw_set_font(font_dialog);
	for(var i=0; i<2; ++i){
		draw_text(x-xdis+xdis*2*i, y-72, text_draw>0 ? string(i+1)+"p" : "");
		draw_text(x, y-36, text_draw>1 ? "Kill" : "");
		draw_text(x-xdis+xdis*2*i, y-36, text_draw>1 ? string(totalkill[i]) : "");
		draw_text(x, y, text_draw>2 ? "Damage" : "");
		draw_text(x-xdis+xdis*2*i, y, text_draw>2 ? string(totalDamage[i]) : "");
		draw_text(x, y+36, text_draw>3 ? "Dead" : "");
		draw_text(x-xdis+xdis*2*i, y+36, text_draw>3 ? string(dead[i] ? 1 : 0) : "");
		if text_draw>3 {draw_line(x-xdis-32, y+54, x+xdis+32, y+54);}
		draw_text(x, y+72, text_draw>4 ? "Scrap" : "");
		draw_text(x-xdis+xdis*2*i, y+72, text_draw>4 ? string(earnScrap[i]) : "");
	}
	if text_draw == 6{
		if keyboard_check_pressed(pButton1[0]) or keyboard_check_pressed(pButton1[1]){
			aimY = room_height+sprite_get_height(spr_missionResultPaenl)/2+32;
		}
		if abs(aimY-y)<1 and aimY > room_height{
			room_goto(room_mission);
		}
	}
}

//스크랩 오름
if scrap_draw{
	scrX += (scrAimX-scrX)/15;
	if abs(scrAimX-scrX)<1{
		scX = scrAimX;
		var endX = -80;
		if scrAimX != endX{
			if snd{audio_play_sound(snd_scrapIncrease, 0 ,false); snd = false;}
			for(var i=0; i<2; ++i){
				if earnScrap[i]>0{
					--earnScrap[i];
					++scrap[i];
				}else if earnScrap[0]==0 and earnScrap[1]==0{
					scrAimX = endX;
				}
			}
		}else{
			scrap_draw = false;
			++text_draw;
		}
	}
	var textX = 24;
	for(var i=0; i<2; ++i){
		draw_sprite(spr_scrapIcon, 0, i ? VIEW_W-scrX : scrX, scrY);
		draw_set_font(global.font_price);
		draw_set_halign(i ? fa_right : fa_left);
		draw_text(i ? VIEW_W-scrX-textX : scrX+textX, scrY, scrap[i]);
	}
}