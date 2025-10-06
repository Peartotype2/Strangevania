///milestoneList(goal, stepSize, [startValue])

var goal        = argument[0];
var step        = argument[1]
var minValue    = 0; if argument_count > 2 {minValue = argument[2];}


var total_count = (goal - 1) div step;
var start_index = floor(minValue / step) + 1;

var arr_size    = total_count - start_index + 1;
if (arr_size < 0) {arr_size = 0;}

var milestones  = array_create(arr_size);

for (var i = 0; i < arr_size; i++) {
    milestones[i] = step * (start_index + i);
}

print(milestones);
return milestones;
