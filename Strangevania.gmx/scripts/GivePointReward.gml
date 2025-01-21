///GivePointReward(amount, popup, sound)
var amount = argument[0];
var popup = argument[1];
var sound = argument[2];

//gamemanager.points += amount;
game_add_points(amount);
if sound then audio_play_sound(snd_money, 0, 0);
if popup
{
    var obj = instance_create(player.x, player.y, obj_points_effect);
    obj.number = amount;
}
