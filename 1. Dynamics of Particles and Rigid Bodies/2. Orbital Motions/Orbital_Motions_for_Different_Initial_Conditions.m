function Orbital_Motions_for_Different_Initial_Conditions
initcond = [2.0, 0.0, 0.0, 1.5; 1.0, 0.0, 0.0, 2.0*pi; 2.0, 0.0, 0.0, 4.0];
tspan = [1.5, 1, 0.3];
options = odeset('RelTol', 1e-6, 'AbsTol', [1e-6 1e-6 1e-6 1e-6]);
for n = 1:3
[t, x] = ode45(@orbit, [0, tspan(n)], [initcond(n,:)]', options);
polar(x(:,3), x(:,1), 'k-');
hold on
end
text(0.50, -1.30, 'Elliptical orbit');
text(-1.80, 1.00, 'Circular orbit');
text(1.75, 2.00, 'Hyperbolic orbit');
function xdot = orbit(t, x)
xdot = [x(2); x(1)*x(4)^2-4.0*pi^2/x(1)^2; x(4); -2.0*x(2)*x(4)/x(1)];