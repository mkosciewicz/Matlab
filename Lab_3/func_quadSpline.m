function yq = func_quadSpline(x, y, xq)    
    X = [x(:).^2 x(:) ones(size(x(:)))];
    coff = X\y(:);
    yq = [xq(:).^2 xq(:) ones(size(xq(:)))]*coff;
end