clc
clear all

fprintf('The False Position method(Modified)\n');

Xl = input('lower bound = ? ');
Xu = input('Upper bound = ? ');
tol_x = input('x tolerance = ? ');
tol_y = input('y tolerance = ? ');


 if(fun(Xl) * fun(Xu) >0)
        fprintf('There is no answer\n');
 
 
 else
while(1)
    
    Yl = fun(Xl);
    Yu = fun(Xu);
    Xr = (Xl * Yu - Xu * Yl) / (Yu - Yl);
    Yr = fun(Xr);    
    

    if(Yr* Yu > 0)
            
        if(abs(Xr- Xu) <tol_x || abs(Yr) <tol_y)
            fprintf('root = %.7f\n',Xr);
            break;
        elseif(abs(Yr) <tol_y)
            fprintf('root = %.7f\n',Xr);
            break;    
        else
            Xu = Xr;
            Yl = fun(Xl) / 2;
            Yu = fun(Xu);
            Xr = (Xl * Yu - Xu * Yl) / (Yu - Yl);
                
        end
        
    else
         
       
        if(abs(Xr - Xl) <tol_x)
            fprintf('root = %.7f\n',Xr);
            break;
            
        elseif(abs(Yr) <tol_y)
            fprintf('root = %.7f\n',Xr);
            break;
        else
            Xl = Xr;
            Yl = fun(Xl);
            Yu = fun(Xu)/2;
            Xr = (Xl * Yu - Xu * Yl) / (Yu - Yl);
        end
    
     end
end
 end
