clc
clear all

fprintf('the Newton-Raphson method\n\n');

Xi = input('Initial point = ? ');
tol_x = input('tolerance x = ');
tol_y = input('tolearnce y = ');

while(1)
    
    Xu = Xi - fun(Xi) / pfun(Xi);
    Yu = fun(Xu);
    
    if(abs(Xu-Xi) < tol_x || abs(Yu) < tol_y)
        root = Xu
        break;
    else
        Xi = Xu;
    end
end
