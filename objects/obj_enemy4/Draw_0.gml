/// @description 총 드로우
event_inherited();
weaponX = x;
weaponY = y-4;
if gridSight[# x div TILE_W, y div TILE_H] == 1{
	draw_sprite_ext(spr_gun, 0, weaponX, weaponY, 1, image_xscale, aimDir, c_white, 1);
	
	var _sy = y-TILE_H/2-sprite_get_yoffset(sprite_index)
	if isReloading
		draw_sprite(spr_reloading, 0, x, _sy);
	else if aimPlayer != noone
		draw_sprite(spr_entityLoc, 2, x, _sy);
}