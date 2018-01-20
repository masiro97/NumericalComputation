clc
clear



fprintf('Newton-Raphson method\n');
Init = input('Initial point = ');
tol_x = input('tolerance x = ');
tol_y = input('tolerance y = ');
iter = input('Iteration = ');

x = Init;
y = pfun(x);

for n = 1:1:iter
    Xu = x - fun(x) / pfun(x);
    Yu = fun(Xu);
    
    if(abs(Xu - x) < tol_x || abs(Yu) < tol_y)
    root = Xu
    break;
    
    else
    x = Xu;
    y = Yu;
    continue;
   
    end
end

