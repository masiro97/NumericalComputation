%main
%clear, clc, close all
tic
figure
axis([-3 3 -3 3 -3 3])
grid on
pos = 0;
temp = [45*pi/180 45*pi/180 -45*pi/180];

 Ax1 = [0 0];
 Ay1 = [0 0];
 Az1 = [0 0];
 Ax2 = [0 0];
 Ay2 = [0 0];
 Az2 = [0 0];
 Bx1 = [0 0];
 By1 = [0 0];
 Bz1 = [0 0];
 Bx2 = [0 0];
 By2 = [0 0];
 Bz2 = [0 0];
 Bx3 = [0 0];
 By3 = [0 0];
 Bz3 = [0 0];
 Bx4 = [0 0];
 By4 = [0 0];
 Bz4 = [0 0];
 
 p1 = line(Ax1,Ay1,Az1,'Linewidth',5,'Color','r');
 p2 = line(Ax2,Ay2,Az2,'Linewidth',5,'Color','bl');
 p3 = line(Bx1,By1,Bz1,'Linewidth',1,'Color','k');
 p4 = line(Bx2,By2,Bz2,'Linewidth',1,'Color','k');
 p5 = line(Bx3,By3,Bz3,'Linewidth',1,'Color','k');
 p6 = line(Bx4,By4,Bz4,'Linewidth',1,'Color','k');
 

for i = 1:200

    %set theta
    if pos ==0
        theta = newton(1.5,1.2,-0.5 , temp(1),temp(2),temp(3));
        temp = theta;
        pos = 1;
    else
        theta = newton(-1.3,1.2,0.5 ,temp(1),temp(2), temp(3));
        temp = theta;
        pos = 0;
    end


    boom_x = 2*cos(theta(1))*cos(theta(2));
    boom_y = 2*cos(theta(2))*sin(theta(1));
    boom_z = 2*sin(theta(2));

    %boom 끝의 위치
    boom_pos = [boom_x, boom_y, boom_z];

    dipper_x = cos(theta(1))*(cos(theta(2))*(2+cos(theta(3))) -sin(theta(2))*sin(theta(3)));
    dipper_y = sin(theta(1))*( cos(theta(2))*(2 + cos(theta(3))) - sin(theta(2))*sin(theta(3)));
    dipper_z = sin(theta(2))*(2 + cos(theta(3))) + cos(theta(2))*sin(theta(3));

    %dipper 끝의 위치
    dipper_pos = [dipper_x,dipper_y,dipper_z];

    %structure 모양 만들기
    struc_length = 0.5;
    struc_edge_1 = [ struc_length*sin(theta(1)+pi/4), struc_length*cos(theta(1)+pi/4)];
    struc_edge_2 = [ struc_length*sin(theta(1)+pi/2+pi/4), struc_length*cos(theta(1)+pi/2+pi/4)];
    struc_edge_3 = [ struc_length*sin(theta(1)+pi+pi/4), struc_length*cos(theta(1)+pi+pi/4)];
    struc_edge_4 = [ struc_length*sin(theta(1)+3*pi/2+pi/4), struc_length*cos(theta(1)+3*pi/2+pi/4)];


    Ax1 = [0 boom_pos(1)];
    Ay1 = [0 boom_pos(2)];
    Az1 = [0 boom_pos(3)];
    Ax2 = [boom_pos(1) dipper_pos(1)];
    Ay2 = [boom_pos(2) dipper_pos(2)];
    Az2 = [boom_pos(3) dipper_pos(3)];
    Bx1 = [struc_edge_1(1) struc_edge_2(1)];
    By1 = [struc_edge_1(2) struc_edge_2(2)];
    Bz1 = [0 0];
    Bx2 = [struc_edge_2(1) struc_edge_3(1)];
    By2 = [struc_edge_2(2) struc_edge_3(2)];
    Bz2 = [0 0];
    Bx3 = [struc_edge_3(1) struc_edge_4(1)];
    By3 = [struc_edge_3(2) struc_edge_4(2)];
    Bz3 = [0 0];
    Bx4 = [struc_edge_4(1) struc_edge_1(1)];
    By4 = [struc_edge_4(2) struc_edge_1(2)];
    Bz4 = [0 0];
 
    %그래프 그리기
    set(p1,'X', Ax1, 'Y',Ay1,'Z',Az1);
    set(p2,'X', Ax2, 'Y',Ay2,'Z',Az2);
    set(p3,'X', Bx1, 'Y',By1,'Z',Bz1);
    set(p4,'X', Bx2, 'Y',By2,'Z',Bz2);
    set(p5,'X', Bx3, 'Y',By3,'Z',Bz3);
    set(p6,'X', Bx4, 'Y',By4,'Z',Bz4);
    pause(0.001);

end
toc