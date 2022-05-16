%% Contents: Arrays (no matrix-math ops)
% 1) Construction: direct, block methods, grid methods, Matlab functions
% 2) Operations (element-wise): arithmetic, comparison, functions, logical
% 3) Indexing and Slicing (vectors/matrices): single element access,
%     range/slicing, index/selector vector, masked access
% 4) Size and Shape: length, size, numel, isscalar, isvector, ismatrix, isrow,
%     iscolumn
% 5) Rearranging and reshapeing: transpose, sort, flip, reshape
% 6) Aggregate functions: statistical (min, max, mean, median, sum, prod, std,
%     var, cumsum), and logial (all, any)
% 7) Matlab `find` function

%%

% General commands
% everything on a line after the '%' symbols is a comment and ignored by Matlab
% in terms of execution. Think of the text being removed, and then what remains
% is code/commands to execute.


a = 1; % definition of a scalar (one value) variable with name 'a'; you can see
       % it in the workspace.
b = 1; % ';' at the end means that the output is suppresed, i.e., it is not
       % displayed in the command window
clear % removes all variables from workspace

a = 1;
b = 1;
c = 2;
clear a b % removes only variables with names 'a' and 'b'
clear a   % Matlab does not throw an error when clearing a non-existent variable

class(c)  % type of variable - by default all are double -- representation
          % for real numbers on a computer
          % types:
          % - signed integer types: int8, int16, int32, int64
          % - unsigned integer types: uint8, uint16, uint32, uint64
          % - real types: single (32 bits), double (64 bits)

clear
% 1) Construction methods

% "direct" method
a = [ 1 2 3]   % row vector - space as separator of values
a = [1    2 3] % extra spaces are ignore in all expressions


b = [1, 2, 3] % row vector - comma as separator of values

c = [1; 2; 3] % column vector - semicolon as separator of values
              % think of ';' as indicating the end of the row
c = [1  % column vector - each value on a new line
     2
     3]

A = [1 2 3
     2 3 4
     5 1 0] %  3 by 3 matrix - 3 row, 3 cols
A = [1 2 3; 2 3 4; 5 1 0] % same matrix defined using ';' (end of row)

% block method
B1 = [1 2; 3 4; 4 5]
B2 = [5 6 7; 7 8 9; 8 9 0]
B3 = [0 1 2 3 4]
B4 = [1; 2; 3; 4; 5; 6; 7]

B = [B1 B2];

B = [B1 B2; B3];
B = [B1 B2
     B3];
B = [B1 B2; B3; B2 B1];

B4
B = [[B1 B2; B3; B2 B1] B4]
% B = [B1 B2; B3; B2 B1 B4]
B = [B1 B2; B3; B2 B1];
B = [B B4]

% B = [B1 B2; B3; B2 B1]
% B = [B B4]
% B = [[B1 B2; B3; B2 B1] B4]

% construction using Matlab functions
A = zeros(3)
B = zeros(3, 2)
B = zeros(1, 3)
B = zeros(3, 1)

A = ones(3)
B = ones(3, 2)
B = ones(1, 3)
B = ones(3, 1)

A = eye(3)
B = eye(3, 2)
B = eye(2, 4)
B = eye(1, 3)
B = eye(3, 1)

A = diag([1 2 3 4])
A = diag([1 2 3 4], 1)
A = diag([1 2 3 4], -1)
A = diag([1 2 3 4], 2)
A = diag([1 2 3 4], -2)

B = [1 2 3
     2 3 4
     4 6 9]
v = diag(B)
C = diag(v)
C = diag(diag(B))

% grid methods

% defined by the bounds and step size - bounds may not be in the vector
v1 = 1:10
v2 = -2:3
v3 = -1.1:4.5
v4 = 1:2:10
v5 = -3:-1:-10
v6 = 0:pi/2:4*pi
v7 = 0:-pi/2:-4*pi
v_1 = 1:-1:3 % empty row vector
v_2 = 1:-1 % empty row vector
v_3 = 1:2:2 % vector with one element

% defined by the bounds and number of elements - bounds are always in the vector
v8 = linspace(0, 3, 5)
v9 = linspace(0, -3, 5)
v10 = linspace(8, 3, 5)

% block diag
A1 = ones(3, 2)
A2 = 2*ones(2, 3)
A3 = 3*ones(2, 2)
A = blkdiag(A1, A2, A3)

% repmat - tilling; repeating a block

A = [1 2 3
     3 4 5]
B = repmat(A, 3, 4) % a 3 x 4 block matrix where each block is matrix A

v = [-1 2 1 0] % works with vectors as well (either row or column)
B = repmat(v, 4, 2) % a 3 x 4 block matrix where each block is matrix v

% 2) Operations (element-wise)  -- arithmetic +, -, .*, ./, .^
v1 = 1:7
v2 = 7:-1:1
v1 + v2
v1 - v2
v3 = [1;2;3;4;5;6;7]
v1 - v3 % not recommended

A1 = [1 2 3
      3 4 5]
