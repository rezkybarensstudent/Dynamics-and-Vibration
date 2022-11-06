T = linspace(0, 35, 200);
z = 0.15;
N = [0, 0, 1]; D = [1, 2*z, 1];
step(tf(N, D), T)