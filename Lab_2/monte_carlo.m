points_nr= input("Proszę wprowadzić liczbe określającą kształt: ");
points_casual = input("Proszę wprowadzić liczbe punktów oscylujących przy kształcie: ");

for i = 1:points_nr
    multi_points(i, 1) = input("Proszę podaj x: ");
    multi_points(i, 2) = input("Proszę podaj y: ");
end
display(func_monte_carlo(multi_points, points_nr, points_casual));