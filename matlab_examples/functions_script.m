clear
clc

%% Calling a function multiple times 
% reuse code within function, and define it only once
clear
clc

a = [1 2 3];
cos(a) + cos(a / 2) + cos(a / 4)

%% Examples of functions
clear
clc

% simple function with two inputs and three outputs - order of arguments
% matters
[u, v, w] = my_function(1, 2)

a = 7;
b = 8;
[z, y, x] = my_function(b, a)
[z1, y1, x1] = my_function(b + a, a + b / 2)

% function that works with scalar, vector and matrix inputs 
a = [1 2 3];
b = func_a(a)
func_a(2.2)
func_a([1 1; 2 1])

% function with no outputs
func_b(a)
% v = func_b(a) % error: too many output arguments

% function with no inputs
A = func_c
A = func_c() % recommended call statement
% A = func_c(a) % error: too many input parameters

% simple function - example of local variables in the function's scope

a = 1;
b = 2;
[w, v] = example_function(a, b)
a

%% Simple counting function
clear
clc

x = [3 1 5 -1 9 0 1]
a = 4.2
b = 1

[p, q] = number_less_equal(x, a, b)
% expect p = 5 and q = 2 for the input arguments defined above

%% Math function that works with scalar, vector, and matrix inputs
% function defined in its own .m file
clear
clc

a = 5;
x = ones(9, 1);
A = 2 * ones(3, 3);

math_function(a)
math_function(x)
math_function(A)

% auxiliary_function(x) % error: function is not visible in this script
%                       % because it is local to the m-file math_function.m

%% Function that requires reshaping the inputs
clear
clc

x = ones(9, 1);
A = 2 * ones(3, 3);

sum_vector_matrix(x, A)

%% Function with same shape as input
clear
clc

a = 5;
x = ones(9, 1);
A = 2 * ones(3, 3);

func_base_element(a)
func_base_element(x)
func_base_element(x')
func_base_element(A)

%% function with conditional execution and return
clear
clc

[x] = conditional_function(0)
[x] = conditional_function(1)

%% Function handles
clear
clc

F1 = @exp % create function handle for Matlab function exp
F2 = @sin % create function handle for Matlab function sin
F3 = F1 % copy function handle object (value) from variable F1 to F3
class(F1)

F1(3) == exp(3) % call the function handle the same as a function

x = [1 0 6 0 -1 -2 0 1];

% function that uses function handle as an input
func_filter(x, F1)
func_filter(x, F2)
func_filter(x, F3)
% func_filter(x, exp) % error: exp is a function name, not a function
%                     % handle

% definition of an anonymous function (without a name)
func_test = @(a, b) a + b.^2; % func_test is a function handle for a
                              % function without a name, i.e., anonymous
                              % by default has a single output
                              % has two inputs a and b
func_test(3, 1) % call the same as a regular function/function handle

% function with a function handle as an output
fnc1 = f_factory([1, 3, 1]) % returns a function handle
class(fnc1)
fnc1([1 1 1]) % use the function handle as usual

%% Local functions
function [x, y, z] = my_function(a, b)
  % my_fubction: performs common operations on inputs a, b
  % input: a 
  local_c = 1; % local variable; not visible/accesible outside the function
  x = a + b / 2;
  y = (a - 1) .* b;
  z = a + b .^ 2 + x;
  return % function returns here and all commands below it will not be
         % executed
  x = 1; % not executed, hence Matlab provides a warning
end

function [aa] = func_a(a)
  aa = a .^ 2 + 1;
end

function func_b(a)
  disp('test');
  a
end

function [A] = func_c
  A = [1 0 -1
       0 1 0 
       -1 0 1];
end

function [w, v] = example_function(a, b)
  w = a + b; % define output variable as any other variable
  a = a + 1; % values of local input variables a, b will not visible after
             % function returns
  v = w + a; % v, w can be used with can be reused after their definition
end

function [B] = sum_vector_matrix(x, A)
  X = reshape(x, size(A)); % fill column-wise
  [nrows, ncols] = size(A)
  Y = reshape(x, [ncols, nrows])'; % fill row-wise
  B = A + X;
end

function [y] = func_base_element(x)
  y = zeros(size(x));
  y(end, end) = 1;
end

function [x] = conditional_function(a)
  if (a == 0)
      x = zeros(3, 1); % if a is zero, the output is a zero column 3-vector
      return % function returns here
  else
      x = zeros(3); % if a is non-zero, the output is a 3x3 matrix
  end
  x(1, 3) = 1; % this code is executed only if a is non-zero
end

function [no_less, no_equal] = number_less_equal(x, a, b)
  % computes the number of elements in x less or equal than a
  % computes the number of elements in x equal to b
  no_less = sum(x <= a);
  no_equal = sum(x == b);
end

function y = func_filter(x, func)
 % filtering function that takes as second input argument a function to
 % apply on first input vector x before dropping elements outside the
 % (-0.5, 0.5) open interval
 y = func(x);
 y = y((y < 0.5) & (y > -0.5));
end

function [func_out] = f_factory(w)
  % function output is a function handle
  % the created function depends on the input w, and has a single input and
  % a single output
  func_out = @(x) 2 * (x + w);
end

