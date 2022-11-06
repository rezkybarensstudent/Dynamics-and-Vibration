function  Impulse_Response_of_an_EulerBernoulli_Beam
Nroot = 8; w = []; Ne= 20; Ntau = 52;
CantRoot = @(x,w) (cosh(x).*cos(x)+1);
xi = [0.25, 0.4]; eta = linspace(0, 1, Ne); tau = linspace(0, 0.3, Ntau);
Om = linspace(1.5, 35, 100); Nn = zeros(Nroot, 1);
Omega = FindZeros(CantRoot, Nroot, Om, w);
for k = 1:Nroot
Nn(k) = quadl(@W2, 0, 1, [], [], Omega(k));
end
for m = 1:2
figure(m)
Cn = W(xi(m), Omega)./Nn./Omega.^2;
w = zeros(Ne,Ntau);
for c = 1:Ntau
    for r = 1:Ne
w(r,c) = sum(Cn.*W(eta(r), Omega).*sin(Omega.^2*tau(c)));
end
end
mesh(tau, eta, -w)
colormap([0 0 0 ])
axis vis3d
view([-44, 58])
xlabel('\tau')
ylabel('\eta')
zlabel('w(\eta,\tau)/G_o')
a = axis; a(1) = 0; a(2) = 0.3;
axis(a)
end
function f = Q(x)
f = 0.5*(cosh(x)+cos(x));
function f = S(x)
f = 0.5*(cosh(x)-cos(x));
function f = T(x)
f = 0.5*(sinh(x)-sin(x));
function f = W(x,Om)
f = -T(Om)./Q(Om).*T(Om.*x)+S(Om.*x);
function f = W2(x, Om)
f = W(x,Om).^2;