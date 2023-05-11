% Planar Pendulum

% theta1 generate linearly spaced vector
theta1 = linspace(-2.0*pi, 2.0*pi, 35);
% theta2 generate linearly spaced vector
theta2 = linspace(-2.0*pi, 2.0*pi, 35);
% 2-D grids
[T1, T2] = meshgrid(theta1, theta2);
% The first integral of motion equation
F = T2.^2/2-cos(T1);
% Contour plot under mesh surface plot
meshc(T1, T2, F)
% Set axis limits and aspect ratios
axis([-2.0*pi, 2.0*pi, -2.0*pi, 2.0*pi, -5, 20])
% \theta_1 Label
xlabel('\theta_1')
% \theta_2 Label
ylabel('\theta_2')
% F(\theta_1,\theta_2) Label
zlabel('F(\theta_1,\theta_2)')