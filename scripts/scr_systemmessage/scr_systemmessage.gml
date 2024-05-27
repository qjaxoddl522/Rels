function scr_systemMessage(player, text){
	var sys = instance_create_layer(player<2 ? VIEW_W/4+(VIEW_W/2*player) : VIEW_W/2, 0, "System", obj_systemMessage);
	sys.text = text;
}