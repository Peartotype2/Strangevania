///print(variables or strings) ex: print("Health:", player.hp) = "Health:15";

var output_string = "";

for (var i = 0; i < argument_count; i++) {
    output_string += string(argument[i]);// + " ";
}
console_log(output_string);
show_debug_message(output_string);
