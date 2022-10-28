function [x_0] = BisectMtd(x_array, values_array)
 
if values_array(1) == 0
    x_0 = x_array(1);
    return
elseif values_array(end) == 0
    x_0 = x_array(1);
    return
end

a = length(x_array);
mid = ceil(a/2);

check_left = values_array(1)*values_array(mid);
check_right = values_array(end)*values_array(mid);

if check_left > 0 && check_right >0 
    x_0 = nan;
    return
end
 
if a < 3
   x_0 = x_array(a);
   return
end 

if values_array(mid) == 0 || values_array(mid-1) == 0 || values_array(mid+1) == 0 
    x_0 = x_array(mid);
    return
else

    if check_left < 0
        x_array = x_array(1:mid);
        values_array = values_array(1:mid);
        
    elseif check_right <0 
        x_array = x_array(mid:a);
        values_array = values_array(mid:a);
    end

    x_0 = BisectMtd(x_array,values_array);

end

end
