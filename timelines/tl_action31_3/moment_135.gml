///@desc 시체 변신
with(obj_dead){
	sprite_index = spr_deadbody;
}
with(objPa_player){
	var s = instance_create_layer(x, y, "Main", obj_scarecrow);
	s.image_xscale = image_xscale;
	image_alpha = 0;
}