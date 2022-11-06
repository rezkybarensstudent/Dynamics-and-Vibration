Om = linspace(0, 3, 200);
z = 0.15;
N = [0, 0, 1]; D = [1, 2*z, 1];
bode(tf(N, D), Om)