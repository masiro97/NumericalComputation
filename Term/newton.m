function  X  = newton( x,y,z, th1, th2, th3)
%NEWTON 이 함수의 요약 설명 위치
%   자세한 설명 위치

tol = 0.01;

X = [th1;th2;th3];

while(1)
    
    th1 = X(1,1);
    th2 = X(2,1);
    th3 = X(3,1);
   
    X_prev = X;
    
  F = [2*cos(th1)*cos(th2)-cos(th1)*sin(th2)*sin(th3)+cos(th1)*cos(th2)*cos(th3)-x;
      2*cos(th2)*sin(th1)-sin(th1)*sin(th2)*sin(th3)+cos(th2)*cos(th3)*sin(th1)-y;
      2*sin(th2)+cos(th2)*sin(th3)+cos(th3)*sin(th2)-z];
  J = [-2*sin(th1)*cos(th2)+sin(th1)*sin(th2)*sin(th3)-sin(th1)*cos(th2)*cos(th3),-2*cos(th1)*sin(th2)-cos(th1)*cos(th2)*sin(th3)-cos(th1)*sin(th2)*cos(th3),-cos(th1)*sin(th2)*cos(th3)-cos(th1)*cos(th2)*sin(th3);
      2*cos(th2)*cos(th1)-cos(th1)*sin(th2)*sin(th3)+cos(th2)*cos(th3)*cos(th1),-2*sin(th2)*sin(th1)-sin(th1)*cos(th2)*sin(th3)-sin(th2)*cos(th3)*sin(th1),sin(th1)*sin(th2)*cos(th3)-cos(th2)*sin(th3)*sin(th1);
      0,2*cos(th2)-sin(th2)*sin(th3)+cos(th3)*cos(th2),cos(th2)*cos(th3)-sin(th3)*sin(th2)];
 
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

