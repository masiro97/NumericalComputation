clc
clear all

fprintf('the Scant method\n\n');

Xi = input('input first initial = ');
Xj = input('input second initial = ');
tol_x = input('x tolerance = ? ');
tol_y = input('y tolerance = ? ');



while(1)
    
    Yi = fun(Xi);
    Yj = fun(Xj);
    Xu = Xj - Yj * (Xj - Xi) / (Yj - Yi);
    Yu = fun(Xu);

    if(abs(Xu - Xj) < tol_x || abs(Yu) < tol_y)
        root = Xu
        break;
    else

        temp = Xj;
        Xj = Xu;
        Xi = temp;
    end
end
