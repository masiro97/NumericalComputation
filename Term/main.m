clc
clear all
close all

% theta 는 각 조인트의 구동 각도 [structure 각도, boom 각도, dipper 각도]
%theta = [0*pi/180; 14.5*pi/180; -101*pi/180]; % structure 0 도, boom 14.5 도, dipper -101 도 움직인 경우
% GetDHTransform( 링크의 길이(m), 링크의 비틀림 각도(rad), 조인트의 옵셋 길이(m), 조인트의 구동 각도(rad))
%theta = [0.0000*pi/180; 0.2517*pi/180; -1.7594*pi/180]; % structure 0 도, boom 14.5 도, dipper -101 도 움직인 경우
theta = [3.8163 1.8254 3.1416];
T01 = GetDHTransform( 0.0,  pi/2,   0.0,   theta(1)); % structure 변환
T12 = GetDHTransform( 1000000,   0.0,   0.0,   theta(2)); % boom 변환
T23 = GetDHTransform( 1000000,   0.0,   0.0,   theta(3)); % dipper 변환

%연속 변환
T02 = T01*T12; % 기준좌표에서 => boom 변환
T03 = T02*T23; % 기준좌표에서 => dipper 변환
%원점
origin_pos = zeros(3);

%boom 끝의 위치
boom_pos = [T02(1,4), T02(2,4), T02(3,4)];

%dipper 끝의 위치
dipper_pos = [T03(1,4), T03(2,4), T03(3,4)];

%structure 모양 만들기
struc_length = 0.5;
struc_edge_1 = [ struc_length*sin(theta(1)+pi/4), struc_length*cos(theta(1)+pi/4)];
struc_edge_2 = [ struc_length*sin(theta(1)+pi/2+pi/4), struc_length*cos(theta(1)+pi/2+pi/4)];
struc_edge_3 = [ struc_length*sin(theta(1)+pi+pi/4), struc_length*cos(theta(1)+pi+pi/4)];
struc_edge_4 = [ struc_length*sin(theta(1)+3*pi/2+pi/4), struc_length*cos(theta(1)+3*pi/2+pi/4)];

%그래프 그리기
figure
axis([-1000000 1000000 -1000000 1000000 -1000000 1000000])
line([origin_pos(1) boom_pos(1)],[origin_pos(2) boom_pos(2)],[origin_pos(3) boom_pos(3)],'Linewidth',5,'Color','r') % boom 그리기 
line([boom_pos(1) dipper_pos(1)],[boom_pos(2) dipper_pos(2)],[boom_pos(3) dipper_pos(3)],'Linewidth',5,'Color','bl') % dipper 그리기
line([struc_edge_1(1) struc_edge_2(1)],[struc_edge_1(2) struc_edge_2(2)],[0 0],'Linewidth',1,'Color','k') % structure 그리기
line([struc_edge_2(1) struc_edge_3(1)],[struc_edge_2(2) struc_edge_3(2)],[0 0],'Linewidth',1,'Color','k')
line([struc_edge_3(1) struc_edge_4(1)],[struc_edge_3(2) struc_edge_4(2)],[0 0],'Linewidth',1,'Color','k')
line([struc_edge_4(1) struc_edge_1(1)],[struc_edge_4(2) struc_edge_1(2)],[0 0],'Linewidth',1,'Color','k')
grid on









