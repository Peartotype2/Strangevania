///draw_whip_effect(whip_skin);

if settings.whipeffects == false then exit;

var _skin = argument[0];

switch(_skin)
{
    case "spine":
        if instance_exists(obj_whipbox)
        {
            var _yoff = -4;
            part_particles_create(ParticleSystem, whiptipx, obj_whipbox.y+_yoff, global.ptSpineBlood, 10);
        }
    break;
    
    case "spear":
        if instance_exists(obj_whipbox)
        {
            var _yoff = -2;
            var _part = global.ptSpearWindLeft;
            if player.image_xscale == -1 then _part = global.ptSpearWindRight;
            repeat(3)
            {
                var _rand = irandom_range(-4, 4);
                part_particles_create(ParticleSystem, player.x-3, obj_whipbox.y+_yoff+_rand, _part, 1);
            }
        }
    break;
}
