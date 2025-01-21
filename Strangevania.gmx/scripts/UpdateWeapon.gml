///UpdateWeapon()

var obj = weapon_parent;
var shotupgrade = 1;

if settings.noweapons
{
    gamemanager.weapon = WEP_NONE;
}

switch gamemanager.weapon
{
    case WEP_DAGGER: obj = weapon_dagger break;
    case WEP_AXE: obj = weapon_axe break;
    case WEP_WATER: obj = weapon_water break;
    case WEP_CROSS: obj = weapon_cross break;
    case WEP_WATCH: obj = weapon_watch break;
    case WEP_NONE: obj = weapon_parent break;
}

if instance_exists(obj) and obj != weapon_parent then exit;

if instance_exists(weapon_watch)
{
    if weapon_watch.canUse == false
    {
        director.disableAI = false;
    }
}

if instance_exists(weapon_parent)
{
    if weapon_parent.object_index == weapon_parent
    {
        shotupgrade = weapon_parent.maxprojectiles;
    }
}

with weapon_parent {instance_destroy();}

with instance_create(0, 0, obj)
{
    maxprojectiles = shotupgrade;
}


