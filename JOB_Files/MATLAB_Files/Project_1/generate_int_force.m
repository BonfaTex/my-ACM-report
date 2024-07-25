function P = generate_int_force(u,a1,b1,a2,b2,a3,b3)
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
U = [u(1)^2;u(1);u(1)*u(2);u(2);u(2)^2];
P1 = [A,B,C,D,E;F,G,H,I,L];
P = P1*U;
end

