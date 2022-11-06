K = [100, -100, 0; -100, 150, -50; 0, -50, 50];
M = diag([100, 100, 100]);
[VibrationModes, Eigenvalues] = eig(K, M)
rank(K)
K = [100, -100, 0; -100, 150, -50; 0, -50, 50];
rnk = rank(K);
[m, n] = size(K);
disp(['Number of zero eigenvaules is ' int2str(m-rnk)])