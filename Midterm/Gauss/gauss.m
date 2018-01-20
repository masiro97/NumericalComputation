function [ a ] = gauss( n,a )
%GAUSS �� �Լ��� ��� ���� ��ġ
%   �ڼ��� ���� ��ġ

for i = 1:n-1
    %�� �տ��� ����� ���� ĭ ���� ã�Ƽ� i_max��� ������ �� �ప�� �������
    i_max = i;
    for j = i+1:n
        if(abs(a(i_max,i)) < abs(a(j,i)))
            i_max = j;
        end
    end
    
    %�� �տ��� ����� ���� ū ���� �� ���� �ø�
    if i_max ~=i
        for j_temp = i:n+1
            mat_temp = a(i,j_temp);
            a(i,j_temp) = a(i_max,j_temp);
            a(i_max,j_temp) = mat_temp;
        end
    end
    
    for i_t = i+1:n
        
        %���� �� ��, �� �տ��� ����� 0�̸� �ַ̱� ��Ȳ
        
        if a(i,i) ==0
            fprintf('matrix is singular\n');
            break;
        end
        
        %���� �� ����� ������Ű�� ���
        
        r = a(i_t,i) / a(i,i);
        
        for j_t = i+1:n+1
            a(i_t,j_t) = a(i_t,j_t)-r*a(i,j_t);
        end
    end
    
    %���� ������ �Ѿ�� �ݺ�
end











%���࿡ �� ����, �ǳ����� ���� 0�� ������ �ַ̱� ��Ȳ, �� ����

if a(n,n) ==0
    fprintf('matrix is singular\n');
end

%�� ���� �� ���� ���
a(n,n+1) = a(n,n+1) / a(n,n);

%������ �� ���

for n_back = n-1:-1:1
    va = a(n_back,n+1);
    
    for k = n_back+1:n
        va = va - a(n_back,k) * a(k,n+1);
    end
    
    a(n_back,n+1) = va / a(n_back,n_back);
end
        

end

