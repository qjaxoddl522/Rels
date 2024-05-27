// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_text_outline(xx, yy, text, inColor, outColor, thickness = 1){
	draw_set_color(outColor);
	draw_text(xx-thickness, yy, text);
	draw_text(xx+thickness, yy, text);
	draw_text(xx, yy-thickness, text);
	draw_text(xx, yy+thickness, text);
	draw_text(xx-thickness, yy-thickness, text);
	draw_text(xx-thickness, yy+thickness, text);
	draw_text(xx+thickness, yy-thickness, text);
	draw_text(xx+thickness, yy+thickness, text);
	
	draw_set_color(inColor);
	draw_text(xx, yy, text);
}