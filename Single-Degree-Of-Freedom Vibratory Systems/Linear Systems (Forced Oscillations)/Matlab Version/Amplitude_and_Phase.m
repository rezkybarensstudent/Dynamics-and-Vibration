Om = linspace(0, 3, 200);
z = 0.15;
[a, p] = H(Om, z);
subplot(2, 1, 1)
loglog(Om, a, 'k-')
subplot(2, 1, 2)
semilogx(Om, p*180/pi, 'k-')
function [a, p] = H(Om, z)
a = 1./sqrt((1-Om.^2).^2 + (2*z*Om).^2);
p = atan2(2*z*Om, 1-Om.^2);
end