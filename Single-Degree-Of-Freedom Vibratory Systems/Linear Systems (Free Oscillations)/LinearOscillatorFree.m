function y = LinearOscillatorFree(t, y, zeta)
y = [y(2); -2*zeta*y(2)-y(1)];