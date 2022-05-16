clear
clc

%% Euler's Method

%% scalar case - one dependent variable
f = @(x, y) -2 * y; % dynamics function - RHS of ODE
y0 = 10; % initial condition (for the dependent variable)
x_span = [0, 1]; % integration domain (independent variable)
h = 1e-1; % integration step size for Euler's method

[x, y] = ode_euler(f, x_span, y0, h); % solve ODE

figure(1)
plot(x, y, 'b-')
xlabel('x')
ylabel('y')
title("Euler's method")
grid on

%% mutiple dependent variables

% dynamics function - RHS of ODEs
f = @(x, y) [-0.2 * y(1) * y(2)
             -0.6 * (y(1) + y(2))];
% initial condition (for the two dependent variables)
y0 = [10
      15];
x_span = [0, 1]; % integration domain (independent variable)
h = 1e-2; % integration step size for Euler's method

[x, y] = ode_euler(f, x_span, y0, h); % solve ODEs

figure(2)
plot(x, y(1, :), 'b-')
hold on
plot(x, y(2, :), 'k-')
hold off
xlabel('x')
ylabel('y1, y2')
title("Euler's method")
grid on


%% ode45 - Matlab function

%% scalar case - one dependent variable
f = @(x, y) -2 * y; % dynamics function - RHS of ODE
y0 = 10; % initial condition (for the dependent variable)
x_span = [0, 1]; % integration domain (independent variable)

[x, y] = ode45(f, x_span, y0); % solve ODE

figure(3)
plot(x, y, 'r-')
xlabel('x')
ylabel('y')
title("ode45")
grid on

%% mutiple dependent variables
% dynamics function - RHS of ODEs
f = @(x, y) [-0.2 * y(1) * y(2)
             -0.6 * (y(1) + y(2))];
% initial condition (for the two dependent variables)
y0 = [10
      15];
x_span = [0, 1]; % integration domain (independent variable)

[x, y] = ode45(f, x_span, y0); % solve ODEs

figure(4)
plot(x, y(:, 1), 'b-')
hold on
plot(x, y(:, 2), 'k-')
hold off
xlabel('x')
ylabel('y1, y2')
title("ode45")
grid on

%% systems with inputs

% t (time) - independent variable
% y = [x; v] - dependent variables (position, velocity)
% u = [a] - input variable (acceleration)

% dynamics with inputs
f = @(t, y, u) [y(2)
                u];
% controller - proportional
v_ref = 1; % reference velocity
ctrl = @(t, y) 1.5 * (v_ref - y(2));

% closed loop dynamics
f_closed_loop = closed_loop(f, ctrl);

% initial conditions
y0 = [0   % initial position 
      2]; % initial velocity
t_span = [0, 4];

[t, y] = ode45(f_closed_loop, t_span, y0);

figure(5)
plot(t, y(:, 1), 'b-')
hold on
plot(t, y(:, 2), 'k-')
hold off
xlabel('t time')
ylabel('x, v')
grid on

%% system with inputs -- car model with proportional control
clear
clc

% independent variable: t (time [s])
% dependent variables: x, y (coordinates of position [m])
%                      theta (heading [rad])
%                      velocity (forward velocity [m/s])
%                      u_steer (steering input [rad/s])
%                      u_acc (acceleration input [m/s^2])

% dynamic model
% \dot{x} = v cos(theta)
% \dot{y} = v sin(theta)
% \dot{theta} = u_steer
% \dot{v} = u_acc
% state = [x, y, theta, v]
% u = [u_steer, u_acc]

% dynamics function - RHS of the ODE with inputs
dynamics = @(t, state, u) [state(4) * cos(state(3))
                           state(4) * sin(state(3))
                           u(1)
                           u(2)];

% controller for steering and velocity
% error = [theta_ref - theta, v_ref - v]
% PID: u(t, state) = Kp * error, Kp is a 2x2 diagonal matrix

Kp = diag([1, 0.75]); % proportional gain
theta_ref = pi / 2; % reference steering
v_ref = 1; % reference velocity
% controller function
controller = @(t, state) Kp * [theta_ref - state(3)
                               v_ref - state(4)];

% closed loop dynamics
f_closed_loop = closed_loop(dynamics, controller);

% initial conditions
state0 = [0   % initial position at origin (0, 0)
          0   % 
          0   % initial orientation - in the direction of the x axis
          0.5]; % initial velocity

t_span = [0, 5]; % integration time domain

[t, state] = ode45(f_closed_loop, t_span, state0);

figure(6)

state_names = {'x [m]', 'y [m]', 'theta [rad]', 'v [m/s]'};

figure(6)
for i=1:4
    subplot(4, 1, i)
    plot(t, state(:, i), 'b-')
    xlabel('t (time) [s]')
    ylabel(state_names{i})
    grid on
end
subplot(4, 1, 3)
hold on
yline(theta_ref, 'g--', 'LineWidth', 1.2)
hold off

subplot(4, 1, 4)
hold on
yline(v_ref, 'g--', 'LineWidth', 1.2)
hold off

figure(7)
x = state(:, 1);
y = state(:, 2);
axis equal
plot(x, y, 'k-', 'LineWidth', 1.5)
grid on

hold on
skip = 5;
x = state(1:skip:end, 1);
y = state(1:skip:end, 2);
theta = state(1:skip:end, 3);
v = state(1:skip:end, 4);
alpha = 0.25;

quiver(x, y, alpha * v .* cos(theta), alpha * v .* sin(theta), ...
       'off', 'b', 'marker', '.', 'LineWidth', 1.5, 'MarkerSize', 12);
hold off

%% Functions

function [x, y] = ode_euler(f, x_interval, y0, integration_step)
  x0 = x_interval(1);
  x1 = x_interval(2);
  h = integration_step;
  
  % initialization
  N = ceil((x1 - x0) / h); % number of integration steps
  y = zeros(length(y0), N+1); % pre-allocated the data structure holding
                              % the solution
  y(:, 1) = y0; % set initial conditions
  x = x0 + h * (0:N); % computing values of the independent variable
  
  for k = 1:N
    y(:, k+1) = y(:, k) + h * f(x(k), y(:, k));
  end
end

function f_closed_loop = closed_loop(f, controller)
  f_closed_loop = @(t, y) f(t, y, controller(t, y));
end
