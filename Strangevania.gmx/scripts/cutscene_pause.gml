///cutscene_pause(true/false)

var _bool = argument[0];

/*director.disablePlayer = _bool;
director.disableAI = _bool;
director.disableItems = _bool;
gamemanager.stageTimePaused = _bool;*/

global.cutscene_paused = _bool;

cutscene_end_action();
