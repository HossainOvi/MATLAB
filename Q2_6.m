
%Rubayet Hossain
%260611040
n = 1; 
condH = 1; 
disp(' n resid_norm error_norm digits cond');
%while loop 
while condH < 1e+16
n = n+1; 
H_1 = hilb(n); condH = cond(H_1); x1_true = ones(n,1);b = H_1*x1_true; 
x_1 = H_1\b; 
rTemp_norm = norm(b-H_1*x_1,inf);
eTemp_norm = norm(x_1-x1_true,inf); 
digitNo = -log10(eTemp_norm);
fprintf('%2d %13.6e %13.6e %4.1f %13.6e\n’, n, r1_norm',...
eTemp_norm, digitNo, condH);
end

%Display  
disp('Condition number is exponential in n.')
disp('Number of correct digits is around 16 minus log_10 of condition number.')