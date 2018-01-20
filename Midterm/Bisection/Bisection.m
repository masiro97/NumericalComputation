%The Bisection method

clc
clear all

fprintf('The Bisection method\n\n');

Xl = input('lower bound = ?');
Xu = input('Upper bound = ?');
tol = input('tolerance = ?');

if(fun(Xl) * fun(Xu) >0)
    fprintf('There is no answer\n\n');
else
while(1)
    Xr = (Xl + Xu)/2;

    if(abs(Xl - Xr) < tol)
        fprintf('Tolerance is satisfied\n');
        fprintf('Xr = %.7f\n',Xr);
        break;
    else
        if(fun(Xl) * fun(Xr) <0)
            Xu = Xr;
        else
            Xl = Xr;
        end
    end
end

end