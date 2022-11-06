 % periodic pulse train forcing
 n = 1:200; alph = 0.4; z = 0.1; Omo = 0.0424; Nt = 400;
Hr = inline('1./sqrt((1-(Omo*n).^2).^2+(2*z*Omo*n).^2)', 'n', 'Omo', 'z');
LL = pi/Omo*alph; UL = pi/Omo*(2+alph);
tau = linspace(-LL, UL, Nt);
sn = 2*alph*sin(pi*n*alph)./(pi*n*alph);
Xnsn = abs(sn).*Hr(n, Omo, z);
thn = atan2(2*z*Omo*n, 1-(Omo*n).^2);
psi = atan2(sn, 0);
cnt = sin(Omo*n'*tau-repmat(thn', 1, Nt)+repmat(psi', 1, Nt));
y = alph+Xnsn*cnt;
figure(1)
plot([-LL -LL LL LL 2*LL/alph*(1-alph/2) 2*LL/alph*(1-alph/2) UL],...
[0 1 1 0 0 1 1], 'k--')
hold on
plot(tau, y, 'k-')
legend('f(\tau)','y(\tau)', 'location', 'SouthEast');
r = axis; r(1) = -LL; r(2) = UL; axis(r)
xlabel('\tau')
ylabel('y(\tau), f(\tau)')
figure(2)
M = 30;
plot(n(1:M), abs(Xnsn(1:M)), 'ks', n(1:M), abs(sn(1:M)), 'ko')
hold on
plot(0, alph,'ks', 0, alph, 'ko')
plot([n(1:M); n(1:M)], [zeros(1,M); abs(Xnsn(1:M))], 'k-')
plot([n(1:M); n(1:M)], [zeros(1,M); abs(sn(1:M))], 'k-')
r = axis; r(3) = -0.2; r(4) = 0.81; axis(r)
nn = linspace(0, M, 300);
H = Hr(nn, Omo, z)-1;
plot(nn, H/max(H)*r(4), 'k-', [0 M], [0 0], 'k-')
ylabel('c_l, b_l')
xlabel('Harmonic number (l)')
text(M+.5, 0, num2str(1,3))
text(M+2.5, (r(3)+r(4))/2, 'H(\Omega)', 'rotation', -90, 'HorizontalAlignment', 'center')
text(25, 0.9*r(4), 'H(\Omega) \rightarrow')
legend('c_l','b_l', 'location', 'SouthWest');