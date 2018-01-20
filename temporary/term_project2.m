clc
clear

th = [pi * 45 / 180;
      pi * 45 / 180;
     -pi * 45 / 180];

tol = 0.1;
iter = 0;

figure
axis([-3 3 -3 3 -3 3])
origin_pos = zeros(3);
struc_length = 0.5;
grid on

for i = 1:100
    while(1)
    th_prev = th;
    th = th_prev - jaco(th(1),th(2),th(3))\fun(th(1),th(2),th(3),1.5,1.2,-0.5);
        if(abs(th - th_prev) < tol)
            break;
        end
    end

    boom_pos = boom(th(1),th(2));
    dipper_pos = dipper(th(1),th(2),th(3));
    struc_edge_1 = [ struc_length*sin(th(1)+pi/4), struc_length*cos(th(1)+pi/4)];
    struc_edge_2 = [ struc_length*sin(th(1)+pi/2+pi/4), struc_length*cos(th(1)+pi/2+pi/4)];
    struc_edge_3 = [ struc_length*sin(th(1)+pi+pi/4), struc_length*cos(th(1)+pi+pi/4)];
    struc_edge_4 = [ struc_length*sin(th(1)+3*pi/2+pi/4), struc_length*cos(th(1)+3*pi/2+pi/4)];

  
    line([origin_pos(1) boom_pos(1)],[origin_pos(2) boom_pos(2)],[origin_pos(3) boom_pos(3)],'Linewidth',5,'Color','r') % boom 그리기 
    line([boom_pos(1) dipper_pos(1)],[boom_pos(2) dipper_pos(2)],[boom_pos(3) dipper_pos(3)],'Linewidth',5,'Color','bl') % dipper 그리기
    line([struc_edge_1(1) struc_edge_2(1)],[struc_edge_1(2) struc_edge_2(2)],[0 0],'Linewidth',1,'Color','k') % structure 그리기
    line([struc_edge_2(1) struc_edge_3(1)],[struc_edge_2(2) struc_edge_3(2)],[0 0],'Linewidth',1,'Color','k')
    line([struc_edge_3(1) struc_edge_4(1)],[struc_edge_3(2) struc_edge_4(2)],[0 0],'Linewidth',1,'Color','k')
    line([struc_edge_4(1) struc_edge_1(1)],[struc_edge_4(2) struc_edge_1(2)],[0 0],'Linewidth',1,'Color','k')
    pause(0.00000000000000000000000000000000000001);
    cla
    th = [pi * 45 / 180;
      pi * 45 / 180;
     -pi * 45 / 180];
    
    while(1)
       th_prev = th;
        th = th_prev - jaco(th(1),th(2),th(3))\fun(th(1),th(2),th(3),-1.3,1.2,0.5);
       if(abs(th - th_prev) < tol)
           break;
       end
    end
    boom_pos = boom(th(1),th(2));
    dipper_pos = dipper(th(1),th(2),th(3));
    struc_edge_1 = [ struc_length*sin(th(1)+pi/4), struc_length*cos(th(1)+pi/4)];
    struc_edge_2 = [ struc_length*sin(th(1)+pi/2+pi/4), struc_length*cos(th(1)+pi/2+pi/4)];
    struc_edge_3 = [ struc_length*sin(th(1)+pi+pi/4), struc_length*cos(th(1)+pi+pi/4)];
    struc_edge_4 = [ struc_length*sin(th(1)+3*pi/2+pi/4), struc_length*cos(th(1)+3*pi/2+pi/4)];

  
    line([origin_pos(1) boom_pos(1)],[origin_pos(2) boom_pos(2)],[origin_pos(3) boom_pos(3)],'Linewidth',5,'Color','r') % boom 그리기 
    line([boom_pos(1) dipper_pos(1)],[boom_pos(2) dipper_pos(2)],[boom_pos(3) dipper_pos(3)],'Linewidth',5,'Color','bl') % dipper 그리기
    line([struc_edge_1(1) struc_edge_2(1)],[struc_edge_1(2) struc_edge_2(2)],[0 0],'Linewidth',1,'Color','k') % structure 그리기
    line([struc_edge_2(1) struc_edge_3(1)],[struc_edge_2(2) struc_edge_3(2)],[0 0],'Linewidth',1,'Color','k')
    line([struc_edge_3(1) struc_edge_4(1)],[struc_edge_3(2) struc_edge_4(2)],[0 0],'Linewidth',1,'Color','k')
    line([struc_edge_4(1) struc_edge_1(1)],[struc_edge_4(2) struc_edge_1(2)],[0 0],'Linewidth',1,'Color','k')
    
        pause(0.00000000000000000000000000000000000001);
    cla
    th = [pi * 45 / 180;
      pi * 45 / 180;
     -pi * 45 / 180];
end
