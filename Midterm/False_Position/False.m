clc
clear all

fprintf('The False Postion method\n');

Xl = input('lower bound = ? ');
Xu = input('Upper bound = ? ');
tol_x = input('tolerance x = ? ');
tol_y = input('tolerance y = ? ');



while(1)
    if(fun(Xl) * fun(Xu) > 0)
        fprintf('There is no answer');
    else
    Xr = (Xl * fun(Xu) - Xu * fun(Xl)) / (fun(Xu) - fun(Xl));
    
    if(fun(Xr) * fun(Xu) >0)
        tol = abs(fun(Xr) - fun(Xu));
        if(tol < tol_y)
            fprintf('tolerance is satisfied\n');
            fprintf('Xr = %.7f\n',Xr);
            break;
        elseif(abs(Xr - Xu) < tol_x)
            fprintf('tolerance is satisfied\n');
            fprintf('Xr = %.7f\n',Xr);
            break;
        else
            Xu = Xr;
        end
    else
        tol = abs(fun(Xr) - fun(Xl));
        if(tol < tol_y)
            fprintf('tolerance is satisfied\n');
            fprintf('Xr = %.7f\n',Xr);
            break;
        elseif(abs(Xr - Xl) < tol_x)
            fprintf('tolerance is satisfied\n');
            fprintf('Xr = %.7f\n',Xr);
            break;
        else
            Xl = Xr;
        end
        
    end
    end
end
