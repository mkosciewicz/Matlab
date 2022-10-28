function [arg] = among(A, B, C)
if min(A(1, 1), B(1, 1)) <= C(1, 1) && C(1, 1) <= max(A(1, 1), B(1, 1))
    arg = 1;
else
    arg = 0;
end
end

