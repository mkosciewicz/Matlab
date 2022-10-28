file = fopen("temperatura.txt", "r");
read = fscanf(file, '%d');
fclose(file);
read = reshape(read , 1, size(read, 1));
disp(read);