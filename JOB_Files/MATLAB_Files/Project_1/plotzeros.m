function plotzeros(fun, x_limits, y_limits, varargin)
if nargin > 3
    sample_len = varargin{1};
else
    sample_len = 500;
end
v_dis_x = linspace(x_limits(1), x_limits(2), sample_len);
v_dis_y = linspace(y_limits(1), y_limits(2), sample_len);
n_dis_x = length(v_dis_x);
n_dis_y = length(v_dis_y);
Z_1 = zeros(n_dis_y, n_dis_x);
Z_2 = zeros(n_dis_y, n_dis_x);
for i = 1:n_dis_x
    for j = 1:n_dis_y
        funz = fun([v_dis_x(i); v_dis_y(j)]); 
        Z_1(j,i) = funz(1);
        Z_2(j,i) = funz(2);
    end
end
contour(v_dis_x, v_dis_y, Z_1, [0 0], 'Linecolor',[0 1 0], 'Linewidth', 2)
hold on
contour(v_dis_x, v_dis_y, Z_2, [0 0], 'Linecolor',[0 0 1], 'Linewidth', 2)
axis equal
grid on
xlabel('$u_1$','Interpreter','latex',FontSize=18)
ylabel('$u_2$','Interpreter','latex',FontSize=18)
title('Zeros plot','Interpreter','latex',FontSize=18)
end