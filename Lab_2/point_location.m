function [arg] = point_location(single_point, multi_points, points_nr)
result = 0;
edge = [0, 0];
for i = 1:points_nr
    point_compare = i + 1;
    if i == points_nr
        point_compare = 1;
    end
    if lines_cross(single_point, edge, multi_points(i, :), multi_points(point_compare, :)) == 1
        result = result + 1;
    end
end
if mod(result, 2) == 0
    arg = 0;
else
    arg = 1;
end
end

