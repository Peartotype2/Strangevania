///deathmessage_init_list()

///////////////////////
// --GOOD MESSAGES-- //
///////////////////////
var _tags = a1("good")

var _text = "#Have faith, Arthur. You've accomplished this before.";
deathmessage_register(_tags, true, _text, portrait_bright, snd_voice7);

var _text = "#You are stronger than him. You are a Valentine after all.";
deathmessage_register(_tags, true, _text, portrait_bright, snd_voice7);

var _text = "#Try again. This time will be different.";
deathmessage_register(_tags, true, _text, portrait_empty, snd_voice3);

//////////////////////
// --BAD MESSAGES-- //
//////////////////////

/////////////////////////////////////////////////////////
//DRACULA////////////////////////////////////////////////
var _tags       = a1("bad", "dracula")
var _voice      = char_dracula.voice;
var _portrait   = char_dracula.portrait
var _pitchMin   = char_dracula.pitchMin;
var _pitchMax   = char_dracula.pitchMax;

var _text = "#You can't make it. Just give it up Valentine. ";
deathmessage_register(_tags, true, _text, _portrait, _voice, 2, 0.5, 1.25, _pitchMin, _pitchMax);

var _text = "#Ha. Ha. Ha. Ha Ha Hahahahahahahaha.";
deathmessage_register(_tags, true, _text, _portrait, _voice, 2, 0.5, 1.25, _pitchMin, _pitchMax);

var _text = "#You humans should learn when you're beaten. ";
deathmessage_register(_tags, true, _text, _portrait, _voice, 2, 0.5, 1.25, _pitchMin, _pitchMax);

var _text = "#Pitiful. ";
deathmessage_register(_tags, true, _text, _portrait, _voice, 2, 0.5, 1.25, _pitchMin, _pitchMax);

/////////////////////////////////////////////////////////
//DEATH//////////////////////////////////////////////////
var _tags       = a1("bad", "death")
var _voice      = char_death.voice;
var _portrait   = char_death.portrait
var _pitchMin   = char_death.pitchMin;
var _pitchMax   = char_death.pitchMax;

var _text = "#On your face again? Maybe you should give it a rest. ";
deathmessage_register(_tags, true, _text, _portrait, _voice, 2, 0.65, 1.25, _pitchMin, _pitchMax);

var _text = "#You're not too good at this huh..........#Guess not. ";
deathmessage_register(_tags, true, _text, _portrait, _voice, 2, 0.65, 1.25, _pitchMin, _pitchMax);

var _text = "#How did you even make it this far? ";
deathmessage_register(_tags, true, _text, _portrait, _voice, 2, 0.65, 1.25, _pitchMin, _pitchMax);

var _text = "#Oh, you died again? I didn't notice. ";
deathmessage_register(_tags, true, _text, _portrait, _voice, 2, 0.65, 1.25, _pitchMin, _pitchMax);

var _text = "#You know, if losing was an Olympic sport, you'd be a gold medalist by now. ";
deathmessage_register(_tags, true, _text, _portrait, _voice, 2, 0.65, 1.25, _pitchMin, _pitchMax);

var _text = "#Did you lose your last life or your last brain cell? #Hard to tell with you. ";
deathmessage_register(_tags, true, _text, _portrait, _voice, 2, 0.65, 1.25, _pitchMin, _pitchMax);

var _text = "#I have to hand it to you, Arthur. You're consistent. #Consistently bad. ";
deathmessage_register(_tags, true, _text, _portrait, _voice, 2, 0.65, 1.25, _pitchMin, _pitchMax);

var _text = "#It's almost impressive.. #How you manage to snatch defeat from the jaws of victory every single time. ";
deathmessage_register(_tags, true, _text, _portrait, _voice, 2, 0.65, 1.25, _pitchMin, _pitchMax);

var _text = "#So, tell me, what's your excuse this time? #Did your fingers suddenly develop a mind of their own, #or did you just forget how to press buttons?";
deathmessage_register(_tags, true, _text, _portrait, _voice, 2, 0.65, 1.25, _pitchMin, _pitchMax);


