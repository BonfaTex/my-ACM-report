function J = generate_jacobian(u,a1,b1,a2,b2,a3,b3)
A = b1+b2-b3;
B = a1+a2+a3;
C = 2*b3;
D = -a3;
E = -b3;
F = b3;
G = -a3;
H = -2*b3;
I = a3;
L = b3;
U = [u(1);u(2);1];
J1 = [2*A,C,B;C,2*E,D;2*F,H,G;H,2*L,I];
J2 = J1*U;
J = [J2(1),J2(2);J2(3),J2(4)];
end