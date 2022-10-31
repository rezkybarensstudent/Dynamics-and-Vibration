chat = inline('1-w.^2+k1k*(1-u*cos(w/Ob))', 'w', 'u', 'k1k', 'Ob');
k1k = 0.0785; Kk = 0.0029; u = 1;
Ob = linspace(0.03, 0.35, 300);
L = length(Ob); w = zeros(L,1);
for n = 1:L
w(n) = fzero(chat, [0.8 1.2], [], u, k1k, Ob(n));
end
xx = -1./(Kk./Ob'+u*sin(w./Ob')./w*k1k);
indx = find(xx >= 0);
hold on
a = axis; a(4) = 50; a(2) = 0.35; axis(a)
fill(Ob(indx), xx(indx), 'c')
B = sqrt(2)*sqrt(1+k1k-sqrt(1+2*k1k+(k1k^2)*(1-u^2)));
Qm = 1./(B-Kk./Ob);
ind = find(Ob > 0.05);
plot(Ob(ind), Qm(ind), 'k--')
xlabel('\Omega')
ylabel('Q')
text(.22, 40, 'Unstable')
text(.15, 5, 'Stable')
text(0.02, 10, ['K/k=' num2str(Kk, 5)])
text(0.02, 6, ['k_1/k=' num2str(k1k, 5)])
box on
grid on