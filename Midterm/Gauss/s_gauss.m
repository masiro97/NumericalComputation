function [x] = s_gauss(n,a)
%S 이 함수의 요약 설명 위치
%   자세한 설명 위치
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
       
       %다음 열 계수들 변형시키는 계산
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

  
  

%맨 앞열의 계수가 가장 칸 행을 찾아서 i_max라는 변수에 그 행값을 적어넣음 00
%맨 앞열의 계수가 가장 큰 행을 맨 위로 올림
%만약 맨 위, 맨 앞열의 계수가 0이면 싱귤러 상황
%다음 열 계수들 변형시키는 계산
%다음 행으로 넘어가서 반복
%만약에 맨 끝행, 맨끝열의 값이 0이 나오면 싱귤러 상황, 답 없음
%맨 끝의 답 먼저 계산
%나머지 답 계산




