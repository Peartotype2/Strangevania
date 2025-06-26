///GetDeathMessage(tags OR id)

var _tags = "bad";
var _type = argument[0];

if is_real(_type)
{
    var _id = _type;
    if _id == -1
    {
        var _rand = irandom(DM_COUNT-1)
        return DM_LIST[| _rand];
    }
    
    return DM_LIST[| _id];
}
else if is_string(_type) {_tags = a1(_type);}
else if is_array(_type) {_tags = _type;}

var _tagCount = array_length_1d(_tags);
var _tempList = ds_list_create();

//Add all msgs with correct tags to tempList
for(m=0; m<DM_COUNT; m++) //Loop through all DMs
{
    var _matchingTags = 0;
    var _msg    = DM_LIST[| m];
    var _mtags  = _msg[? "tags"];
    for(t=0;t<_tagCount;t++) //Loop through tags
    {
        //var _msg    = DM_LIST[| m];
        //var _mtags  = _msg[? "tags"];
        if value_in_array(_tags[t], _mtags)
        {
            _matchingTags++;
            if _matchingTags == array_length_1d(_tags) {ds_list_add(_tempList, _msg);}
        }
    }
}

var _tempListCount = ds_list_size(_tempList);

var _rand = irandom(_tempListCount-1)
var _returnMessage = _tempList[| _rand];

ds_list_destroy(_tempList);

return _returnMessage;
