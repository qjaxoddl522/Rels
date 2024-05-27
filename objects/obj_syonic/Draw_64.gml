/// @description 
if appear{alpha = min(alpha+0.01, 1);}
if !appear{alpha = max(alpha-0.01, 0);}
draw_set_alpha(alpha);
draw_rectangle(0, 0, VIEW_W, VIEW_H, 0);
draw_set_alpha(1);

if alpha == 1{
	with(objPa_enemy){
		scr_damage(2, id, 100, 0);
	}
	appear = false;
}
if alpha == 0 and !appear{
	instance_destroy();
}