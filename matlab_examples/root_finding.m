clear
clc

% function
func = @(x) x.^2 - 1;
dfunc = @(x) 2 * x;

% plot function
x_range = -2:0.1:2
figure(1)
plot(x_range, func(x_range), 'b-')
hold on
plot(x_range, 0 * x_range, 'g--')
hold off


[x_root, no_iter] = root_bisection(func, 0.3, 2, 1e-3)
[x_root, no_iter] = root_bisection(func, 0.3, 1, 1e-3)
[x_root, no_iter] = root_bisection(func, 1, 2, 1e-3)
[x_root, no_iter] = root_bisection(func, -2, -0.3, 1e-3)
% [x_root, no_iter] = root_bisection(func, -2, 2, 1e-3) % assertion error

[x_root, no_iter] = root_newton(func, dfunc, 2, 1e-3)
[x_root, no_iter] = root_newton(func, dfunc, 0.2, 1e-3)
[x_root, no_iter] = root_newton(func, dfunc, -0.2, 1e-3)
[x_root, no_iter] = root_newton(func, dfunc, -2, 1e-3)
[x_root, no_iter] = root_newton(func, dfunc, 0, 1e-3)


[x_root, no_iter] = root_secant(func, 0.2, 2, 1e-3)
[x_root, no_iter] = root_secant(func, -0.2, 2, 1e-3)
[x_root, no_iter] = root_secant(func, 2, 0.2, 1e-3)
[x_root, no_iter] = root_secant(func, -0.2, -2, 1e-3)
[x_root, no_iter] = root_secant(func, 2, 2, 1e-3)

% use Matlab function to find roots - fzero
x_root = fzero(func, 0.4)

%% bisection method

function [x_root, no_iter] = root_bisection(f, a, b, epsilon)
  x_left = a; % lower bound of interval
  x_right = b; % upper bound of interval
  f_left = f(x_left); % function value at lower bound
  f_right = f(x_right); % function value at upper bound
  
  assert(f_left * f_right <= 0) % initially interval isolates a root

  % corner cases: root is on the boundary of the interval
  no_iter = 0;
  if f_left == 0
      x_root = a;
      return
  elseif f_right == 0
      x_root = b;
      return
  end

  % root is in the interior of the interval
  f_middle = epsilon + 1; % initialize f_middle
  while abs(f_middle) > epsilon
      assert(f_left * f_right < 0) % interval isolates a root
      x_middle = (x_left + x_right) / 2;
      f_middle = f(x_middle);
      % update interval that isolates the root
      if f_left * f_middle < 0 % root in left sub-interval
          x_right = x_middle;
          f_right = f_middle;
      elseif f_right * f_middle < 0 % root in right sub-interval
          x_left = x_middle;
          f_left = f_middle;
      end
      no_iter = no_iter + 1;
  end
  x_root = x_middle;
end

%% Newton's method

function [x_root, no_iter] = root_newton(f, df, x_0, epsilon)
    x_root = x_0; % set root to initial guess
    f_root = f(x_root);
    no_iter = 0;
    
    while abs(f_root) > epsilon
        df_root = df(x_root);
        % check that derivative value is not too small
        if abs(df_root) < 1e-5
            df_root = 1e-5;
        end
        % update root approximation and value of function
        x_root = x_root - f_root / df_root;
        f_root = f(x_root);
        no_iter = no_iter + 1;
    end
end

%% Secant's method

function [x_root, no_iter] = root_secant(f, x_0, x_1, epsilon)
    x_prev = x_0; % previous root estimate
    x_curr = x_1; % current root estimate
    f_prev = f(x_prev);
    f_curr = f(x_curr);
    no_iter = 0;
    
    while abs(f_curr) > epsilon
        % check that root estimates are not too close
        if abs(x_curr - x_prev) < 1e-5
            df_curr = 1e-5;
        else
            df_curr = (f_curr - f_prev) / (x_curr - x_prev);
            % check that slope of secant line is not too small
            if abs(df_curr) < 1e-5
                df_curr = 1e-5;
            end
        end
        x_next = x_curr - f_curr / df_curr;
        % update x and f(x) for current and previous iteration values
        x_prev = x_curr;
        f_prev = f_curr;
        x_curr = x_next;
        f_curr = f(x_curr);
        no_iter = no_iter + 1;
    end
    x_root =x_curr;
end
