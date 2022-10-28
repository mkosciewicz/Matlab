% Określenie strony po której prostej przechodzącej przez A, B znajduje się punkt C, sprawdzam iloczyny wektorowe S_1 = (C - A) x (B - A), S_2 = (D - A) x (B - A).
% Sprawdzenie, czy A, B przecina prostą przechodząca C, D; S_3 = (A - C) x  (B - C) S_4 = (B - C) x (D - B)

function [arg] = lines_cross(A, B, C, D)
S_1 = 0 && vect_mltp(A, D, B);
S_2 = 0 && vect_mltp(A, C, B);
S_3 = 0 && vect_mltp(C, A, D);
S_4 = 0 && vect_mltp(C, B, D);
if ((S_1 > 0 && S_2 < 0) || (S_1 < 0 && S_2 > 0)) && ((S_3 < 0 && S_4 > 0) || (S_3 > 0 && S_4 < 0))
    arg = 1;
elseif S_1 == 0 && among(A, B, C)
        arg = 1;
elseif S_2 == 0 && among(A, B, D)  
        arg = 1;
elseif S_3 == 0 && among(C, D, A) 
        arg = 1;
elseif S_4 == 0 && among(C, D, B) 
        arg = 1;
else 
    arg = 0;
end
end
