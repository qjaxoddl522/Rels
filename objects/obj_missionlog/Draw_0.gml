/// @description 패널 및 스테이지 드로우
draw_sprite(spr_missionPanel, 0, p1x, py);
draw_sprite(spr_missionPanel, 0, p2x, py);
draw_sprite(spr_missionMouseChoose, 0, p1x, 48);

draw_set_font(font_stageName);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if global.chooseStage[0] != 0{
	for(i=0;i<maxStage;i+=1){
		draw_text(p2x, stageFirstY+(i*stageSep),
		"<"+string(i+1)+"."+string(global.levelName[global.chooseStage[0]-1][i])+">");
	}
}

for(i=0;i<array_length(ch);i+=1){
	ch[i].x = p1x;
	if i+1<=global.availableStage[0]{
		instance_activate_object(ch[i]);
	}else{
		instance_deactivate_object(ch[i]);
	}
}