A2 = [3 4 5
      1 2 3]
A1 + A2
A1 - A2

v1 .* v2
v1 ./ v2
v1 .^ v2
A1 .* A2
A1 ./ A2
A1 .^ A2

% operations with scalars (element-wise)
A1.^2 % the '.' is required before the '^' (power) operation
v1.^pi % the '.' is required before the '^' (power) operation

2 * A1 % the '.' is not required before the '*' (product) operation
A1 * 2 % the '.' is not required before the '*' (product) operation
2 * v1 % the '.' is not required before the '*' (product) operation
v1 * 2 % the '.' is not required before the '*' (product) operation

2 + A1 % equiv to: 2*ones(size(A1)) + A1 % Matlab shorthand
2 + v1 % equiv to: 2*ones(size(v1)) + v1 % Matlab shorthand

% comparison operations (element-wise)
A1 == A2
A1 ~= A2
A1 <= A2
A1 < A2
A1 >= A2
A1 > A2

% Matlab functions (element-wise)
% - common: abs, sqrt, sign
% - exponential and logarithms: exp, log, log10,
% - trigonometric: sin, cos, tan, cot, asin, acos,
% - inverse trigonometric: atan, acot, atan2
% - rounding: round, floor, ceil
% - integer arithmetic: idivide, rem

exp(A1)
sin(A1)
round(sin(A1), 2)
ceil(exp(A1))

% Logical operations (element-wise)
(A1 ~= A2) & (A1 <= A2) & (A1 > A2) % Logical and
(A1 ~= A2) | (A1 <= A2) | (A1 + A1 <= A2)% Logical or
~(A1 ~= A2) % Logical negation


% Indexing and slicing

% vector case
x = [1, 3, 5, 8, 9, 1, 2, 1, 3]
x(1)
x(5) * x(2) - x(6)
x(3) = x(5) * x(2) - x(6)
x(end)
x(end-1)
x(end-2)
x(floor(end/2))
% x(1.1) % error
% idx = [1 end] %error

% Slicing
x
2:6
x(2:6)
x(1:2:7)
x(7:-2:1)
x(2:end)
x(2:end-1)
x(end-2:-1:2)

(x(2:end) - x(1:end-1) .* x(1:end-1)) == x(2:end)
% (x(2:end) - x(1:end-1) .* x(2:end-1)) == x(2:end) % error
x(2:end) = (x(2:end) - x(1:end-1) .* x(1:end-1))


x = [1, 3, 5, 8, 9, 1, 2, 1, 3]
x(1:3) = [6, 4, 0]
x(4:2:8) = [-1, -2, -3]

% access by selection vector or index vector
indices = [3, 2, 1, 2, 4, 1, 3, 2]
indices2 = [1, 2, 5, 2, 5, 1, 6, 2]
x
x(indices)
a = x(indices) .* x(indices2)

indices3 = 8:-1:1
x(indices3) = a

% avoid this at all cost!!! -- repeated assignment to the same element
% indices4 = [1 2 1]
% x(indices4) = [2 3 4]

% masked access
x = [-2:2, -1:1, 4:6]
mask = x >= 0
x(mask) = exp(x(mask))

x = [-2:2, -1:1, 4:6]
mask = (x >= 1) | (x <= -1)
x(mask) = -4

x = [-2:2, -1:1, 4:6]
mask = (x <= 1) & (x >=-1)
x(mask) = -4

mask = ~mask
x(mask) = -3

% matrix case
A = [2 3 4
     5 6 7]

A(2, 1)
A(2, 3)
A(2, 3) = A(1, 1) - 3
A(end, 1)
A(end-1, end-1) % first end is #rows, second end is #cols

% slicing
A = [1:5
     6:10
     11:15
     16:20]

A(2, :) % 2nd row vector
A(:, 2) % 2nd column vector
A(2, 2:4)
A(2:3, 2)
A(2, 2:end)  % row 2 from 2nd to last cols
A(2, 2:2:end)
A(2:end, 2)  % col 2 from 2nd to last rows

A
A(2:4, 2:4)
A(4:-1:2, 2:4)

A(end, :) % last row
A(:, end) % last column
A(:, end-1) % second to last column

A(2:end-1, 2:end-1)

% access by selection/index vectors

idx1 = [3, 2, 1, 2]
idx2 = [2, 1, 2]
A(idx1, :)
A(idx1, 3:5)
A(:, idx2)
A(1:2:end, idx2)
A(idx1, idx2)

% masked acess
A
mask = (A <= 8) & (A >= 3)
A(mask) = sin(A(mask))

mask = ~mask
A(mask) = -2

A = [1:5
     6:10
     11:15
     16:20]

B = A(2:4, 1:3) % creates a copy of the sub-matrix of A
B(1, 1) = -1
B
A

% Rearrange, Reshape

A = [1:5
     6:10
     11:15
     16:20]

% transpose
transpose(A)
A'

v = 1:10 % row vector
v' % column vector

