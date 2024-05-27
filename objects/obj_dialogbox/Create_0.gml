/// @description 생성
depth = -6;
function dequeue(q){
	var dq = ds_queue_dequeue(q);
	switch(dq){
		case "name":{
			name = ds_queue_dequeue(q);
			if !ds_queue_empty(q){dequeue(q);}
		break;}
		case "timeline":{
			timeline_index = asset_get_index(ds_queue_dequeue(q));
			timeline_running = true;
			timeline_position = 0;
			inEvent = true;
		break;}
		default:{
			text = dq;
			text_copy = "";
			text_count = 0;
			alarm[0] = .05*game_get_speed(gamespeed_fps);
		break;}
	}
}

name = "NULL";
text = "";
text_copy = "";
text_count = 0;

line_queue = ds_queue_create();

viewX[0] = 0; //타임라인에서 화면전환으로 사용
viewY[0] = 0;
viewX[1] = 0; 
viewY[1] = 0;

//대화창 생성 애니메이션
alpha = 0; //yscale도 담당
xscale = 0.1;
first = true;

arrow_alpha = 0;
arrow_alpha_spd = 0.02;

//이벤트 관련
inEvent = false;