///game_add_points(amount);

var amount = argument[0];
if amount == 0 then exit;

gamemanager.points += amount;
event_fire("PointsAdded", amount);
