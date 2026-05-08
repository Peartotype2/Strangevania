///is_float(number)
// Returns true or false if the number is whole(1.0) or fractional(1.5)

// WARNING: All number values in GML are floats
//           thus this script only checks if a
//           number's fraction is higher than 0.
//           It cannot detect the difference between 1.0 and 1

return abs(frac(argument0)) > 0.00001
// The 0.00001 check filters out any floating point errors
// ex: a whole number technically being 1.0000000000000002
