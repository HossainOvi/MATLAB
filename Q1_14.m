
%Rubayet Hossain
%260611040

x = [0.995:0.0001:1.005]; 
poly_a = (x-1.0).^6;
poly_b = x.^6-6*x.^5+15*x.^4 -20*x.^3+15*x.^2-6*x+1;
plot(x,poly_a,'b--',x,poly_b,'r-');

%create title
title('Compute (x-1)^6');
%create x label 
xlabel('x'); 
%create y label 
ylabel('p(x)'); 
%create legend 
legend('compact formula','expanded formula');