function [out_arg] = eq_solver(brightness)
syms a b
for i = 1:(size(brightness, 2) - 1)
    eqn1 = i * a + b == brightness(i);
    eqn2 = (i + 1) * a + b == brightness(i + 1);

    sol = solve([eqn1, eqn2], [a, b]);
    aSol = sol.a;
    bSol = sol.b;
    grad(i) = aSol * i + bSol;

end

out_arg = grad;
end

