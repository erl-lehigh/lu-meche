clear
close all
clc

%% matrix math

A = rand(3, 2)
B = rand(3, 2)

A .* B % element-wise product matrix exists
% A * B % leads to an error

A = rand(2, 3)
B = rand(3, 2)

% both product matrices exist, but have different sizes
A * B
B * A

% only one product matrix exists
A = rand(2, 3)
B = rand(3, 4)

A * B
% B * A % leads to an error

% source of errors with square matrices - use of appropriate product op
A = rand(3, 3)
B = rand(3, 3)

% both matrix and element-wise product matrices exist, but produce
% different values
A * B
A .* B
 
% non-commuative
A = rand(3, 3)
B = rand(3, 3)

% same size, different product matrices in general
A * B
B * A

% matrix sum is element-wise; also commutative
A + B

% vectors are regarded as matrices; matrix product applies to them as well
v = 1:10 % 1 x 10 matrix -> row vector
v' % 10 x 1 matrix -> column vector

%% matrix inverse, power
 
I = eye(3) % identity matrix: unit element for matrix product

A = [1 2 3
     0 1 2
     1 0 1]
% I defined such that that for any (square) matrix A * I = I * A = A
A * I
I * A

% matrix inverse defined such that A * A_inv = A_inv * A = I
A_inv = inv(A) % compute inverse of matrix A
 
A * A_inv
A_inv * A

% positive integer powers are defined in a similar manner to scalar values
A^2 % 2nd power of matrix A
A * A
A^4
A^2 * A^2

% negative integer powers are powers of the inverse function
A_inv
A^-1 % inverse matrix of A
A^-3
(A^-1)^3

% zero-th power is the indentity matrix
A^0

% inverse matrix if and only if its determinant is non-zero; equivalent to
% the condition for scalars that only non-zero numbers have inverses
% matrices that have inverses are called invertible or non-singular
det(A)

% example of singular (non-invertible) matrix
B = [1 2 1
     2 4 2
     1 2 3]
 
det(B)
inv(B) % inverse not well defined for matrices with determinant equal to 0

%% solving lse
 
A = [  1 0 1
       2 3 1
      -1 1 3]
b = [3
     2
     3]

% solve LSE: A * x = b
x = inv(A) * b % avoid
x = A^-1 * b % avoid

x = A \ b % Gauss-Jordan Elimination
 
% b / A % leads to an error
 
A
B = rand(3, 3)

A \ B % equiv: A^-1 * B, but more efficient
B / A % equiv: B * A^-1, but more efficient
 
%% examples

% x(t) = x(t_0) + v * (t - t0)

t_0 = 1; % given
t_1 = 2; % we choose
t_2 = 3; % we choose

x_1 = 10; % measured
x_2 = 100; % measured

% unknowns: x_0, v
% 10  = x_1 = x_0 + v * (t_1 - t_0)
% 100 = x_2 = x_0 + v * (t_2 - t_0)

% coefficients matrix
A = [1 (t_1 - t_0)
     1 (t_2 - t_0)]
% free coefficients vector
b = [x_1
     x_2]

% solution -- NOTE: consistency of the order of unknowns
sol = A \ b
x_0 = sol(1)
v = sol(2)

A * sol == b % check solution

%% example 2
% f(t) = A * cos(phi + omega * t) = A * cos(omega * t) * cos(phi) - A * sin(omega * t) * sin(phi)
 
A = 1; % given
omega = 0.5; % given
phi = pi / 4; % unknown -- need to recover

t1 = 1 % we choose
t2 = 2 % we choose
f1 = A * cos(phi + omega * t1) % measured
f2 = A * cos(phi + omega * t2) % measured

% unknowns: x1 = cos(phi), x2 = sin(phi)
% f1 = A * cos(omega * t1) * x1 - A * sin(omega * t1) * x2
% f2 = A * cos(omega * t2) * x1 - A * sin(omega * t2) * x2
% solve: M * x = b
M = [ A * cos(omega * t1), - A * sin(omega * t1)
      A * cos(omega * t2), - A * sin(omega * t2)]
b = [f1
     f2]
sol = M \ b

% solution
phi_sol1 = acos(sol(1))
phi_sol2 = asin(sol(2))
phi

% check solution
abs(phi_sol1 - phi_sol2) < 1e-15
abs(phi_sol1 - phi) < 1e-15
