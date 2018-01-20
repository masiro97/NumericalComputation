clc
clear


fprintf('Modified False position method\n');
Xl = input('lower bound = ');
Xu = input('upper bound = ');
tol_x = input('x tolerance = ');
tol_y = input('y tolerance = ');

Yl = fun(Xl);
Yu = fun(Xu);

if(Yl * Yu > 0)
    fprintf(1,'no root exists\n');
else
    
    
    while(1)
        
    Xr = (Xl * Yu - Xu * Yl) / (Yu - Yl);
    Yr = fun(Xr);
    
    if(Yr * Yu > 0)
       if(abs(Xr - Xu) < tol_x || abs(Yr) < tol_y) 
           root = Xr
           break;
       else
           Xu = Xr;
           Yl = fun(Xl)/2;
           Yu = fun(Xu);
           Xr = (Xl * Yu - Xu *Yl) / (Yu - Yl); 
           
       end
    end
    
    
     if(Yr * Yl > 0)
         if(abs(Xr - Xl) < tol_x || abs(Yr) < tol_y)
             root = Xr
             break;
         else
             Xl = Xr;
             Yl = fun(Xl);
             Yu = fun(Xu) / 2;
             Xr = (Xl * Yu - Xu * Yl) / (Yu - Yl);
         end
     end
    
        
    end
    
    
end
