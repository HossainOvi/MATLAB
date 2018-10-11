%Rubayet Hossain- 260611040
true_value = sec(1.0)^2; 
x = 1.0; 
k = [0:16]; 
h = 1.0./(10.^k);
forward_diffr = abs((tan(x+h)-tan(x))./h);
error_1 = abs(forward_diffr-true_value);
centered_diffr = abs((tan(x+h)-tan(x-h))./(2*h));
error_2 = abs(centered_diffr-true_value);
%% Create multiple lines using matrix input to loglog
loglog(h,error_1,'b--',h,error_2,'r--');
%create title 
title('Finite Difference Approx.');
%create x label
xlabel('h'); 
%create y label 
ylabel('Error magnitude');
%create legend 
legend('forward difference','centered difference');

%end 
