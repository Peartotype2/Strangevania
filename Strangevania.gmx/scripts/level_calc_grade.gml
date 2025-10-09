///level_calc_grade(rating)

var rating = argument[0];

     if (rating >= 0.90) return RANK_S;
else if (rating >= 0.75) return RANK_A;
else if (rating >= 0.60) return RANK_B;
else if (rating >= 0.40) return RANK_C;
                    else return RANK_D;

