clc
clear all

fprintf('Simple Fixed-Point Iteration\n\n');

Xi = input('input initial point ');
tol = input('tolerance = ?');


while(1)
    if(abs(pfun(Xi)) < 1)

        Xu = fun(Xi);
    
        if(abs(Xu-Xi) < tol)
            root = Xu
            break;
        else
            Xi = Xu;
        end
    else
        fprintf('input new initial\n\n');
        Xi = input('input initial point ');
        
    end
end