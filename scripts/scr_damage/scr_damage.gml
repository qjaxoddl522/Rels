function scr_damage(orderPlayer, aimId, damage, dir){
	damage = round(damage*random_range(0.9, 1.1));
	
	var dam = instance_create_layer(aimId.x, aimId.y, "System", obj_damageText);
	dam.damage = damage;
	if damage != 0{
		aimId.lastDir = dir;
		aimId.lastDam = damage;
		aimId.lastPlayer = orderPlayer;
		aimId.hp_alpha = 3;
		aimId.image_blend = c_red;
		aimId.alarm[10] = 0.5*game_get_speed(gamespeed_fps);
		if orderPlayer != 2{
			totalDamage[orderPlayer] += weaponStat[pWeapon[orderPlayer][0]][0];
		}
		audio_play_sound(snd_enemydown, 0, false);
	}
	aimId.hp -= damage;
}