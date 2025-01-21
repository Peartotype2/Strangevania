///randomDrop()

var _weightTotal = 0;
var _table = gamemanager.candleDropTable
var _tableLen = ds_list_size(_table);

for(i = 0; i < _tableLen; i++)
{
    var _tempmap = _table[| i]
    var _weight = _tempmap[? "chance"];
    _weightTotal += _weight;
}

var _rand = random(1);
_rand = (_rand * _weightTotal);

for(i = 0; i < _tableLen; i++)
{
    var _tempmap = _table[| i]
    var _chance = _tempmap[? "chance"];
    var _drop = _tempmap[? "drop"];
    
    if (_rand < _chance)
    {
        return _drop;
    }
    _rand -= _chance;
}

/*var chance = irandom(100)
if chance<25 and obj_player.whip < 3
{
    return item_up_whip;
}
else if chance<25
{
    return obj_smallheart;
}
else if chance>25 and chance<50
{
    return obj_smallheart;
}
else if chance>50 and chance<65
{
    return obj_bigheart;
}
else if chance>65 and chance<80
{
    return item_up_chicken;
}
else if chance>80 and chance<85
{
    return obj_debris;
}
else if chance>85 and chance<90
{
    //change this
    return obj_bigheart;
}
else if chance>90 and chance<91
{
    return obj_candle;
}

return obj_smallheart;*/

