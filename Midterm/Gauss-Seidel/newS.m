clc
clear all
fprintf('Gauss Seidel Method\n\n');

n = 3; %미지수 개수
a = [4,3,0;
    3,4,-1;
    0,-1,4];
b = [10,8,10]';

x = zeros(3,1);
tol = 0.01;

while(1)
 
    x_prev = x;
    for i = 1:n
        temp  = 0;
        for j = 1:n
            if i~=j
            temp = temp + a(i,j) * x(j,1);
            end
        end
        
        x(i,1) = (-temp + b(i,1)) / a(i,i);
    end
    
    if abs(x_prev - x) < tol
        break;
    end
    
end

for i = 1:n
    fprintf('%10.4f\n',x(i,1));
end