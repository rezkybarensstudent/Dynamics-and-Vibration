m1 = 100;
m2 = 10;
k1 = 10000;
k2 = 1960;
c1 = 400;
c2 = 56;
mr = m2/m1;
wn1 = sqrt(k1/m1);
wn2 = sqrt(k2/m2);
wr = wn2/wn1;
z1 = c1/(2*m1*wn1);
z2 = c2/(2*m2*wn2);
D = [1, 2*(z1+z2*wr*(1+mr)), (1+wr^2*(1+mr)+4*z1*z2*wr), 2*wr*(z2+z1*wr), wr^2];
M = 2; % =1: Impulse applied to m_1; =2: Impulse applied to m_2
R = 'I'; % ='I': Obtain impulse response; ='S': Obtain step response
Tend = 30;
tt = linspace(0, Tend, 300);
Yval = [0, 0];
if strcmp(R, 'S') == 1
Yval = [1, 1];
end
if M==1
E = [1, 2*z2*wr, wr^2];
C = [2*z2*wr, wr^2];
if strcmp (R, 'I') == 1
y1= impulse(tf(E, D), tt);
y2 = impulse(tf(C, D), tt);
else
y1= step(tf(E, D), tt);
y2 = step(tf(C, D), tt);
end
else
    B = [2*z2*wr, wr^2];
A = [1, 2*(z1+z2*mr*wr), 1+mr*wr^2]/mr;
if strcmp (R, 'I') == 1
y1 = impulse(tf(B, D), tt);
y2 = impulse(tf(A, D), tt);
else
y1 = step(tf(B, D), tt);
y2 = step(tf(A, D), tt);
end
end
plot(tt, y1, 'k--', tt, y2, 'k-', [0 Tend], Yval, 'k:')
xlabel('\tau')
ylabel('Amplitude')
legend('x_1(\tau)/(F_o/k_1)', 'x_2(\tau)/(F_o/k_1)')