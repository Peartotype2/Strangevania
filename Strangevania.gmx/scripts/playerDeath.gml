///playerDeath();

event_fire("PlayerDied");

if lives <= 0
{
    //CHANGE TO GAME OVER SCREEN
    event_fire("GameOver");
    with instance_create(0, 0, gameovermenu)
    {
    
    }
    roomFadeTo(level_gameover);
    exit;
}

gamemanager.playerDied = true;
lives--;
roomFadeTo(room);
