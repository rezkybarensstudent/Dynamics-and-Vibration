function StepResponse
T = linspace(0, 35, 400);
z = 0.15; IC = [0,0];
[t, yy] = ode45(@Stp,T, IC, [], z);
plot(t, yy(:,1), 'k-')
function dd = Stp(t, y, z)
dd = [y(2); -2*z*y(2)-y(1)+1];