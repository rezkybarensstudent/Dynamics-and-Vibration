% Estimate of Damping Factor from The Logarithmic Decrement
zeta = 0.30;
[t, y] = ode45(@LinearOscillatorFree, linspace(0, 35, 400), [0, -10]', [], zeta);
Tp = ZeroCrossing(t, y(:,1));
[ymx, Imax] = max(y(:,1));
Per = Tp(3:2:7)-Tp(1:2:5);
Q = [t(Imax), t(Imax)+(1:3).*Per];
yspline = spline(t, y(:,1), Q);
delta = log(yspline(1:3)./yspline(2:4));
zetalog = delta./sqrt(4*pi^2+delta.^2);
disp('Period Damping Factor')
disp([num2str((1:3)') repmat(' ', 3, 1) num2str(zetalog')])