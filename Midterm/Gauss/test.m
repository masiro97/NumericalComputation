clc
clear all
a = [0 -1 2 4;
    -2 2 -1 -1;
    -2 4 3 15];
n = 3;

%������ ����n�� ���� �࿭ a�� �Է� ������ Gauss Elimination �� ������ ���
%a_new�� ���

a_new = s_gauss(n,a);

for i=1:1:n
    fprintf('  %d      %f\n',i,a_new(i,1));
    
end

fprintf('--------------\n');