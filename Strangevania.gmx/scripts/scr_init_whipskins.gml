///scr_init_styles()

var _cost=2; _locked=3; _owned=4; _name=5;

var _total = 99//director.whipskin_index_max;


for(i=0;i<_total;i++)
{
    var _c = 1;
    var _l = true;
    var _n = "";
    var _o = false;
    switch(i)
    {
        //Default skin
        case 0:
            _c = -1;
            _l = false
            _n = ""
            _o = true;
        break;
        
        case 1:
            _c = 1000;
            _l = true
            _n = "spine"
            _o = false;
            var _achname = "firstkill";
            event_register_script(_achname+"_awarded", "whipskin_"+string(i), whipskin_unlock, i, _achname);
        break;
        
        case 2:
            _c = 99;
            _l = false
            _n = "gold"
            _o = false;
        break;
        
        case 3:
            _c = 99;
            _l = false
            _n = "spear"
            _o = false;
        break;
        
        default: print("WHIPSKINS: " + string(i)); exit;
    }
    
    whipskin_info[i,_cost] = _c;
    whipskin_info[i,_locked] = _l;
    whipskin_info[i,_name] = _n;
    whipskin_info[i,_owned] = _o;
    whipskin_index_max++;
}
