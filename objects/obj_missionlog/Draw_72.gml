/// @description 변수 갱신
if global.chooseStage[0] != 0{
	maxStage = global.availableStage[0]>global.chooseStage[0] ? array_length(global.levelName[global.chooseStage[0]-1]) : global.availableStage[1];
}
stageFirstY = py-(stageSep*(maxStage-1)/2);