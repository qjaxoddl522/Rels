/// @description 일시정지
gpu_set_blendenable(false);
if gamePause{
	surface_set_target(application_surface);
	if surface_exists(pauseSurf) 
		draw_surface(pauseSurf, 0, 0);
	else{
		pauseSurf = surface_create(VIEW_W, VIEW_H);
		buffer_set_surface(pauseSurfBuffer, pauseSurf, 0);
	}
	surface_reset_target();
}

if keyboard_check_pressed(vk_escape){
	if !gamePause{
		gamePause = true;
		
		instance_deactivate_all(true);
		
		pauseSurf = surface_create(VIEW_W, VIEW_H);
		surface_set_target(pauseSurf);
		draw_surface(application_surface, 0, 0);
		surface_reset_target();
		if buffer_exists(pauseSurfBuffer)
			buffer_delete(pauseSurfBuffer)
		pauseSurfBuffer = buffer_create(VIEW_W * VIEW_H * 4, buffer_fixed, true);
		buffer_get_surface(pauseSurfBuffer, pauseSurf, 0);
	}else{
		gamePause = false;
		
		instance_activate_all();
		
		if surface_exists(pauseSurf) 
			surface_free(pauseSurf);
		if buffer_exists(pauseSurfBuffer)
			buffer_delete(pauseSurfBuffer)
	}
}
gpu_set_blendenable(true);