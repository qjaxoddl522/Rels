function scr_effect(xx, yy, sprite, _layer="Main"){
	var ef = instance_create_layer(xx, yy, _layer, obj_shotEffect);
	ef.sprite_index = sprite;
}