clear
clc

%% Case1:store all elements of the sequence
N = 6;
seq1 = zeros(1, N);
seq1(1) = 1; % initial element of the sequence
for k = 2:N
    seq1(k) = seq1(k-1) + 1;
end
seq1

%% Case2: only last element
N = 6;
elem1 = 1; % initial element of the sequence
for k = 2:N
    elem1 = elem1 + 1;
end
elem1

%% computing square root of a
% x_1 = 1
% x_n = 0.5 *(x_n-1 + a/x_n-1)
N = 6;
a = 2;

x = zeros(1, N);
x(1) = 1; % initial element of the sequence
for k = 2:N
    x(k) = 0.5 * (x(k-1) + a / x(k-1));
end
x

sq_a = 1; % initial element of the sequence
for k = 2:N
    sq_a = 0.5 * (sq_a + a / sq_a);
end
sq_a

sq_a = 1;
k=2
sq_a = 0.5 * (sq_a + a / sq_a);
k=3
sq_a = 0.5 * (sq_a + a / sq_a);
k=4
sq_a = 0.5 * (sq_a + a / sq_a);
k=5
sq_a = 0.5 * (sq_a + a / sq_a);
k=6
sq_a = 0.5 * (sq_a + a / sq_a);

%% Fibonacci numbers
% F_n = F_n-1 + F_n-2
% F_1 = 1, F_2 = 1

N = 6;
fib = zeros(1, N);
fib(1) = 1; % initial element of the sequence
fib(2) = 1; % initial element of the sequence
for k = 3:N
    fib(k) = fib(k-1) + fib(k-2);
end
fib


N = 6;
fib_n1 = 1; % initial element of the sequence
fib_n2 = 1; % initial element of the sequence
for k = 3:N
    fib_next = fib_n1 + fib_n2;
    fib_n2 = fib_n1;
    fib_n1 = fib_next;
end
fib_next

N = 6;
fib_n1 = 1; % initial element of the sequence
fib_n2 = 1; % initial element of the sequence
% loop for k=3
k=3
fib_next = fib_n1 + fib_n2;
fib_n2 = fib_n1;
fib_n1 = fib_next;
% loop for k=4
k=4
fib_next = fib_n1 + fib_n2;
fib_n2 = fib_n1;
fib_n1 = fib_next;
% loop for k=5
k=4
fib_next = fib_n1 + fib_n2;
fib_n2 = fib_n1;
fib_n1 = fib_next;

%% exponential function
% x = pi
% a_n = x / n * a_n-1, a_0 = 1
% S_n = S_n-1 + a_n, S_0 = a_0

%a_0 = 1, a_1 = x / 1 * 1 = x, a_2 = x / 2 x  = x^2 / 2, ...

N = 6;
x = 0.5;
a_seq = zeros(1, N+1);
exp_seq = zeros(1, N+1);
a_seq(1) = 1;
exp_seq(1) = a_seq(1); % initial element of the sequence
for k = 2:N+1
    a_seq(k) = x / (k-1) * a_seq(k-1);
    exp_seq(k) = exp_seq(k-1) + a_seq(k);
end
a_seq
exp_seq
%%
N = 6;
x = 0.5;
a_seq = zeros(1, N+1);
exp_seq = zeros(1, N+1);
a_seq(1) = 1;
exp_seq(1) = a_seq(1); % initial element of the sequence
for k = 1:N
    a_seq(k+1) = x / k * a_seq(k);
    exp_seq(k+1) = exp_seq(k) + a_seq(k+1);
end
a_seq
exp_seq

%% while
a = 2;
x = 1; % initial element of the sequence
error = 1;
terms  = [x];
while abs(error) > 0.001
    x_next = 0.5 * (x + a / x);
    error = x_next - x;
    x = x_next;
    terms = [terms x];
end
x
terms

a = 2;
x = 1; % initial element of the sequence
error = 1;
% 1st while loop
if abs(error) > 0.001
    x_next = 0.5 * (x + a / x);
    error = x_next - x;
    x = x_next;
end
% 2nd while loop
if abs(error) > 0.001
    x_next = 0.5 * (x + a / x);
    error = x_next - x;
    x = x_next;
end
% 3rd while loop
if abs(error) > 0.001
    x_next = 0.5 * (x + a / x);
    error = x_next - x;
    x = x_next;
end
%...

%% exponential function until convergence
% absolute error between consecutive sum terms is less than 10^-3

x = 1;
a_n = 1;
exp_n = a_n; % initial element of the sequence
error = 1;
k = 1;
while abs(error) > 0.001
    a_n = x / k * a_n;
    exp_n = exp_n + a_n;
    error = a_n;
    k = k + 1;
end
exp_n
exp(x)