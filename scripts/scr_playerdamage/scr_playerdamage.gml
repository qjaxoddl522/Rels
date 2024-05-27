function scr_playerDamage(aimId, damage){
	damage = round(damage*random_range(0.9, 1.1));
	
	var dam = instance_create_layer(aimId.x, aimId.y, "System", obj_damageText);
	dam.damage = damage;
	if damage != 0{
		aimId.image_blend = c_red;
		aimId.alarm[10] = 0.5*game_get_speed(gamespeed_fps);
		aimId.alarm[3] = pRecoveryCooldown[aimId.player]*game_get_speed(gamespeed_fps);
		scr_screenShake(aimId.player, damage/5, .2);
	}
	pHealth[aimId.player] -= damage;
	pLowestHealth[aimId.player] = min(pLowestHealth[aimId.player], pHealth[aimId.player]);
}