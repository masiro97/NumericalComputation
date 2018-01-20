function F = dipper(th1 , th2 , th3 )

F = [2*cos(th1)*cos(th2)+cos(th3 + th2)*cos(th1) ;
     2*sin(th1)*cos(th2)+cos(th3 + th2)*sin(th1) ;
     2*sin(th2)+sin(th3 + th2)];
 
end