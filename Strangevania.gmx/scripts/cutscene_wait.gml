///cutscene_wait(seconds)

timer++;

if timer >= argument[0] * room_speed
{
    timer = 0;
    cutscene_end_action();
}
