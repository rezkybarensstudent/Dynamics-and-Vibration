% Planar Pendulum
theta1 = linspace(-2.0*pi, 2.0*pi, 35);
theta2 = linspace(-2.0*pi, 2.0*pi, 35);
[T1, T2] = meshgrid(theta1, theta2);
F = T2.^2/2-cos(T1);
meshc(T1, T2, F)
axis([-2.0*pi, 2.0*pi, -2.0*pi, 2.0*pi, -5, 20])
xlabel('\theta_1')
ylabel('\theta_2')
zlabel('F(\theta_1,\theta_2)')
