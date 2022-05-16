clear
clc

rng(1001)

N = 5;
x = cumsum(rand(N, 1)) % independent variable
y = sin(2 * x) + 2 * exp(-0.5 * x) % dependent variable

figure(1)
plot(x, y, 'bo')
hold on
plot(x, y, 'k-')
grid
hold off

%% zero-order spline interpolation
x_min = min(x);
x_max = max(x);
x_query = x_min + rand() * (x_max - x_min)

index = find(x <= x_query, 1, 'last')
y_pred = y(index)

hold on
plot(x_query, y_pred, 'Dr')
stairs(x, y, 'm--')
hold off

%% linear interpolation

y_pred_lin = interp1(x, y, x_query)

hold on
plot(x_query, y_pred_lin, 'ms')
hold off

index = find(x <= x_query, 1, 'last')

m = (y(index+1) - y(index)) / (x(index+1) - x(index));
n = y(index) - m * x(index);
 
y_pred_lin2 = m * x_query + n
 
hold on
plot(x_query, y_pred_lin, 'y^')
hold off

% multiple queries
x_min = min(x);
x_max = max(x);
x_query_vector = x_min + rand(3, 1) * (x_max - x_min)

y_pred_lin_vec = interp1(x, y, x_query_vector)

hold on
plot(x_query_vector, y_pred_lin_vec, 'kx')
hold off

%% natural cubic spline interpolation

x_range = x_min:0.01:x_max;
y_curve = spline(x, y, x_range);
y_pred_spline = spline(x, y, x_query)

hold on
plot(x_range, y_curve, 'r--')
plot(x_query, y_pred_spline, 'bv')
hold off

%% interpolation of 2D curves

N = 4;
t = [0 1 2 3 4]
x = [cumsum(rand(1, N)), 1]
y = [cumsum(rand(1, N)), 1.6]

plot(x, y, 'ko-')

t_query = 1.25
point = interp1(t, [x; y]', t_query)
 
hold on
plot(point(1), point(2), 'bD')
hold off

t_query = 1.5
x_point = interp1(t, x, t_query)
y_point = interp1(t, y, t_query)
 
hold on
plot(x_point, y_point, 'bs')
hold off

t_query = 1.5
x_point = spline(t, x, t_query)
y_point = spline(t, y, t_query)

t_range = 0:0.01:4;
x_range = spline(t, x, t_range);
y_range = spline(t, y, t_range);

hold on
plot(x_range, y_range, 'r--')
plot(x_point, y_point, 'g^')
hold off

