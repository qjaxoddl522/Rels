function scr_createDead(unit, spr, xscale, dir, spd){
	var dead = instance_create_layer(unit.x, unit.y, "Main", obj_dead);
	dead.sprite_index = spr;
	dead.image_xscale = xscale;
	dead.dir = dir;
	dead.spd = spd;
}