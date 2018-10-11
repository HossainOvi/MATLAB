%Rubayet Hossain
%26011040
clear;

for n = 1:100
    W = rand(n,n).*200;
    z = ones(n,1);

	a = W*z;

	%None
	tic
	x_zero = gaussianElimination(W,a,'no_pivoting');
	timer_zero(n) = toc;
	norm_zero(n) = norm(abs(x_zero-z));
	res_zero(n) = norm(a-W*x_zero);

	%full 
	tic
	x_full = gaussianElimination(W,a,'full_pivoting');
	timerF(n) = toc;
	normF(n) = norm(abs(x_full-z));
	resF(n) = norm(a-W*x_full);

	%Partial 
	tic
	xP = gaussianElimination(W,a,'partial_pivoting');
	timerP(n) = toc;
	normP(n) = norm(abs(xP-z));
	resP(n) = norm(a-W*xP);

end

l = 1:n;

figure %plots the figure
plot(l, normF, 'g', l, normP, 'r', l, norm_zero, 'b')
legend('Full', 'Partial', 'None')
title('Absolute Error')
xlabel('Size of Matrix')
ylabel('Absolute Error')

% Gaussian
figure
plot(l, resF, 'r', l, resP, 'b', l, res_zero, 'y')
legend('Full', 'Partial', 'None')
title('Residual')
xlabel('Size of Matrix')
ylabel('Norm of Residual')

% Execution Time 
figure
plot(l, timerF, 'r', l, timerP, 'g', l, timer_zero, 'b')
legend('Complete', 'Partial', 'None')
title('Comparison of Execution Time Of Gaussian Elimination')
xlabel('Size ')
ylabel('Seconds')


clear;

for n = 1:100
	W = 9.9 + (0.1).*rand(n,n);
	z = ones(n,1);
	a = W*z;

	%Partial Pivoting
	xP = gaussianElimination(W,a,'partial_pivoting');
	normP(n) = norm(abs(xP-z));
	resP(n) = norm(a-W*xP);

	%Complete Pivoting
	x_full = gaussianElimination(W,a,'full_pivoting');
	normF(n) = norm(abs(x_full-z));
	resF(n) = norm(a-W*x_full);
end

l = 1:n;

figure
plot(l, resP-resF, 'r')
title('Residual Norm Difference')
xlabel('Size of Matrix')
ylabel('Difference In Residual Vectors')

figure
plot(l, normP-normF, 'r')
title('Norm of Absolute Error ')
xlabel('Size of Matrix')
ylabel('Difference In Relative Error ')
