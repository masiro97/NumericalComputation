clc
clear all

n = 3; % 미지수 계수

a = [4,3,0;
    3,4,-1;
    0,-1,4];
b = [10,8,10]';

x = zeros(3,1); %x 초기값 세팅
tol = 0.01; %허용 에러값

fprintf('Gauss Seidel method\n');

iter = 0; %반복 횟수, 초기값은 0

while(1)
    iter = iter +1;
    fprintf('%2d',iter-1);
    for i = 1:n
        fprintf('%10.4f',x(i,1));
    end
    
    fprintf('\n');
    
    x_prev = x; %for 문으로 x업데이트 되기전에 x값을 미리 저장해둠
    
    for i = 1:n
        temp = 0;
        for j =1:n %열
            if i~=j %대각 행렬이 아닌 것 골라내기
                temp = temp + a(i,j)*x(j,1);
                %1행에서는 a12*x2 + a13*x3
                %2행에서는 a21*x1 + a23*x3 ,이때 x1은 아래서 업데이트 받은 값 사용
                %3행에서는 a31*x1 + a32*x2 ,이때 x1,x2는 아래서 업데이트 받은 값 사용
                %그리고 temp를 이용해서 계속 누적하기
            end
        end
        
        x(i,1) = (-temp + b(i,1)) / (a(i,i));
        %1행에서는 (-a12*x2 - a13*x3 + b1) / a11를 계산해서 x1업데이트, 2행, 3행 계산 때 사용
        %2행에서는 (-a21*x1 - a23*x2 + b2) / a22를 계산해서 x2업데이트, 3행 계산 때 사용
        %3행에서는 (-a31*x1 - a32*x2 + b3) / a33를 계산해서 x3업데이트, for문 나감
    end
    if abs(x-x_prev) < tol
        break;
    end
end

%마지막으로 답 출력
for i = 1:n
    fprintf('%10.4f',x(i,1));
end
fprintf('\n');
            
    
