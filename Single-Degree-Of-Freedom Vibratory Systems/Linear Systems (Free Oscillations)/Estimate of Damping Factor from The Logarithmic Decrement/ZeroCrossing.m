function T = ZeroCrossing (t, y)
cnt = 0;
for n = 3:length(t)-4
if y(n-1)*y(n) < 0
N = n-3:n+4;
cnt = cnt+1;
T(cnt) = interp1(y(N), t(N), 0);
end
end