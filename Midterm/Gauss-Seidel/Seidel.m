clc
clear all

n = 3; % ������ ���

a = [4,3,0;
    3,4,-1;
    0,-1,4];
b = [10,8,10]';

x = zeros(3,1); %x �ʱⰪ ����
tol = 0.01; %��� ������

fprintf('Gauss Seidel method\n');

iter = 0; %�ݺ� Ƚ��, �ʱⰪ�� 0

while(1)
    iter = iter +1;
    fprintf('%2d',iter-1);
    for i = 1:n
        fprintf('%10.4f',x(i,1));
    end
    
    fprintf('\n');
    
    x_prev = x; %for ������ x������Ʈ �Ǳ����� x���� �̸� �����ص�
    
    for i = 1:n
        temp = 0;
        for j =1:n %��
            if i~=j %�밢 ����� �ƴ� �� ��󳻱�
                temp = temp + a(i,j)*x(j,1);
                %1�࿡���� a12*x2 + a13*x3
                %2�࿡���� a21*x1 + a23*x3 ,�̶� x1�� �Ʒ��� ������Ʈ ���� �� ���
                %3�࿡���� a31*x1 + a32*x2 ,�̶� x1,x2�� �Ʒ��� ������Ʈ ���� �� ���
                %�׸��� temp�� �̿��ؼ� ��� �����ϱ�
            end
        end
        
        x(i,1) = (-temp + b(i,1)) / (a(i,i));
        %1�࿡���� (-a12*x2 - a13*x3 + b1) / a11�� ����ؼ� x1������Ʈ, 2��, 3�� ��� �� ���
        %2�࿡���� (-a21*x1 - a23*x2 + b2) / a22�� ����ؼ� x2������Ʈ, 3�� ��� �� ���
        %3�࿡���� (-a31*x1 - a32*x2 + b3) / a33�� ����ؼ� x3������Ʈ, for�� ����
    end
    if abs(x-x_prev) < tol
        break;
    end
end

%���������� �� ���
for i = 1:n
    fprintf('%10.4f',x(i,1));
end
fprintf('\n');
            
    
