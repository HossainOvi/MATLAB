
%Rubayet Hossain
%260611040

a = [ 6 6*10^154 0 1 1 10^(-155)];
b = [ 5 5*10^154 1 -10^5 -4 -10^155];
c = [-4 -4*10^154 1 1 3.999999 10^155];
root_1 = zeros(size(a)); 
root_2 = zeros(size(a));
for j=1:length(a)
[root_1(j),root_2(j)] = QuadSolve(a(j),b(j),c(j));
end
disp('a b c Root_1 Root_2')
fprintf('%10.7g %10.7g %10.7g %10.6g %10.7g\n',...
    [a; b; c; root_1; root_2]);
function [root_1, root_2] = QuadSolve(unscale_a,unscale_b,unscale_c);
% Returns NaN for roots that can't be computed 

root_1 = NaN; 
root_2 = NaN; % initialize to NaN
fact = max(abs([unscale_a unscale_b unscale_c]));
a = unscale_a/fact; b = unscale_b/fact; c = unscale_c/fact;
% compute discriminant

disc = b*b-4*a*c; 
% when a is zero)
if abs(a) < eps 
if abs(b) >= eps, root_1 = -c/b; end
% imaginary roots
elseif disc < 0 
fprintf('imaginary roots for %13.6g,%13.6g,%13.6g\n',...
unscale_a,unscale_b,unscale_c);
% repeated root
elseif sqrt(disc) < eps 
root_1 = -b/(2*a); 
root_2 = root_1;
else
temp = sqrt(disc); % choose formula that avoids cancellation
if(b > 0), root_1 = (2*c)/(-b-temp); root_2 = (-b-temp)/(2*a);
else root_1 = (-b+temp)/(2*a); root_2 = (2*c)/(-b+temp); end
end
end
