%Rubayet Hossain-260611040
function ch05_01 
%Fixed-point Iteration Schemes
fs =  {'(x^2-2)' 'sqrt(x + 2)' '1 + 2/x' '(x^2 + 2)/(2*x - 1)'};
tol =  eps; 
maxits  =  10;
x_ValueTrue  =  2;
disp('Computer Problem 5_1(b)');
for i=1:4    
    fprintf('g_%g(x) =  %s\n', i, fs{i});
    g =  inline(fs{i},'x');   
    disp([' k 	x 	error ','ratio']); 
    k =  0;
    x =  2.5; 
    error =  abs(x - x_ValueTrue);   
    fprintf('%3d	%20.12e	%20.12e\n', k, x, error);
    while error > tol && k < maxits
        k =  k+1;
        x =  g(x); 
        error_new  =  abs(x-x_ValueTrue);     
        ratio =  error_new/error;
        error =  error_new;  
        fprintf('%3d	%20.12e	%20.12e	%20.12e\n', k, x, error, ratio); 
    end; 
    disp(' ');
end