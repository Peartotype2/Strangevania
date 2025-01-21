///console_runCommand(userInput);
with console
{
    var _input = string_split(argument[0], " ");//argument[0];
    
    var _cmd = _input[0];
    var len = array_length_1d(_input);
    var _args = array_create(len-1);
    array_copy(_args, 0, _input, 1, len-1)

    if (string_length(_cmd) > 0)
    {
      if (string_char_at(_cmd, 1) == commandPrefix)
      {
        _cmd = string_delete(_cmd, 1, 1);
        var scriptIndex = asset_get_index(_cmd + "_Execute");
        if (script_exists(scriptIndex))
          commandResult = string(script_execute(scriptIndex, _args));
        else
          commandResult = "Unknown command.";
      }
      else
      {
        var scriptIndex = asset_get_index("run_Execute");
          commandResult = string(script_execute(scriptIndex, _input));
      }
    }
}
