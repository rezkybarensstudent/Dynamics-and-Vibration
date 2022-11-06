hh = inline('x(3)./sqrt((1-(w/x(1)).^2).^2+(2*x(2)*w/x(1)).^2)', 'x', 'w');
M = 25; wfit = linspace(0, 3, M);
z = 0.15; wn = 1.5; Ao = 2;
x = [wn, z, Ao];
hfit = hh(x, wfit).*(1+0.06*randn(1, M));
xo = [1.3, 0.1, 1];
x = lsqcurvefit(hh, xo, wfit, hfit);
wplt = linspace(0, 3, 150);
plot(wplt, hh(x,wplt), 'k-', wfit, hfit, 'ks')
text(2,6.5, ['\omega_n = ' num2str(x(1), 3)])
text(2,6.0, ['\zeta = ' num2str(x(2), 3)])
text(2,5.5, ['A_o = ' num2str(x(3), 3)])
xlabel('\omega')
ylabel('H(\omega)')