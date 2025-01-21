///DrawWeaponIcon()

var spr = spr_up_whip;
var xoff = 18;
var yoff = 10;

switch gamemanager.weapon
{
    case WEP_DAGGER: spr = spr_dagger break;
    case WEP_AXE: spr = spr_axe break;
    case WEP_WATER: spr = spr_water break;
    case WEP_CROSS: spr = spr_cross break;
    case WEP_WATCH: spr = spr_watch break;
    
    case WEP_NONE: exit break;
}

draw_sprite(spr, 0,
 hud_itembox_x + xoff + viewx, hud_itembox_y + yoff + viewy)

