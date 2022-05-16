clear
clc

%% numerical differentiation

% differentiation of a known function
f = @(x) x.^2 + 1;
% f = @sin;

x = 0:0.01:2;
h = 0.25; % differentiation step size

df_fw = df_forward(f, x, h)
df_bw = df_backward(f, x, h)
df_c = df_central(f, x, h)

figure(1)
plot(x, df_fw, 'b-')
hold on
plot(x, df_bw, 'g-')
plot(x, df_c, 'r-')
plot(x, 2 * x, 'k--')
% plot(x, cos(x), 'k--')
hold off

x = [0 1 -1];
h = [0.1 0.01 0.001]; % multiple step sizes - same length as vector x

df_fw = df_forward(f, x, h)
df_bw = df_backward(f, x, h)
df_c = df_central(f, x, h)

% differentiation when data is given

% generate data
x = 0:0.01:2;
fv = f(x);

df_fw = df_forward_data(x, fv)
df_bw = df_backward_data(x, fv)
df_c = df_central_data(x, fv)

%% numerical integration

% integration of a known function
f = @(x) x.^2 + 1;
% x^3 / 3 + x + C
% int_0^1 f(x) dx = 1/3 + 1 = 4/3

h = 0.1; % integration step size
int_f = int_trap(f, 0, 1, h)
int_f2 = integral(f, 0, 1) % integration using the Matlab function `integral`

% multiple dependent variables, one independent variable
f_array = @(x) [sin(x)
                cos(x)];
int_f_array = integral(f_array, 0, pi/2, 'ArrayValued', true)

% integration when data is given

% generate data
x = 0:0.1:1;
fv = f(x);

int_f3 = int_trap_data(x, fv)

%% Polynomials - integration and differentiation can be done exactly and more
%% efficiently

% polynomial: x^5 - 2 x^3 + x + 5
p = [3 0 -2 0 1 5];

% polynomial differentiation
p_der = polyder(p)

% polynomial integration over [a, b]
p_anti_der = polyint(p)
a = -1;
b = 1;
p_int = polyval(p_anti_der, b) - polyval(p_anti_der, a)


%% Functions

% forward method
function df_x = df_forward(f, x, h)
  df_x = (f(x + h) - f(x)) ./ h;
end

function df_x = df_forward_data(x, fv)
  assert(all(size(x) == size(fv)));
  df_x = zeros(size(x));
  df_x(1:end-1) = (fv(2:end) - fv(1:end-1)) ./ (x(2:end) - x(1:end-1));
  df_x(end) = df_x(end-1);
end

% backward method
function df_x = df_backward(f, x, h)
  df_x = (f(x) - f(x-h)) ./ h;
end

function df_x = df_backward_data(x, fv)
  assert(all(size(x) == size(fv)));
  df_x = zeros(size(x));
  df_x(2:end) = (fv(2:end) - fv(1:end-1)) ./ (x(2:end) - x(1:end-1));
  df_x(1) = df_x(2);
end

% central method
function df_x = df_central(f, x, h)
  df_x = (f(x + h) - f(x - h)) ./ (2 * h);
end

function df_x = df_central_data(x, fv)
  assert(all(size(x) == size(fv)));
  df_x = zeros(size(x));
  df_x(2:end-1) = (fv(3:end) - fv(1:end-2)) ./ (x(3:end) - x(1:end-2));
  df_x(1) = (fv(2) - fv(1)) / (x(2) - x(1));
  df_x(end) = (fv(end) - fv(end-1)) / (x(end) - x(end-1));
end


function int_f = int_trap(f, a, b, h)
   x = a:h:b;
   fv = f(x);
   int_f = h * sum( (fv(1:end-1) + fv(2:end) )) / 2;
end

function int_f = int_trap_data(x, fv)
   assert(all(size(x) == size(fv)));
   h = x(2:end) - x(1:end-1);
   int_f = sum(h .* (fv(1:end-1) + fv(2:end) )) / 2;
end
