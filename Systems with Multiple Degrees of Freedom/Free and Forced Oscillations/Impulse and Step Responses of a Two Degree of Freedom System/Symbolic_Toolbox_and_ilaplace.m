m1 = 100; m2 = 10; k1 = 10000; k2 = 1960;
c1 = 400; c2 = 56;
mr = m2/m1; wn1 = sqrt(k1/m1);
wn2 = sqrt(k2/m2); wr = wn2/wn1;
z1 = c1/(2*m1*wn1); z2 = c2/(2*m2*wn2);
D = [1, 2*(z1+z2*wr*(1+mr)), (1+wr^2*(1+mr)+4*z1*z2*wr),...
2*wr*(z2+z1*wr), wr^2];
M = 2; % =1: Impulse applied to m_1; =2: Impulse applied to m_2
R = 'I'; % ='I': Obtain impulse response; ='S': Obtain step response
Tend = 30;
tt = linspace(0, Tend, 300);
Yval = [0, 0];
if strcmp(R, 'S') == 1
Yval = [1, 1];
end
syms s t
A = s^2+2*(z1+z2*mr*wr)*s+1+mr*wr^2;
B = 2*z2*mr*wr*s+mr*wr^2;
C = B/mr;
E = s^2+2*z2*wr*s+wr^2;
D2 = s^4+2*(z1+z2*wr*(1+mr))*s^3+(1+wr^2*(1+mr)+4*z1*z2*wr)*s^2+2*wr*(z2+z1*wr)*s+wr^2;
if M==1
K1 = 1; K2 = 0; % Impulse applied to m_1 only
else
K1 = 0; K2 = 1/mr; % Impulse on mass m_2 only
end
if strcmp(R, 'I') == 1
si = 1;
else
si = 1/s;
end
X1 = vpa(si*(K1*E+K2*B)/D2, 5);
X2 = vpa(si*(K1*C+K2*A)/D2, 5);
xt1 = inline(vectorize(vpa(ilaplace(X1, s, t), 5)), 't');
xt2 = inline(vectorize(vpa(ilaplace(X2, s, t), 5)), 't');
plot(tt, xt1(tt), 'k--', tt, xt2(tt), 'k-', [0 Tend], Yval, 'k:')
xlabel('\tau')
ylabel('Amplitude')
legend('x_1(\tau)/(F_o/k_1)', 'x_2(\tau)/(F_o/k_1)')