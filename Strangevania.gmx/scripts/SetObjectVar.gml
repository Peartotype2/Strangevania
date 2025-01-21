///SetObjectVar(objID, variable, value)

var _obj = argument[0];
var _var = argument[1];
var _val = argument[2];

//Setting a variable that doesn't exist will not throw an error
//but will just give that instance the new variable.
/*if !variable_instance_exists(_obj, _var)
{
    print("TRIED SETTING INVALID OBJECT VARIABLE!")
    return false;
}*/

variable_instance_set(_obj, _var, _val);
