
%Rubayet Hossain
%260611040
disp('(Answer:a)');
n = 100; %Given 
b = ones(n,1);
A = spdiags([b -4*b 6*b -4*b b], -2:2, n, n);
A(1,1) = 9; A(n-1,n-1)=5; 
A(n,n) = 1; A(n,n-1)=-2; 
A(n-1,n)=-2;
tic; 
x_sparse = A\b; 
t_sparse = toc;

tic; 
x_dense = full(A)\b; 
t_dense = toc;
fprintf('Time for dense solution = %g\n', t_dense); %Print statement 
fprintf('Time for sparse solution = %g\n', t_sparse);
fprintf('norm(x_sparse-x_dense) = %g\n', norm(x_sparse-x_dense));
disp('(Answer b)'); 
n = 1000; %Given 
b = ones(n,1);
A = spdiags([b -4*b 6*b -4*b b], -2:2, n, n);
A(1,1) = 9; A(n-1,n-1)=5; A(n,n) = 1; A(n,n-1)=-2; A(n-1,n)=-2;
M = spdiags([b -2*b b], 0:2, n, n); 
M(1,1) = 2;
%Print statement 
fprintf('norm(R R^T - A) = %g\n', norm(M*M-A,inf));
fprintf('cond(A) = %g\n', condest(A))
fprintf('cond(R) = %g\n', condest(M))
x_sparse = A\b; 
z = b-A*x_sparse;
fprintf('residual norm for x_sparse = %g\n', norm(z));
x_rr1 = M\(M\b); 
r_rr1 = b-A*x_rr1;
fprintf('residual norm for x_rr = %g\n', norm(r_rr1));
fprintf('norm(x_sparse-x_rr) = %g\n', norm(x_sparse-x_rr1));
disp('Iterative refinement:')
normtemp = norm(z); 
normtemp1 = normtemp*2.0;
while normtemp < normtemp1
normtemp1 = normtemp; s = A\z; x_sparse = x_sparse+s;
z = b-A*x_sparse; normtemp = norm(z);
fprintf('residual norm for x_sparse = %g\n', normtemp);
fprintf('norm(x_sparse-x_rr) = %g\n', norm(x_sparse-x_rr1));
end;