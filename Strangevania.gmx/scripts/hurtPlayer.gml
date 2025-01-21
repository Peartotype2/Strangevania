///hurtPlayer(attacker, knockback)
var att = argument[0];
var knock = argument[1];

with player
{
    if not alive exit;
    
    event_fire("PlayerLostHealth", att.damage)
    var _newhp = max(hp - att.damage, 0);
    player_set_hp(_newhp);
    audio_play_sound(snd_hurt, 0, 0);
    
    if hp > 0 or gamemanager.budha //Otherwise have 0 iframes in budha mode and 1 hp
    {
        invincible = true;
        canhurt = false;
        alarm[3] = 2.5*room_speed;
    }
    
    if knock and !player.onStair and !player.stairLatching
    {
        var enemyDir = sign(x - att.x);
        if enemyDir == 0 then enemyDir = 1; 
    
        knocked = true;
        vsp = knockedheight;
        knockdir = enemyDir;
        hsp = knockedsp * knockdir;
        sprite_index = spr_player_knockback;
        image_xscale = enemyDir;
        //alarm[6] = knockeddelay;
    }
}
