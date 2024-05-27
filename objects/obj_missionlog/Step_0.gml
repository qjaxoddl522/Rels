/// @description 스테이지 클릭
if p1x == p1Aimx and p2x == p2Aimx{
	var rangeX = 64, rangeY = 16;
	for(i=0;i<maxStage;i+=1){
		if mouse_check_button_pressed(mb_left) and global.chooseStage[0] != 0{
			if (mouse_x>p2x-rangeX and mouse_x<p2x+rangeX) and
			(mouse_y>stageFirstY+(i*stageSep)-rangeY and mouse_y<stageFirstY+(i*stageSep)+rangeY){
				global.chooseStage[1] = i+1;
				p2Aimx = VIEW_W+sprite_get_width(spr_missionPanel)/2+32;
			}
		}
	}
}

if abs(p1Aimx-p1x) >= 1{
	p1x += (p1Aimx-p1x)/15;
}else{
	p1x = p1Aimx;
}

if abs(p2Aimx-p2x) > 2{
	p2x += (p2Aimx-p2x)/15;
}else{
	p2x = p2Aimx;
	if p2Aimx > VIEW_W{
		instance_create_depth(0, 0, -1, obj_weaponLog);
		instance_destroy();
	}
}