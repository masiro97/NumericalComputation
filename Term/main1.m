th1 = 45 * pi / 180;
th2 = 45 * pi / 180;
th3 = -45 * pi / 180;

tol = 0.01;


X = [th1;th2;th3];
while(1)
    
    th1 = X(1,1);
    th2 = X(2,1);
    th3 = X(3,1);
   
    X_prev = X;
  F = [2*cos(th1)*cos(th2)-cos(th1)*sin(th2)*sin(th3)+cos(th1)*cos(th2)*cos(th3)-2;
      2*cos(th2)*sin(th1)-sin(th1)*sin(th2)*sin(th3)+cos(th2)*cos(th3)*sin(th1);
      2*sin(th2)+cos(th2)*sin(th3)+cos(th3)*sin(th2)+0.5];
  J = [-2*sin(th1)*cos(th2)+sin(th1)*sin(th2)*sin(th3)-sin(th1)*cos(th2)*cos(th3),-2*cos(th1)*sin(th2)-cos(th1)*cos(th2)*sin(th3)-cos(th1)*sin(th2)*cos(th3),-cos(th1)*sin(th2)*cos(th3)-cos(th1)*cos(th2)*sin(th3);
      2*cos(th2)*cos(th1)-cos(th1)*sin(th2)*sin(th3)+cos(th2)*cos(th3)*cos(th1),-2*sin(th2)*sin(th1)-sin(th1)*cos(th2)*sin(th3)-sin(th2)*cos(th3)*sin(th1),sin(th1)*sin(th2)*cos(th3)-cos(th2)*sin(th3)*sin(th1);
      0,2*cos(th2)-sin(th2)*sin(th3)+cos(th3)*cos(th2),cos(th2)*cos(th3)-sin(th3)*sin(th2)];
 
    X = X_prev - inv(J)*F;
    if(X(1,1) > 2*pi)
        X(1,1) = mod(X(1,1) , 2*pi);
    end
    if(X(2,1) > 2*pi)
        X(2,1) = mod(X(2,1) , 2*pi);
    end
    if(X(3,1) > 2*pi)
        X(3,1) = mod(X(3,1) , 2*pi);
    end
    if(X(2,1) < 0)
        X(2,1) = -X(2,1);
    end
     
    temp = X
    fprintf('\n\n');
    if(abs(X-X_prev) <tol)
         root = X
        break
    end
  
end

theta = [th1,th2,th3];
T01 = GetDHTransform( 0.0,  pi/2,   0.0,   theta(1)); % structure ��ȯ
T12 = GetDHTransform( 2.0,   0.0,   0.0,   theta(2)); % boom ��ȯ
T23 = GetDHTransform( 1.0,   0.0,   0.0,   theta(3)); % dipper ��ȯ

%���� ��ȯ
T02 = T01*T12; % ������ǥ���� => boom ��ȯ
T03 = T02*T23; % ������ǥ���� => dipper ��ȯ

temp = T03;
%����
origin_pos = zeros(3);

%boom ���� ��ġ
boom_pos = [T02(1,4), T02(2,4), T02(3,4)];

%dipper ���� ��ġ
dipper_pos = [T03(1,4), T03(2,4), T03(3,4)];

%structure ��� �����
struc_length = 0.5;
struc_edge_1 = [ struc_length*sin(theta(1)+pi/4), struc_length*cos(theta(1)+pi/4)];
struc_edge_2 = [ struc_length*sin(theta(1)+pi/2+pi/4), struc_length*cos(theta(1)+pi/2+pi/4)];
struc_edge_3 = [ struc_length*sin(theta(1)+pi+pi/4), struc_length*cos(theta(1)+pi+pi/4)];
struc_edge_4 = [ struc_length*sin(theta(1)+3*pi/2+pi/4), struc_length*cos(theta(1)+3*pi/2+pi/4)];

%�׷��� �׸���
figure
axis([-3 3 -3 3 -3 3])
line([origin_pos(1) boom_pos(1)],[origin_pos(2) boom_pos(2)],[origin_pos(3) boom_pos(3)],'Linewidth',5,'Color','r') % boom �׸���
line([boom_pos(1) dipper_pos(1)],[boom_pos(2) dipper_pos(2)],[boom_pos(3) dipper_pos(3)],'Linewidth',5,'Color','bl') % dipper �׸���
line([struc_edge_1(1) struc_edge_2(1)],[struc_edge_1(2) struc_edge_2(2)],[0 0],'Linewidth',1,'Color','k') % structure �׸���
line([struc_edge_2(1) struc_edge_3(1)],[struc_edge_2(2) struc_edge_3(2)],[0 0],'Linewidth',1,'Color','k')
line([struc_edge_3(1) struc_edge_4(1)],[struc_edge_3(2) struc_edge_4(2)],[0 0],'Linewidth',1,'Color','k')
line([struc_edge_4(1) struc_edge_1(1)],[struc_edge_4(2) struc_edge_1(2)],[0 0],'Linewidth',1,'Color','k')
grid on