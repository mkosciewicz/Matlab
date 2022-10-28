vect = rand(1,50);
file = fopen('dane.bin','w');
fwrite(file, vect, 'float');
fclose(file);