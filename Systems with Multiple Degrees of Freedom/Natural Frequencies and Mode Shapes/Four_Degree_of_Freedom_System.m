k1 = 60000; k2 = 20000; L = 1.4;
M = diag([180/L 800 25 25]);
K = [2*k1*L 0 -k1 k1
0 2*k1 -k1 -k1
-k1*L -k1 k1+k2 0
k1*L -k1 0 k1+k2];
[mode E] = eig(K, M);
[w indx] = sort(diag(sqrt(E)));
modes = mode(:, indx);
x = [2 1 3 1 3];
y = 1.8*[2 1 1 2 2];
for n = 1:4
    modes(:, n) = modes(:, n)/max(abs(modes(:, n)));
    subplot(2, 2, n)
    plot(x(1), y(1), 'ks', x(2), y(2), 'ks', x(3), y(3), 'ks')
    hold on
    plot(x(4), y(4), 'ko', x(5), y(5), 'ko', [x(4), x(5)], [y(4), y(5)],'k--')
    axis([0 4 -0.2 5])
    plot(x(1), y(1)+modes(2,n), 'ks', x(2), y(2)+modes(3,n), 'ks', x(3),...
    y(3)+modes(4,n), 'ks', 'MarkerFaceColor', 'k')
    plot(x(4), y(4)+modes(2,n)+modes(1,n), 'ko', x(5), y(5)+modes(2,n)-...
    modes(1,n), 'ko', 'MarkerFaceColor', 'k')
    plot([x(4), x(5)], [y(4)+modes(2,n)+modes(1,n), y(5)+modes(2,n)-modes(1,n)],'k-', 'MarkerFaceColor', 'k')
    title(['\omega_{' int2str(n) '} = ' num2str(w(n), 4) ' rad/s'])
    axis off
end