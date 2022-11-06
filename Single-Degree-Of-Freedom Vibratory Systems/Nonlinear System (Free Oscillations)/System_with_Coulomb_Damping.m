function System_with_Coulomb_Damping
mu = 0.86; yo = [3.0, 5.0]; vo = [0.0, 0.0];
tspan = linspace(0, 12, 120);
options = odeset('AbsTol', [1e-3, 1e-3]);
lintyp = char('--k', '-k'); lab = ', v_o = 0';
for n = 1:2
[t, y] = ode45(@CoulombDamping, tspan, [yo(n) vo(n)]', options, mu);
figure(1)
plot(t, y(:,1), lintyp(n,:))
hold on
figure(2)
plot(y(:,1), y(:,2), lintyp(n,:))
hold on
end
figure(1)
xlabel('\tau')
ylabel('y(\tau)')
axis([0.0, 12.0, -4.0, 6.0])
plot([0 12], [0 0], 'k-')
legend(['y_o = ' num2str(yo(1)) lab], ['y_o = ' num2str(yo(2)) lab])
plot([0, 12], [0, 0], 'k-')
figure(2)
xlabel(' y(\tau)')
ylabel('dy/d\tau')
text(2.5, 0.5, '(3.0,0.0)')
text(4.5, 0.5, '(5.0,0.0)')
plot([-4 6], [0 0], 'k-', [0 0], [-6 4], 'k-')
axis([-4.0, 6.0, -6.0, 4.0])
function xdot = CoulombDamping(t, x, mu)
if (abs(x(1)) <= mu) && (x(2) == 0.0)
xdot = [0; 0];
else
xdot = [x(2); -mu*sign(x(2))-x(1)];
end