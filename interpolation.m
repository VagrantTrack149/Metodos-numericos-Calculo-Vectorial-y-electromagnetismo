% Define the two arrays of elements
x = [ 250 300 350 400 450 500 550 600 650 700 750 800 900 1000];
y = [ 1.003 1.005 1.008 1.013 1.020 1.029 1.040 1.051 1.063 1.075 1.087 1.099 1.121 1.142];

% Create an empty array to store the lines
lines = [];

% Loop over all the points
for i = 1:length(x) - 1

    % Calculate the slope of the line between the current point and the next point
    slope = (y(i + 1) - y(i)) / (x(i + 1) - x(i));

    % Add the line to the array of lines
    lines = [lines [x(i) x(i + 1) slope]];

end

% Plot the points and the lines
for i = 1:length(lines)

    % Plot the line
    plot(lines(i, 1:2), lines(i, 3) * lines(i, 1:2) + lines(i, 4), '-k')

end

% Plot the original points
plot(x, y, 'o')

% Add a title and axis labels
title('First Degree Interpolation')
xlabel('x')
ylabel('y')