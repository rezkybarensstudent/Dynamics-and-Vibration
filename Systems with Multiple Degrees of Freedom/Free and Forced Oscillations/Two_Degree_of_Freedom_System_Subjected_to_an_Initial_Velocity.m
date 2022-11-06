% Two_Degree_of_Freedom_System_Subjected_to_an_Initial_Velocity
function Two_Degree_of_Freedom_System_Subjected_to_an_Initial_Velocity
mr = 0.3; wr = 0.6; z1 = 0.15; z2 = 0.25;
tt = linspace(0, 30, 300);
[t, y] = ode45(@InitialVelocity, tt, [0 1 0 1]', [], z1, z2, mr, wr);
plot(t, y(:,1), 'k--', t, y(:,3), 'k-', [0 30], [0 0], 'k:')
xlabel('\tau')
ylabel('Amplitude')
legend('x_1(\tau)', 'x_2(\tau)')
function dd = InitialVelocity(t, y, z1, z2, mr, wr)
A = -2*(z1+z2*mr*wr)*y(2)-(1+mr*wr^2)*y(1)+2*z2*mr*wr*y(4)
+mr*wr^2*y(3);
B = -2*z2*wr*y(4)-wr^2*y(3)+2*z2*wr*y(2)+wr^2*y(1);
dd = [y(2); A; y(4); B];