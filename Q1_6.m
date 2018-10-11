%Rubayet Hossain- 260611040
%Start

a = 0; b = 1; 
n = 555555; 
h = (b-a)/n;
fprintf('For a = %d, b = %d, n = %d, x(%d) should equal 1.\n', a, b, n, n);
x_1 = zeros(n+1,1); 
x_2= zeros(n+1,1); 
x_1(1) = a;
for k=2:n+1
x_1(k) = x_1(k-1) + h;
end
disp(sprintf('Method 1, x_1(%d) = %23.16e',n,x_1(n+1,1)))
x_2(1:n+1) = a+h*[0:n]; 
fprintf('Method 2, x_2(%d) = %23.16e\n', n, x_2(n+1,1));