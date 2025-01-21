///BreakBlock(objID)
var _id = argument[0];

with _id
{
    ColHitEffect(-4, -3, 3);
    if drop != -1
    {
        var dropName = object_get_name(drop);
        if string_contains("ai_", dropName) //If drop is an AI
        {
            var ai = instance_create(x+8, y+8, drop);
            ai.hurt = 4;
            if dropDeathEvent != -1 { ai.deathEvent = dropDeathEvent; }
            //Give the ai 4 frames of invincibility to survive the whip
            // hitbox that is breaking the block
        }
        else
        {
            instance_create(x+8, y+8, drop);
        }
    }
    var rep = round(random_range(2,4));
    var rx = random_range(6, 10);
    var ry = random_range(6, 10);
    repeat(rep) {instance_create(x+rx, y+ry, obj_debris)}
    audio_play_sound(snd_break, 0, 0);
    event_fire("BlockDestroyed");
    if onBreakEvent != -1 {event_fire(onBreakEvent);}
    instance_destroy();
}
