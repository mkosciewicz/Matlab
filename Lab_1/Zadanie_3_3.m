C = 0;
Tc = 0:20:300;
Tf = 9 * Tc / 5 + 32;
file = fopen("temperatura.txt", "w+");
fprintf(file, '%4d ', Tc);
fprintf(file, '\n');
fprintf(file, '%4d ', Tf);
fclose(file);
