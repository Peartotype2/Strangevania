///scr_init_styles()

var _cost=2; _locked=3; _owned=4;
enum style
{
    cost = 2,
    locked = 3,
    owned = 4,
    name = 5,
    new = 6
}

var _total = director.skin_index_max;


for(i=0;i<_total;i++)
{
    var _c = 1;
    var _l = true;
    var _o = false;
    switch(i)
    {
        //Default skin
        case 0:
            _c = -1;
            _l = false
            _o = true;
        break;
        
        case 1:
            _c = 1000;
            _l = false
        break;
        
        case 2:
            _c = 500;
            _l = false
        break;
        
        case 3:
            _c = 800;
            _l = false
        break;
        
        case 4:
            _c = 300;
            _l = false
        break;
        
        case 5:
            _c = 1000;
            _l = false
        break;
        
        case 6:
            _c = 1200;
            _l = true
            var _achname = "firstkill";
            event_register_script(_achname+"_awarded", "skindex_"+string(i), style_unlock, i, _achname);
        break;
        
        case 7:
            _c = 1500;
            _l = true
            var _achname = "holybbq";
            event_register_script(_achname+"_awarded", "skindex_"+string(i), style_unlock, i, _achname);
        break;
        
        case 8:
            _c = 1000;
            _l = false
        break;
        
        case 9:
            _c = 1500;
            _l = true
            var _achname = "champion";
            event_register_script(_achname+"_awarded", "skindex_"+string(i), style_unlock, i, _achname);
        break;
        
        case 10:
            _c = 800;
            _l = true
            var _achname = "warlord";
            event_register_script(_achname+"_awarded", "skindex_"+string(i), style_unlock, i, _achname);
        break;
        
        case 11:
            _c = 99999;
            _l = false
        break;
    }
    
    styleinfo[i,_cost] = _c;
    styleinfo[i,_locked] = _l;
    styleinfo[i,_owned] = _o;
}
