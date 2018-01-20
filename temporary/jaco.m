function J = jaco(th1, th2, th3)

J = [-2*sin(th1)*cos(th2) - cos(th3 + th2)*sin(th1), -2*cos(th1)*sin(th2) - sin(th3 + th2)*cos(th1), -sin(th3 + th2)*cos(th1);
      2*cos(th1)*cos(th2) + cos(th3 + th2)*cos(th1), -2*sin(th1)*sin(th2) - sin(th3 + th2)*sin(th1), -sin(th3 + th2)*sin(th1);
      0 , 2*cos(th2) + cos(th3 + th2) , cos(th3 + th2)];

end