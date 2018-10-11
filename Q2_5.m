
%Rubayet Hossain 
%260611040

%Given
A = [21 67 88 73; 76 63 7 20; 0 85 56 54; 19.3 43 30.2 29.4];
b = [141; 109; 218; 93.7]; 
format long; 
[L,U,P] = lu(A);
disp('(a) Initial solution'); 
x_1 = U\(L\(P*b))
disp('(b) Initial residual'); 
r_1 = b-A*x_1, disp('(c)')
for j = 1:3
z = U\(L\(P*r_1)); 
disp('Improved solution'); x_1 = x_1+z
disp('New residual'); r_1 = b-A*x_1
end
