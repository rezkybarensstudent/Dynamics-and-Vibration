zeta = [0.1, 1.0, 5.0]; lintyp = char('-k', '--k', '-.k');
tspan = linspace(0, 40, 400);
for n = 1:3
[t, y] = ode45(@LinearOscillatorFree, tspan, [1 1]', [], zeta(n));
figure(1);
plot(t, y(:,1), lintyp(n,:));
hold on
figure(2);
plot(y(:,1), y(:,2), lintyp(n,:));
hold on
end
figure(1)
xlabel('\tau');
ylabel('y(\tau)');
axis([0, 40, -1.5, 1.5]);
plot([0, 40], [0, 0], 'k-')
legend('\zeta = 0.1', '\zeta = 1.0', '\zeta = 5.0')
figure(2)
xlabel('Displacement');
ylabel('Velocity');
legend('\zeta = 0.1', '\zeta = 1.0', '\zeta = 5.0', 2)
axis([-1.5, 1.5, -1.5, 1.5]);