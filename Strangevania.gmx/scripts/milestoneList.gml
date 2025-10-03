///milestoneList(total, stepSize)

var total = argument[0];
var step = argument[1]

//var arr_size = total div step - 1; // exclude max itself
var arr_size = (total - 1) div step;
var milestones = array_create(arr_size);

for (var i = 0; i < arr_size; i++) {
    milestones[i] = step * (i + 1);
}

print(milestones);
return milestones;
