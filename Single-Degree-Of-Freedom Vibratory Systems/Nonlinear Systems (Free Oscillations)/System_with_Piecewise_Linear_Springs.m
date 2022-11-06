 % System_with_Piecewise_Linear_Springs
 function System_with_Piecewise_Linear_Springs
c = char('k-', 'k--', 'k-.');
mu = [0, 1, 10]; z = 0.15; wo = 10;
disp('Periods')
for n = 1:length(mu)
[t, w] = ode45(@sdofstops, [0, 30], [0 wo]', [], z, mu(n));
plot(t, w(:,1), c(n,:))
hold on
Tp = ZeroCrossing(t, w(:,1));
Per = Tp(3:2:9)-Tp(1:2:7);
disp(['mu = ' num2str(mu(n)) ': ' num2str(Per)])
end
legend(['\mu = ' num2str(mu(1))], ['\mu = ' num2str(mu(2))], ['\mu = ' num2str(mu(3))]);
plot([0 t(end)], [0 0], c(1,:))
plot(t, wo*exp(-t*z), 'k:', t, -wo*exp(-t*z), 'k:')
xlabel('\tau')
ylabel('w(\tau)')
function q = sdofstops(t, y, z, mu)
if abs(y(1)) <= 1
h = 0;
else
h = y(1)-sign(y(1));
end
q = [y(2); -2*z*y(2)-y(1)-mu*h];