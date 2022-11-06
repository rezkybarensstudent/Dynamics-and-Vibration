function Half_Sine_Wave_Base_Excitation
mr = 0.1; wr = 0.2; z1 = 0.1; z2 = 0.1; Omo = 0.05;
tt = linspace(0, 150, 400);
[t, y] = ode45(@MovingBase, tt, [0 0 0 0]', [], z1, z2, mr, wr, Omo);
indx = find(tt<=pi/Omo);
hh = sin(Omo*tt(indx));
subplot(2,1,1)
plot(t, y(:,1), 'k-', tt(indx), hh, 'k--', [0, 150], [0, 0],'k:')
xlabel('\tau')
ylabel('x_1(\tau)/X_o')
subplot(2,1,2)
plot(t, y(:, 3), 'k-', tt(indx), hh, 'k--', [0, 150], [0, 0],'k:')
xlabel('\tau')
ylabel('x_2(\tau)/X_o')
function dd = MovingBase(t, y, z1, z2, mr, wr, Omo)
A = -2*(z1+z2*mr*wr)*y(2)-(1+mr*wr^2)*y(1)+2*z2*mr*wr*y(4)+mr*wr^2*y(3);
B = -2*z2*wr*y(4)-wr^2*y(3)+2*z2*wr*y(2)+wr^2*y(1);
h = (2*z1*Omo*cos(Omo*t)+sin(Omo*t)).*(t<=pi/Omo);
dd = [y(2); A+h; y(4); B];