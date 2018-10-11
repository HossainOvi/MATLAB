%Rubayet Hossain- 260611040
%Q2.9 



for m = 1:50
   epsilon = 10^(-2*m);

   c = [1+epsilon; 2];
   B = [epsilon, 1; 1,1];
   y = gaussianElimination(B,c,0);

   norm_er(m) = norm(abs(y-ones(2,1)));
end

m = 1:50

figure  %plots the funtion
plot(m, norm_er, 'b')
title('Norm of AE')
xlabel('i where epsilon = 10^{-2i}')
ylabel('Absolute Error')


clear;
%Starts the for loop 

for m = 1:50
   epsilon = 10^(-2*m);
   c = [epsilon+1; 2];
   B = [epsilon, 1; 1,1];

   y = gaussianElimination(B,c,0);

   r = c-B*y;
   z = B\r;
   y = y+z;
   error_norm(m) = norm(abs(y-ones(2,1)));
end

m = 1:50;


figure
plot(m, error_norm, 'b')
title('Norm Of AE with Refinement')
xlabel('j ; epsilon = 10^{-2i}')
ylabel('Absolute Error')
