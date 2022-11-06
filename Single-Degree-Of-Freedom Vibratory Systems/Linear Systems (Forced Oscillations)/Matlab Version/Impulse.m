function Impulz
T = linspace(0, 35, 400);
z = 0.15; IC = [0,0];
[t, yy] = ode45(@Imp, T, IC, [], z);
plot(t, yy(:,1), 'k-')
function dd = Imp(t, y, z)
h = (1/0.01).*(t <= 0.01);
dd = [y(2); -2*z*y(2)-y(1)+h];