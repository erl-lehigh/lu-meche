clear
clc

example(10)
example(-pi)
example(0)

% simple if statement
x = 2;
if x > 1
    b = 0
end

% if-else statement
x = 0;
if x > 1
    c = 1
else
    c = 2
end
d = 1

% if-elseif statement
if x > 1
    d = 1;
elseif x > 2
    d = 4;
elseif x > 3
    d = 7;
elseif x > 9
    d = 1;
end
 
% if-elseif-else statement
x = 4;
if x > 1
    g = 1;
elseif x > 2
    g = 2;
else
    g = 3;
end
 
k = 2; % can only take values 1, 2, 3
if k == 1
    h = 0;
elseif k == 2
    h = 99;
else % k == 3
    h = -78;
end

q = 3; % q is in the interval [1, 5]
if q >= 1 & q <= 3
    v = 0;
elseif q > 3 & q <= 4
    v = 1;
else % q > 4 & q <= 5
    v = 2;
end

q = 3; % q is in the interval [1, 5]
if q <= 3
    v = 0;
elseif q <= 4 % q > 3
    v = 1;
else % q > 4 & q <= 5
    v = 2;
end

% complex conditions
a = 0;
b = 1;
c = 0;
if (a == 1 & c > 1) | (~(b <=7 & a > 1))
    w = 0;
end

% conditions involving vectors
a = [2, 3, 4];
b = [1, 3, 4];
if all(a == b)
    t = 23;
else
    t = 32;
end
t
 
if any(a == b)
    r = 23;
else
    r = 32;
end
r
 
% conditions involving vectors
a = [2, 3, 4; 4, 5, 1];
b = [1, 3, 4; 4, 5, 1];
if all(a == b, 'all')
    t = 23;
else
    t = 32;
end
t

if any(a == b, 'all')
    r = 23;
else
    r = 32;
end
r

% conditions involving array type: scalar, vector (row, column), matrix
a = reshape((1:4)', [2, 2]);
if isscalar(a)
    m = 0;
elseif isvector(a)
    m = 1;
    if isrow(a)
        n = 1;
    elseif iscolumn(a)
        n = 2;
    end
elseif ismatrix(a);
    m = 2;
end
m
if isvector(a)
  n
end


% for loops

% sum of first N values
S = 0;
N = 9;
for i = 1:N
    S = S + i;
end
S

% equivalent statements to the for loop
S = 0;
i = 1
S = S + i;
i = 2
S = S + i;
i = 3
S = S + i;
% ...

% sum of first N values iterated from N to 1
S = 0;
N = 9;
for i = N:-1:1
    S = S + i;
end
S

% sum of values in a vector
S = 0;
for i = [2, 55, 2, 6, 9, -2, 2]
    S = S + i;
end
S

% sum of values in a vector divisible by 2
x = [5, 6, 8, 1, 5, 5, 2, 5, 4, 8, 1];
S_even = 0;
for a = x
    if rem(a, 2) == 0
        S_even = S_even + a;
    end
end
S_even

% sum of values times their index for all values in a vector divisible by 2
S_even = 0;
for k = 1:length(x)
    if rem(x(k), 2) == 0
        S_even = S_even + x(k) * k;
    end
end
S_even
 
% matrix construction - nested for loop

% loop row-by-row
N = 5;
M = 6;
A = zeros(N, M); % pre-allocation
for i = 1:N % row-wise
    for j = 1:M
        if rem(i, 2) == 0 & rem(j, 3) == 1
            A(i, j) = 1;
        end
    end
end
A

% loop column-by-column
N = 5;
M = 6;
A = zeros(N, M); % pre-allocation
for j = 1:M % col-wise
    for i = 1:N 
        if rem(i, 2) == 0 & rem(j, 3) == 1
            A(i, j) = 1;
        end
    end
end
A

% change of condition in the if statement
N = 5;
M = 6;
A = zeros(N, M); % pre-allocation
for i = 1:N
    for j = 1:M
        if rem(i, 2) == 0 | rem(j, 3) == 1
            A(i, j) = 1;
        end
    end
end
A


% looping over matrix row and columns
A = [1, 2
     2, 3
     3, 4]

% loop over columns
for a = A
    a
end

% loop over rows
for a = A'
    a
end


%% local functions

function y = example(x)
% sign function - scalar input
if x > 0
    y = 1;
elseif x < 0
    y = -1;
else
    y = 0;
end
end