tic();
for i = -10:0.001:10
    y = cos(i);
end
a = toc();
range = -10:0.001:10;

tic();
cos(range);

b = toc();

display(a);
display(b);