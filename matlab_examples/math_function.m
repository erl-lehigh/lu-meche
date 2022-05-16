% m-file has the same name as the function. Otherwise, Matlab will not be
% able to find the function "math_function".

function [y] = math_function(x)
  % f(x) = x * e^sin(x)
  y = x .* exp(sin(x)) + auxiliary_function(2*x); % notice element-wise product .*
end

function [y] = auxiliary_function(x)
  % local function not visible in other scripts
  y = 0.2 * x - 1;
end