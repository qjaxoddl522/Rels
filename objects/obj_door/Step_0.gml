/// @description 조건 충족 시 문열림
if (objPa_missionManager.condition >= condition and condition != -1) and !open{
	++image_index;
	instance_destroy(wall);
	open = true;
}