%Rubayet Hossain- 260611040 


n = 20;

x = [-20;-15;-10;-5;-1;1;5;10;15;20];
ValuesApprox = zeros(length(x),1);
NegativeApprox = zeros(length(x),1);
actualValues = zeros(length(x),1);

%test values of x 
for k=1 : length(x)
    % actual value of e^x
    actualValues(k) = exp(x(k));

 
    for i=0:n           
        ValuesApprox(k) = ValuesApprox(k) + (x(k)^i) / (factorial(i));
    end
end


for k=1 : length(x)
    
    for i=0:n
        NegativeApprox(k) = NegativeApprox(k) + (abs(x(k))^i) / (factorial(i));
    end
    if(x(k) < 0)
       NegativeApprox(k) = 1 / NegativeApprox(k);
    end
end

disp('actualValues');
disp(actualValues);
disp('ValuesApprox');
disp(ValuesApprox);
disp('NegativeApprox');
disp(NegativeApprox);