% sorting
v = [4 0 -1 9 7 4 5 9 0 -2 -1 -3 -1 0]
w_inc = sort(v)
v
w_inc = sort(v, 'ascend')

w_dec = sort(v, 'descend')

[w_inc, re_index] = sort(v)

Q = [3  1  0 -1
     9  0  5 -2
     0 -4  1  2
     8  7 -5  9
     1  3  2  1]
sort(Q) % sort each column
sort(Q, 1) % sort each column
sort(Q, 2) % sort each row
sort(Q, 1, 'descend') % sort each column

sort(Q')' % sorting rows using transpose

% re-arraging rows and columns

A
fliplr(A)

eye(5)
fliplr(eye(5)) % creates anti-diagonal matrix
               % all elements on anti-diagonal are 1

v = [1 3 1 5];
fliplr(diag(v)); % create anti-diagonal matrix with elements from vector v

A
flipud(A)
fliplr(A')' % same as flipud(A)

% reshaping vectors, matrices

v = -pi:0.1:pi
length(v) % length of a vector
length(v) == length(v') % length works the same for row and col vectors

A
size(A) % result is a vector: [#rows, #cols]
size(A, 1) % #rows
size(A, 2) % #cols

size(v) %  = [1 length(v)] % row vector
size(v') %  = [length(v) 1] % column vector

numel(v) % number of elements == length(v) for vectors
numel(A) % #rows x #cols of A

v
ones(size(v))  % creates vector of ones with the same size as v (either
               % row or col)
v = v'
ones(size(v))

isscalar(0.4)
isscalar(v)
isscalar(A)
% isvector, ismatrix, isrow, iscolumn - try them out


A
reshape(A, [2, 10]) % total number of elements must match
numel(A) == numel(reshape(A, [2, 10]))
reshape(A, [5, 4])

reshape(A, [1, numel(A)])  % create a row vector from matrix A -- fill column-wise
reshape(A, [numel(A), 1])  % create a col vector from matrix A -- fill column-wise

reshape(A', [1, numel(A)])  % create a row vector from matrix A -- fill row-wise
reshape(A', [numel(A), 1])  % create a col vector from matrix A -- fill row-wise

v = 1:30
reshape(v, [2 15]) % creating matrix from a vector -- fill column-wise
reshape(v', [2 15]) % creating matrix from a vector -- fill column-wise
B = reshape(v, [6 5]) % -- fill column-wise

reshape(v, [6 5])'
C = reshape(v, [5 6])' % -- fill row-wise

reshape(A', [4 5])' % fill row-wise

% Stat functions

% mean (similar: median, sum, prod)
v = 1:20
mean(v)
A
mean(A) % result: row vector of column means
mean(A, 1) % result: row vector of column means
mean(A, 2) % result: col vector of row means
mean(A, 'all')

% min (similar: max)
v
min(v)
[min_value, min_index] = min(v)
[min_value, min_index] = min([v 1])
A
min(A) % result: row vector of column min
min(A, [], 1) % result: row vector of column min
min(A, [], 2) % result: col vector of row min
min(A, [], 'all')

w = 4 - v;
min(v, w) % element-wise minimum operation
min(A, 5 - A) % element-wise minimum operation

% std (similar: var)

std(v)

A
std(A) % result: row vector of column std values
std(A, 0, 2) % result: column vector of row std value
std(A')'

% cumsum

v
cumsum(v) % cummulative sum of value from in vector v
          % sums from first element up to k-th element, where k goes from 1 to
          % the length of v

% logical aggregation operations

% remember: in Matlab 0 is considered false, non-zero values are considered true

all([0 1 1 0 1])
all([2 1 1 2 1])
all([1 1 1 1 1])
all(v == 2) % most common use case
all(v >= 2 & v <= 5) % most common use case

any([0 1 1 0 1])
any([0 0 0 0])
any([0 0 0 0 1])
any(v == 3) % most common use case
any(v >= 3 | v <= 4) % most common use case

all(floor(A /2) == 1) % column-wise
all(floor(A /2) == 1, 1) % column-wise
all(floor(A /2) == 1, 2) % row-wise
all(rem(A, 2) == 1, 'all')  % over all elements in the matrix

% finding elements in vectors
find(v == 10) % indices of all non-zero elements in (v == 10)
find(v <= 10) % indices of all non-zero elements in (v <= 10)
find(v <= 10 & v > 2) % indices of all non-zero elements in (v <= 10 & v > 2)
find(v <= 10 & v > 2, 3) % indices of first three non-zero elements
find(v <= 10 & v > 2, 3, 'last') % indices of last three non-zero elements
find(v <= 10 & v > 2, 1) % index of first non-zero element in (v <= 10 & v > 2)
                         % equiv., index of first element in v that satisfies
                         % the condition
                         % most common use case
find(v <= 10 & v > 2, 1, 'last') % index of last non-zero element in vector
                                 % (v <= 10 & v > 2)
                                 % equiv., index of last element in v that
                                 % satisfies the condition
                                 % most common use case
