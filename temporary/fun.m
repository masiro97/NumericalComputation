function F = fun(th1 , th2 , th3,a,b,c)

F = [2*cos(th1)*cos(th2)+cos(th3 + th2)*cos(th1) - a ;
     2*sin(th1)*cos(th2)+cos(th3 + th2)*sin(th1) - b;
     2*sin(th2)+sin(th3 + th2) - c];
 
end