function Optimal_Parameters_for_a_Vibration_Absorber
Om = linspace(0, 2, 100);
Lbnd = [0.1, 0]; Ubnd = [2 1];
xo = [.8, 0.35];
opt = optimset('Display', 'off');
mr = .1; z1 = .1;
[xopt, fopt] = fminimax(@objfun2doflinconstr, xo, [], [], [], [], Lbnd,...
Ubnd, [], opt, mr, z1);
plot(Om, H11(Om, xopt(1), mr, z1, xopt(2)), 'k-')
ax = axis;
text(0.2*ax(2), 0.3*ax(4), ['\omega_{r,opt} = ' num2str(xopt(1), 3)])
text(0.2*ax(2), 0.2*ax(4), [' \zeta_{2,opt} = ' num2str(xopt(2), 3)])
xlabel('\Omega')
ylabel('H_{11}(\Omega)')
function [z, xx] = objfun2doflinconstr(x, mr, z1)
wr = x(1); z2 = x(2);
opt = optimset('Display', 'off');
a1 = 1+(1+mr)*wr^2;
OmA = sqrt(0.5*(a1-sqrt(a1^2-4* wr^2)));
OmB = sqrt(0.5*(a1+sqrt(a1^2-4* wr^2)));
[x1, f1] = fminsearch(@Min2dof, OmA, opt, wr, mr, z1, z2);
[x2, f2] = fminsearch(@Min2dof, OmB, opt, wr, mr, z1, z2);
[x3, f3] = fminsearch(@H11, (OmA+OmB)/2, opt, wr, mr, z1, z2);
z = [1/f1, 1/f2, f3];
xx = [x1, x2, x3];
function h = H11(Om, wr, mr, z1, z2)
D2 = Om.^4-1j*2*(z1+z2*wr*mr+z2*wr)*Om.^3-(1+mr*wr^2+wr^2+4*z1*z2*wr)*Om.^2+1j*2*(z2*wr+z1*wr^2)*Om+wr^2;
E2 = wr^2+1j* 2*z2*wr*Om-Om.^2;
h = abs(E2./D2);
function m = Min2dof(Om, wr, mr, z1, z2)
m = 1./H11(Om, wr, mr, z1, z2);