clc
clear all
close all

% theta �� �� ����Ʈ�� ���� ���� [structure ����, boom ����, dipper ����]
%theta = [0*pi/180; 14.5*pi/180; -101*pi/180]; % structure 0 ��, boom 14.5 ��, dipper -101 �� ������ ���
% GetDHTransform( ��ũ�� ����(m), ��ũ�� ��Ʋ�� ����(rad), ����Ʈ�� �ɼ� ����(m), ����Ʈ�� ���� ����(rad))
%theta = [0.0000*pi/180; 0.2517*pi/180; -1.7594*pi/180]; % structure 0 ��, boom 14.5 ��, dipper -101 �� ������ ���
theta = [3.8163 1.8254 3.1416];
T01 = GetDHTransform( 0.0,  pi/2,   0.0,   theta(1)); % structure ��ȯ
T12 = GetDHTransform( 1000000,   0.0,   0.0,   theta(2)); % boom ��ȯ
T23 = GetDHTransform( 1000000,   0.0,   0.0,   theta(3)); % dipper ��ȯ

%���� ��ȯ
T02 = T01*T12; % ������ǥ���� => boom ��ȯ
T03 = T02*T23; % ������ǥ���� => dipper ��ȯ
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
axis([-1000000 1000000 -1000000 1000000 -1000000 1000000])
line([origin_pos(1) boom_pos(1)],[origin_pos(2) boom_pos(2)],[origin_pos(3) boom_pos(3)],'Linewidth',5,'Color','r') % boom �׸��� 
line([boom_pos(1) dipper_pos(1)],[boom_pos(2) dipper_pos(2)],[boom_pos(3) dipper_pos(3)],'Linewidth',5,'Color','bl') % dipper �׸���
line([struc_edge_1(1) struc_edge_2(1)],[struc_edge_1(2) struc_edge_2(2)],[0 0],'Linewidth',1,'Color','k') % structure �׸���
line([struc_edge_2(1) struc_edge_3(1)],[struc_edge_2(2) struc_edge_3(2)],[0 0],'Linewidth',1,'Color','k')
line([struc_edge_3(1) struc_edge_4(1)],[struc_edge_3(2) struc_edge_4(2)],[0 0],'Linewidth',1,'Color','k')
line([struc_edge_4(1) struc_edge_1(1)],[struc_edge_4(2) struc_edge_1(2)],[0 0],'Linewidth',1,'Color','k')
grid on









