% ===================================================================
% System of Nonlinear Springs (NR method)
% ===================================================================
% Filename: main11, Author: BonfaTex
% ===================================================================
clear; clc; close;
% data
tol = 1.0e-9; iter = 0; max_iter = 100; u = [9;9]; old_u = u; F = 100;
a1 = 500; b1 = 50; a2 = 200; b2 = 100; a3 = 500; b3 = 100;
k1 = a1+b1*u(1); k2 = a2+b2*u(1); k3 = a3+b3*(u(2)-u(1));
% internal force vector
P = generate_int_force(u,a1,b1,a2,b2,a3,b3);
% external force vector
FF = [0; F];
% residual
R = FF - P;
% convergence parameter
conv = (R(1)^2+R(2)^2)/(1+FF(1)^2+FF(2)^2);
conv_rate = [];
fprintf('%s', repmat('*', 1, 69));
fprintf('\nRESULTS\n');
fprintf('%s', repmat('*', 1, 69));
fprintf('\n');
fprintf('\niter   u1        u2        conv');
fprintf('\n %3d   %7.5f   %7.5f   %7.5e',iter,u(1),u(2),conv);
while conv > tol && iter < max_iter
    % jacobian matrix of P
    Kt = generate_jacobian(u,a1,b1,a2,b2,a3,b3);
    % check if it is singular
    if det(Kt)==0
        fprintf('\n\n');
        error('Jacobian is singular!')
    end
    % solve the linear system
    delta_u = Kt\R;
    % update of the solution
    u = old_u + delta_u;
    % update of the internal force vector
    P = generate_int_force(u,a1,b1,a2,b2,a3,b3);
    % update of the residual
    R = FF - P;
    % update of the convergence parameter
    conv = (R(1)^2+R(2)^2)/(1+FF(1)^2+FF(2)^2);
    % save it in a vector
    conv_rate = [conv_rate; conv];
    % ready for a new iteration
    old_u = u;
    iter = iter + 1;
    % print of the results
    fprintf('\n %3d   %7.5f   %7.5f   %7.5e',iter,u(1),u(2),conv);
end
if iter==max_iter
    fprintf('\n\n');
    error('Convergence not reached!')
end
fprintf('\n\nConvergence reached in %d iterations',iter); 
fprintf('\n\n');
fprintf('%s', repmat('*', 1, 69)); fprintf('\n\n');
% p = log2(conv_rate(1:end-1)./conv_rate(2:end));


