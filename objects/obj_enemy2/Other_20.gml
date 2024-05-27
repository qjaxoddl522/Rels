/// @description 방황좌표 지정
behavior = state.stray;

switch(room){
	case room_21:{
		moveX = 464;
		moveY = 944;
	break;}
	default:{
		moveX = lastPx;
		moveY = lastPy;
	break;}
}