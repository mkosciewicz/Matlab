t =[4 5];
file = fopen("dane.bin","r");
fread(file, t, 'float')
fclose(file);