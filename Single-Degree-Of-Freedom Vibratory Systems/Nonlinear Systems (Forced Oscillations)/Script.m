function Script
z = 0.2; alphao = [0, 6250];
Omega = 3; M = 12000;
tspan = linspace(0, 30, M);
N = 2^13; Nstart = 3200; Fs = M/30;
f = (Fs*(0:N-1)/N)*2.0*pi;
for m = 1:2
[t, y] = ode45(@ForcedNLOscillator, tspan, [0 0]', [], z, alphao(m), Omega);
figure(m);
plot(t, y(:,1), 'k-');
axis([0, 25, -0.2, 0.46]);
xlabel('\tau');
ylabel('y(\tau)');
axes('position', [0.55, 0.63, 0.25, 0.25])
Amp = abs(fft(y(Nstart:Nstart+N, 1), N))/N;
plot(f(1:40), 2*Amp(1:40), 'k-');
v = axis; v(2) = f(40); v(4) = max(2*Amp(1:40)); axis(v)
xlabel('\Omega');
ylabel('Amplitude');
end
function xdot = ForcedNLOscillator(t, x, zeta, alphao, Omega)
xdot = [x(2); -2*zeta*x(2)-x(1)- alphao*x(1)^3+cos(Omega*t)];