clear
clc

%% line plots
y = [1 3 6 0 1 -1 1];
plot(y)

%% function y vs x
% independent variable (x) should be sorted when plotting functions
x = 1:0.2:10;
y = x.^2 / 5;
plot(x, y) % plot commands overwrite the previous ones by default

%% under approximation -- function
x = 1:3:10;
y = x.^2 / 5;
plot(x, y)

%% piecewise-linear curve
x = [1 0 -1 -0.5];
y = [0 -1 -1 -0.5];
plot(x, y)

%% scatter plots
plot(x, y, 'o')
plot(x, y, 'd')

%% line and marker plots
plot(x, y, 'k--s')

help plot % lists style shorthands

%% multiple plots in the same axis
clear
clc

x = 0:0.2:2;
y = x.^2 + 1;
u = -1:0.3:1;
v = sin(u) + cos(u);

plot(x, y, u, v)

%% multiple plots in the same axis with line/marker styles
plot(x, y, 'b-d', u, v, 'r--^')

%% equivalent to previous plot command
plot(x, y, 'b-d') % overwrites the previous plot command
hold on
plot(u, v, 'r--^') % plot is overlayed over plot contents
hold off

%% multiple plots in the same axis using a loop (for/while)
hold on
for i = 1:3
    y = x.^2 + i + 1;
    plot(x, y)
end
hold off

%% labels
title('y vs x')
xlabel('x[m]')
ylabel('y[m/s]')

%% legend
% order of plot labels is given by order of previous plot commands
% labels must match in number with plots in the axis
legend('f1', 'f2', 'f3', 'f4', 'f5')

%% legend with location - inside the axis
legend('f1', 'f2', 'f3', 'f4', 'f5', 'Location', 'NorthWest')

%% legend with location - outside the axis
legend('f1', 'f2', 'f3', 'f4', 'f5', 'Location', 'NorthWestOutside')

%% axis properties
% set limits for axis
axis([-1.2 2.3 -1 9])

%% set only limits for x
xlim([-1.4 2.4])

%% set only limits for y
ylim([-1 10])

%% equal scaling for x and y axis
axis equal

%% adding padding, e.g., space around displayed data
axis padded

%% removing extra space around displayed data
axis tight

%% remove axis altogether
axis off

%% add axis to back figure
axis on

%% invert the direction for y-axis to point downwards
axis ij

%% no automatic rescaling of axis
axis manual

%% enable automatic rescaling of axis
axis auto

%% figures

figure() % creates new figure
figure() % creates new figure

%% add plot to newly created figure
plot([0 1 0], [-1, 0, 1])

%%
figure(2) % creates or selects figure 2

plot([0 1 0], [-1, 0, 1], 'k--d')

%%
fig = figure(3) % creates or selects figure 3

close(fig) % closes figure 3

%%
close all % closes all figures

%% multiple other matlab visualization options -- explore
% scatter, bar, loglog, semilogx, semilogy, errorbar, polarplot, stemplot,
% boxplot, pie, stairs, area, etc.

%% add grid layer
grid on

%% remove grid layer
grid off

%% subplotting
figure(1)

x = 1:0.25:10;
y = x.^2 + 1;
y2 = x.^2 + 2 * x;

% creates two subplots arranged vectically
subplot(2, 1, 1)   % 2 rows, 1 column, first subfigure
plot(x, y, '--x')  % plot in subplot 1

subplot(2, 1, 2)   % 2 rows, 1 column, second subfigure
plot(x, y2, 'k-d') % plot in subplot 2

%% subplotting

% creates two subplots arranged horizontally
subplot(1, 2, 1)   % 1 rows, 2 column, first subfigure
                   % resets the subplot arrangement
plot(x, y, '--x')  % plot in subplot 1

subplot(1, 2, 2)   % 1 rows, 2 column, second subfigure
                   % does not resets the subplots
plot(x, y2, 'k-d') % plot in subplot 2

%% selecting in subplots
subplot(1, 2, 1)   % 1 rows, 2 column, first subfigure
                   % selects previous subplot 1
hold on
plot(x, y2, 'b-s') % add another plot to axis in subplot 1
hold off

%% subplots arranged as a 2x3 array
for i = 1:2
    for j = 1:3
        subplot(2, 3, (i-1)*3+j)
        plot(x, y + i + j)
    end
end

%% long form line/marker style properties
fig = figure(1)
clf % clear figure

x = 1:2:10;
y = x.^2 + 1;

plot(x, y, 'color', [0.7, 0.2, 0.9], 'LineStyle', '--', 'LineWidth', 2, ...
     'Marker', 'd', 'MarkerSize', 8, 'MarkerEdgeColor', [1, 0, 0], ...
     'MarkerFaceColor', [0, 1, 0])

%% setting axis ticks
xticks(1:0.5:10)
yticks([0, 10, 30, 80, 120])
%% setting axis ticks angles
xtickangle(45)
ytickangle(-45)
%% setting axis ticks format for numbers
xtickformat('%.2f') % real number with 2 decimals after decimal point
%% setting axis ticks format for numbers - 2nd example
xtickformat('%06.2f') % real number with 2 decimals after decimal point,
                      % 6 characters in total (including decimal point)
                      % left padding with 0s
%% setting tick labels
% number of labels must match the number of ticks set
yticklabels({'text 1', 'text 2', 'text 3', 'text 4', 'text 5'})
%% saving a figure to an image file
fig = figure(1)                % get figure object
saveas(fig, 'test_figure.png') % save figure in png image format
%% saving a figure to an image file with additional options
exportgraphics(fig, 'test_figure2.png', 'Resolution', 300,...
               'BackgroundColor', [0, 1, 0])

%% annotation

xline(pi) % vectical line at x = pi
%% vertical line with line style options
xline(2*pi, 'b--', 'LineWidth', 2)

%% horizontal line at 50 with line style options
yline(50, 'r--')

%% text "Annotation" at (5.5, 80)
text(5.5, 80, 'Annotation')
%% text "Annotation" at (5.5, 70) with text style options
text(5.5, 70, 'Annotation', 'FontSize', 14)

%% arrows
annotation('arrow', [0.4, 0.5], [0.30, 0.30]) % horizontal towards right
annotation('arrow', [0.4, 0.5], [0.30, 0.35]) % towards upper right
annotation('arrow', [0.4, 0.5], [0.30, 0.25]) % towards lower right
annotation('arrow', [0.5, 0.4], [0.20, 0.20]) % horizontal towards left
annotation('arrow', [0.0, 0.2], [0.0, 0.2])   % from origin towards upper
                                              % right

%% double arrow
annotation('doublearrow', [0.3, 0.4], [0.50, 0.50])

%% rectangle defined by (x, y, width, height)
annotation('rectangle', [0.7 0.7 0.1 0.1])

%% ellipse enclosed in rectangle defined by (x, y, width, height)
annotation('ellipse', [0.5 0.5 0.1 0.2])
