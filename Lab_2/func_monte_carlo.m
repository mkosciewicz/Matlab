function [area] = func_monte_carlo(points, ~, points_rand)
x = points(:,1)';
y = points(:,2)';
%points(points_nr + 1, 1) = points(1, 1);
%points(points_nr + 1, 2) = points(1, 2);
%shape = animatedline(x, y, 'Color', 'g', 'LineWidth', 3);
outside = animatedline("Color", "b", "Marker",".","MarkerSize", 4, "LineStyle", "-");
inside = animatedline("Color", "r", "Marker", ".", "MarkerSize", 4, "LineStyle", "--");
%odświeżanie kształtu i wywołaj zwrotnie (typu: return)
drawnow;
min_x = min(x);
max_y = max(y);
max_x = max(x);
min_y = min(y);
%aa = [min_x, min_x, max_x, max_x, min_x];
%bb = [min_y, max_y, max_y, min_y, min_y];
%sqr = animatedline(aa, bb, "Color", "k", "LineWidth", 2);
hit_in = 0;
hit_out = 0;
for i = 1:points_rand
    addpoints(outside, i, (hit_in/(hit_in+hit_out)) * (max_y - min_y) * (max_x - min_x));
    drawnow;
    random_x = (max_x-min_x).*rand()+min_x;
    random_y = (max_y-min_y).*rand()+min_y;
    [In_area, On_range] = inpolygon(random_x,random_y, x, y);
    X_in = numel(random_x(In_area));
    Y_in = numel(random_y(In_area));
    X_on = numel(random_x(On_range));
    Y_on = numel(random_x(On_range));
    
    if  (X_in == 1 && Y_in == 1) || (X_on == 1 && Y_on == 1)
        %point_location([random_x, random_y], points, points_nr) == 1;
        hit_in = hit_in + 1;
        %addpoints(hit_in, random_x, random_y);
        drawnow;
    else
        hit_out = hit_out + 1;
        %addpoints(hit_out, random_x, random_y);
        drawnow;
    end
end
area = (hit_in/(hit_in+hit_out)) * (max_y - min_y) * (max_x - min_x);
addpoints(inside,[0, points_rand], [area, area]);
drawnow;

end

