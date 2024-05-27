/// @description 방황 좌표
behavior = state.stray;

switch(room){
	case room_22:{
		moveX = firstX;
		moveY = firstY;
	break;}
	default:{
		moveX = lastPx;
		moveY = lastPy;
	}
}