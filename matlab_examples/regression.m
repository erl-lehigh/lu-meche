%% generate data
clear
clc

rng(1001)
x = -10:0.1:10; % independent variable
% y - dependent variable
y = 0.0004 * x.^5 + 0.1 * x.^2 - 2 * x + 3 + 10 * rand(size(x));

% plot data
figure(1)
plot(x, y, 'ko')

%% Linear regression

% matlab functions: polyfit, polyval
% linear regression equiv. to polynomial model of degree 1
poly1 = polyfit(x, y, 1)

y_pred = polyval(poly1, x)

% random, out-of-data query within range of data
% (i.e., range of independent variable x)
x_query = -10 + 20 * rand()
% prediction of the dependent variable for the query
y_query_pred = polyval(poly1, x_query)

hold on
plot(x, y_pred, 'b-') % plot linear model
% plot query point; on the regression line
plot(x_query, y_query_pred, 'rD')
% plot (mean_x, mean_y) point; on the regression line
plot(mean(x), mean(y), 'rs')
hold off

% prediction error: desired/given minus predicted values for dependent
% variable
error = y - y_pred
% mean square error
mse_poly1 = mean(error .^ 2)
% mean absolute error
mae_poly1 = mean(abs(error))

% correlation coefficient
r = corrcoef(x, y)
r = r(1, 2)
r2 = r^2

%% Polynomial regression

deg3 = 3;
poly3 = polyfit(x, y, deg3);
y_pred3 = polyval(poly3, x);

deg4 = 4;
poly4 = polyfit(x, y, deg4);
y_pred4 = polyval(poly4, x);

deg5 = 5;
poly5 = polyfit(x, y, deg5);
y_pred5 = polyval(poly5, x);

deg_overfit = 10;
poly_overfit = polyfit(x, y, deg_overfit);
y_pred_overfit = polyval(poly_overfit, x);


% plot regression polynomial curves
hold on
plot(x, y_pred3, 'g-')
plot(x, y_pred4, 'c-')
plot(x, y_pred5, 'm-')
plot(x, y_pred_overfit, 'r-', 'LineWidth', 2)
hold off

% compute MSE values
error3 = y - y_pred3;
mse_poly3 = mean(error3 .^ 2)
error4 = y - y_pred4;
mse_poly4 = mean(error4 .^ 2)
error5 = y - y_pred5;
mse_poly5 = mean(error5 .^ 2)

error_overfit = y - y_pred_overfit;
mse_poly_overfit = mean(error_overfit .^ 2)

%% General Regression

% use basis functions: e^x, e^(x+1), e^(x-1), e^(x+2), e^(x-2)
% function class: f(x) = a1 * e^x + a2 *  e^(x+1) + a3 *  e^(x-1) + a4 *  e^(x+2) + a5 *  e^(x-2)
% unknowns to compute -> coefficients a1, a2, a3, a4, a5

% evaluate basis functions at the given data points
% i.e., at the independent variable x
f1 = exp(x)';
f2 = exp(x+1)';
f3 = exp(x-1)';
f4 = exp(x+2)';
f5 = exp(x-2)';

% for matrix of data
M = [f1 f2 f3 f4 f5]

% compute coefficients using the Moore-Penrose pseudo-inverse matrix and the
% vector of values for the dependent variable
a_coeff = pinv(M) * y'

% compute prediction for given data points, i.e., stored in matrix M
y_pred_exp = M * a_coeff

% plot prediction curve
hold on
plot(x, y_pred_exp, 'r-')
hold off

% query model for new data point, i.e., x_query
x_query = -10 + 20 * rand()
% compute the values of the basis function at x_query
f_values = [exp(x_query) exp(x_query+1) exp(x_query-1) exp(x_query+2) exp(x_query-2)];
% compute predicted model (function) value y_query_pred
y_query_pred = f_values * a_coeff

% plot query point; the point must be on the prediction curve
hold on
plot(x_query, y_query_pred, 'mD')
hold off
