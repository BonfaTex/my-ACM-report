% ===================================================================
% System of Nonlinear Springs (plot)
% ===================================================================
% Filename: main12, Author: BonfaTex
% ===================================================================
clear; clc; close;
a1 = 500; b1 = 50; a2 = 200; b2 = 100; a3 = 500; b3 = 100; f = 100;
A = b1+b2-b3; B = a1+a2+a3; C = 2*b3; D = -a3; E = -b3;
F = b3; G = -a3; H = -2*b3; I = a3; L = b3;
fun = @(u) [A*u(1)^2+B*u(1)+C*u(1)*u(2)+D*u(2)+E*u(2)^2;
            F*u(1)^2+G*u(1)+H*u(1)*u(2)+I*u(2)+L*u(2)^2-f];
plotzeros(fun, [-1 3], [-1 3])
%
figure()
[X,Y] = meshgrid(-15:.5:15);
Z1 = (b1+b2-b3)*X.^2+(a1+a2+a3)*X+2*b3*X.*Y-a3*Y-b3*Y.^2;
s1 = surf(X,Y,Z1,'FaceAlpha',0.5);
s1.EdgeColor = 'none';
xlabel('$u_1$','Interpreter','latex',FontSize=18)
ylabel('$u_2$','Interpreter','latex',FontSize=18)
zlabel('$P$','Interpreter','latex',FontSize=18)
title('Surfaces plot','Interpreter','latex',FontSize=18)
hold on
Z2 = b3*X.^2-a3*X-2*b3*X.*Y+a3*Y+b3*Y.^2-F;
s2 = surf(X,Y,Z2,'FaceAlpha',0.5);
s2.EdgeColor = 'none';
contour(X,Y,Z1, [0 0], 'r', 'LineWidth', 1);
contour(X,Y,Z2, [0 0], 'b', 'LineWidth', 1);