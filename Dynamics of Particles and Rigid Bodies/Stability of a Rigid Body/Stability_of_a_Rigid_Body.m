% Stability of a Rigid Body
I = [150, 50, 300];
omega = [1, 0, 0; 0, 1, 0; 0, 0, 1];
for n = 1:3
A = [0, (I(3)-I(2))*omega(3,n)/I(1), (I(3)-I(2))*omega(2,n)/I(1);...
(I(1)-I(3))*omega(3,n)/I(2), 0, (I(1)-I(3))*omega(1,n)/I(2);...
(I(2)-I(1))*omega(2,n)/I(3), (I(2)-I(1))*omega(1,n)/I(3), 0];
disp(['Case ', num2str(n)])
disp([repmat('lambda(', 3, 1) int2str((1:3)') repmat(') = ', 3,1)...
num2str(eig(A), '%1.0f')])
disp(['Sum of lambda(j) = ' num2str(sum(eig(A)))])
disp(' ')
end