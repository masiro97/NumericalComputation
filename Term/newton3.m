function  X  = newton3(th1, th2, th3,x,y,z)
%NEWTON 이 함수의 요약 설명 위치
%   자세한 설명 위치

tol = 0.01;

X = [th1;th2;th3];

while(1)
    
    th1 = X(1,1);
    th2 = X(2,1);
    th3 = X(3,1);
   
    X_prev = X;
    
  F = [2000*cos(th1)*cos(th2) - 1000*cos(th1)*sin(th2)*sin(th3) + 1000*cos(th1)*cos(th2)*cos(th3)-x;
      2000*cos(th2)*sin(th1) - 1000*sin(th1)*sin(th2)*sin(th3) + 1000*cos(th2)*cos(th3)*sin(th1)-y;
      2000*sin(th2) + 1000*cos(th2)*sin(th3) + 1000*cos(th3)*sin(th2)-z];
  
  
  J = [1000*sin(th1)*sin(th2)*sin(th3) - 2000*cos(th2)*sin(th1) - 1000*cos(th2)*cos(th3)*sin(th1),- 2000*cos(th1)*sin(th2) - 1000*cos(th1)*cos(th2)*sin(th3) - 1000*cos(th1)*cos(th3)*sin(th2),- 1000*cos(th1)*cos(th2)*sin(th3) - 1000*cos(th1)*cos(th3)*sin(th2);
      2000*cos(th1)*cos(th2) - 1000*cos(th1)*sin(th2)*sin(th3) + 1000*cos(th1)*cos(th2)*cos(th3),- 2000*sin(th1)*sin(th2) - 1000*cos(th2)*sin(th1)*sin(th3) - 1000*cos(th3)*sin(th1)*sin(th2),- 1000*cos(th2)*sin(th1)*sin(th3) - 1000*cos(th3)*sin(th1)*sin(th2);
      0,2000*cos(th2) + 1000*cos(th2)*cos(th3) - 1000*sin(th2)*sin(th3),1000*cos(th2)*cos(th3) - 1000*sin(th2)*sin(th3)];
 
    X = X_prev - inv(J)*F;
   
    
    if(X(1,1) > 2*pi)
        X(1,1) = mod(X(1,1) , 2*pi);
    end
    if(X(2,1) > pi)
        X(2,1) = mod(X(2,1) ,pi);
    end
    if(X(3,1) > 2*pi)
        X(3,1) = mod(X(3,1) , 2*pi);
    end
    if(X(2,1) < 0)
        X(2,1) = X(2,1) + pi;
    end

    if(abs(X-X_prev) <tol)
        break
    end
  
end


end



