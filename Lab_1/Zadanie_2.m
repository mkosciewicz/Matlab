%Zadanie 2_1


for i = 1:6
    for j = 1:6
        if i ~= j
            A(i,j) = 1/(i-j);
        else i = j;
            A(i,j) = 0;
        end
    end
end
A;

%Zadanie 2_2

b1 = rand([10,10]);
for i = 1:10
    for j = 1:10
        if b1(i,j) > 0.2 && b1(i,j) < 0.5
            disp(b1(i,j));
        end
    end
end



%Zadanie 2_4


%Zadanie 2_5



%Zadanie 2_6



%Zadanie 2_7