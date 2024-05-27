function scr_dialogEnqueue(name, dialog_array, endEvent=noone){
	if !instance_exists(obj_dialogBox)
		instance_create_layer_rank(0, 0, "System", obj_dialogBox, 2);
	with(obj_dialogBox){
		ds_queue_enqueue(line_queue, "name", name);
		for(var i=0; i<array_length(dialog_array); ++i)
			ds_queue_enqueue(line_queue, dialog_array[i]);
		if endEvent != noone{
			ds_queue_enqueue(line_queue, "timeline");
			ds_queue_enqueue(line_queue, endEvent);
		}
	}
}