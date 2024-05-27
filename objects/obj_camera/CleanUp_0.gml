/// @description 메모리 누수 방지
ds_grid_destroy(gridSight);
gridSight = -1;
surface_free(sight);
surface_free(shadow);