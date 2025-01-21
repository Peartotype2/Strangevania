///style_mark_new(id)

var _id = argument[0];

//Check if the ID of the skin is already marked as new in the list
var _pos = ds_list_find_index(director.newskin_list, _id)
if _pos == -1
{
    ds_list_add(director.newskin_list, _id); //Add the skin ID to the list of new skins
}
else
{
    print("TRIED TO MARK SKIN ", _id, " AS NEW WHEN IT IS ALREADY MARKED")
}
