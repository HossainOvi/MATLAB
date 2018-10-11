%Rubayet Hossain 
%260611040

function ch06_13
%   Finding non linear least square solutions
f_a = inline('[x(1)^2+x(2)^2-2;  (x(1)-2)^2+x(2)^2-2; (x(1)-1)^2+x(2)^2-9]','x');
f_b = inline('[x(1)^2+x(2)^2+x(1)*x(2); (sin(x(1)))^2;  (cos(x(2)))^2]','x');
options = optimset('TolX', 1e-6,   'MaxIter', 50,  'Display', 'off');
disp('Part(a)'); 
x = lsqnonlin(f_a,rand(2,1),[],[],options)
disp('Part(b)'); 
x = lsqnonlin(f_b,rand(2,1),[],[],options)
