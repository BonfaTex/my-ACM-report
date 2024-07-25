% ===================================================================
% System of Nonlinear Springs (table)
% ===================================================================
% Filename: main13, Author: BonfaTex
% ===================================================================
clear; clc; close;
format shorte
U = 0:0.1:1.5;
Ut = U'
a1 = 500; b1 = 50; a2 = 200; b2 = 100; a3 = 500; b3 = 100;
k1 = a1+b1*Ut;
k2 = a2+b2*Ut;
k3 = a3+b3*Ut;
kEQ = k1+k2;
F1 = k1.*Ut;
figure(1)
plot(Ut,F1,'linewidth',2)
xlabel('Elongation [mm]','Interpreter','latex',FontSize=18)
ylabel('Force in spring [N]','Interpreter','latex',FontSize=18)
title('Spring law: $N_i=k_i(e_i)\cdot e_i$','Interpreter','latex',FontSize=18)
hold on
F2 = k2.*Ut;
plot(Ut,F2,'linewidth',2)
F3 = k3.*Ut;
plot(Ut,F3,'linewidth',2)
legend('Spring 1','Spring 2','Spring 3','Interpreter','latex',Location='eastoutside',FontSize=14)
hold off
%
F12 = kEQ.*Ut
figure(2)
plot(Ut,F12,'linewidth',2)
xlabel('Elongation [mm]','Interpreter','latex',FontSize=18)
ylabel('Force in spring [N]','Interpreter','latex',FontSize=18)
title('Spring law: $N_i=k_i(e_i)\cdot e_i$','Interpreter','latex',FontSize=18)
hold on
F3 = k3.*Ut
plot(Ut,F3,'linewidth',2)
legend('Spring 1+2','Spring 3','Interpreter','latex',Location='eastoutside',FontSize=14)
hold off