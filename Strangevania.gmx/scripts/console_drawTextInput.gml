///console_drawTextInput()
with console
{
    draw_set_colour(c_lime);
    draw_set_font(font_console);
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);
    
    lineH = string_height(">");
    var _textscale = 0.5;
    var _textY = panely+2;
    
    if suggestions != -1
    {
        //draw_set_colour(c_green);
        var _len = array_length_1d(suggestions);
        var _suggestiontext = " ";
        var _color = c_lime;
        var _alpha = 0.5;
        var _autotext = ""
        
        var _suggestionsAmount = 5
        for (s = 0; s < min(_len, _suggestionsAmount); s++)
        {
            if _autotext == ""
            {
                var tempInput = string_replace_all(userInput, "/", "");
                if string_copy(suggestions[s], 1, string_length(tempInput)) == tempInput
                {
                    _autotext = suggestions[s];
                    if string_char_at(userInput, 1) == "/" { _autotext = "/"+_autotext; }
                }
            }
            _suggestiontext += (" /"+suggestions[s]);
        }
        
        draw_text_transformed_colour(panelx, _textY - lineH, _suggestiontext,
            _textscale, _textscale, 0, _color, _color, _color, _color, _alpha);
        
            
        if _autotext != ""
        {
            //draw autocomplete text behind line text
            draw_text_transformed_colour(panelx, _textY, "> " + _autotext,
            _textscale, _textscale, 0, c_lime,c_lime,c_lime,c_lime, 0.3);
            
            if keyboard_check_released(vk_tab)
            {
                var _autoComplete = _autotext
                if string_char_at(_autoComplete, 1) != "/"
                {_autoComplete = "/"+_autoComplete;}
                userInput = _autoComplete
                keyboard_string = _autoComplete;
            }
        }
    }
    draw_set_colour(c_lime);
    
    var indstr = indicator_char;
    if !indicator then indstr = "";
    var _linetext = userInput; //string_insert("> ", keyboard_string, 1);
    draw_text_transformed(panelx, _textY, "> " + _linetext + indstr,
        _textscale, _textscale, 0);
    
    var _cmdtext = commandString;
    draw_text_transformed(panelx, _textY + lineH, _cmdtext,
        _textscale, _textscale, 0);
        
    var _resulttext = commandResult;
    draw_text_transformed(panelx, _textY + lineH*2, _resulttext,
        _textscale, _textscale, 0);
    
    draw_set_colour(c_white);
    draw_set_font(font_menu);
}
