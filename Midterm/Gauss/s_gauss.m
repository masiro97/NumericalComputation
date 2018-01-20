function [x] = s_gauss(n,a)
%S �� �Լ��� ��� ���� ��ġ
%   �ڼ��� ���� ��ġ
   for i = 1:n-1
       i_max = i;
       for j = i+1:n
           if abs(a(i_max,i)) <abs(a(j,i))
               i_max = j;
           end
       end
       
       if i_max~= i
           for k = 1:n+1
               mat_temp = a(i,k);
               a(i,k) = a(i_max,k);
               a(i_max,k) = mat_temp;
           end
       end
       
       
       if a(i,i) ==0
           fprintf('matrix is singular\n\n');
           break;
       end
       
       %���� �� ����� ������Ű�� ���
       for v = i+1:n
            rate = a(v,i) / a(i,i);
            for u = 1:n+1
               a(v,u) = a(v,u) - rate*a(i,u);
            end
       end
       
   end
   
   x = zeros(n,1);
   x(n,1) = a(n,n+1) / a(n,n);
   
   for back = n-1:-1:1
       temp = a(n,n+1) / a(n,n);
       for t = back+1:n    
            temp = temp - a(back,t) * a(k,n+1);
       end
       x(back,1) = temp;
   end
 
   
   
   
   
   
   %x(n,1) = a(n,n+1) / a(n,n);
   %x(n-1,1) = (a(n-1,n+1) - a(n-1,n) * x(n,1)) / a(n-1,n-1)
   %x(n-2,1) = (a(n-2,n+1) -a(n-2,n) *x(n,1) - a(n-2,n-1) * x(n-1,1)) / a(n-2,n-2);
end

  
  

%�� �տ��� ����� ���� ĭ ���� ã�Ƽ� i_max��� ������ �� �ప�� ������� 00
%�� �տ��� ����� ���� ū ���� �� ���� �ø�
%���� �� ��, �� �տ��� ����� 0�̸� �ַ̱� ��Ȳ
%���� �� ����� ������Ű�� ���
%���� ������ �Ѿ�� �ݺ�
%���࿡ �� ����, �ǳ����� ���� 0�� ������ �ַ̱� ��Ȳ, �� ����
%�� ���� �� ���� ���
%������ �� ���




