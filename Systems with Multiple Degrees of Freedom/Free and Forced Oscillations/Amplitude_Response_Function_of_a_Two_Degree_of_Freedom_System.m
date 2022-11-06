function Amplitude_Response_Function_of_a_Two_Degree_of_Freedom_System
z1 = 0.05; z2 = z1;
wrr = [0.6, 1, 1.4];
mr = [0.1, 0.5]; NOm = 250;
Om = linspace(0, 2, NOm);
for nm = 1:length(mr)
figure(nm)
for nwr = 1:length(wrr)
H = H11(Om, wrr(nwr), mr(nm), z1, z2);
plot3(Om, repmat(wrr(nwr), NOm, 1), H, 'k-')
hold on
end
grid on
xlabel('\Omega')
ylabel('\omega_r')
zlabel('H_{11}(\Omega)')
title(['m_r=' num2str(mr(nm))])
view([-47, 42])
end
function h = H11(Om, wr, mr, z1, z2)
D = Om.^4-1j*2*(z1+z2*wr*mr+z2*wr)*Om.^3-(1+mr*wr^2+wr^2+4*z1*z2*wr)*Om.^2+1j*2*(z2*wr+z1*wr^2)*Om+wr^2;
E = wr^2+1j*2*z2*wr*Om-Om.^2;
h = abs(E./D);