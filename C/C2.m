R1 = 7;
R2 = 5;
R3 = 10;
R4 = 1;
R5 = 1;
Vs = 450;

a1 = -R1;
a2 = R1 + R4;
a3 = 0;
a4 = R2;
a5 = 0;
a6 = R2 + R5;
a7 = R1 + R2 + R3;
a8 = -R1;
a9 = -R2;

A = [a1,a2,a3;a4,a5,a6;a7,a8,a9];
B = [0;Vs;0];

inv(A)*B