/// @description ammo재충전
event_inherited();
if isReloading{
	ammo = ammoMax;
	isReloading = false;
}