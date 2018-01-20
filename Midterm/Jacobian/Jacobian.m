clc
clear all

x = 1.5;
y = 3.5;
tol = 0.001;
X = [x;y];

while(1)
    
    x = X(1,1);
    y = X(2,1);
    X_prev = X;
    
    F = [x^2 + x*y-10;
        y+3*x*y^2-57];
    
    J = [2*x+y x;
        3*y^2 1+6*x*y];
    fprintf('%5.5f      %5.5f\n',x,y);
    X = X_prev - inv(J)*F;
    if(abs(X-X_prev) < tol)
        break;
    end
end