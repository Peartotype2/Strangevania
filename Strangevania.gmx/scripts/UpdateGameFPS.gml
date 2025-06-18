///UpdateGameFPS()
with director
{
    // Store latest fps_real
    ds_list_add(fps_history, fps_real);
    
    // Trim history if it's too long
    if (ds_list_size(fps_history) > fps_max_history) {
        ds_list_delete(fps_history, 0); // remove oldest
    }
    
    fps_timer += 1;
    
    // Update display every few steps
    if (fps_timer >= fps_update_interval) {
        // Calculate average
        var total = 0;
        for (var i = 0; i < ds_list_size(fps_history); i++) {
            total += fps_history[| i];
        }
        fps_average = round(total / ds_list_size(fps_history));
    
        // Sort for 10% low
        ds_list_sort(fps_history, true);
        var count_10pct = max(1, floor(ds_list_size(fps_history) * 0.10));
        var low_total = 0;
        for (var j = 0; j < count_10pct; j++) {
            low_total += fps_history[| j];
        }
        fps_10pct_low = round(low_total / count_10pct);
    
        fps_timer = 0;
    }
}
