///game_add_points(amount);

var amount = argument[0];

gamemanager.points += amount;
event_fire("PointsAdded", amount);
