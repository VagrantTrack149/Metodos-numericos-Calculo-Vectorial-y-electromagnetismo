>> function [RMC_trapezoidal, RMC_rectangle, RMC_Simpson_3by8, RMC_Simpson_1by3] = RMC(i, T)

% Define the function i(t)
i = @(t) sin(2*pi/T*t);

% Define the number of intervals
N = 100;

% Define the trapezoidal rule
h = T/N;

% Calculate the trapezoidal rule
I_trapezoidal = (i(0) + i(T))/2 * h + sum(i(0:N-1)) * h;

% Define the rectangle rule
I_rectangle = i(0) + i(T) + 2*sum(i(1:N-1));

% Calculate the rectangle rule
I_rectangle = I_rectangle * h;

% Define the Simpson rule ⅜
h = T/(3*N);

% Calculate the Simpson rule ⅜
I_Simpson_3by8 = (i(0) + 4*i(T/3) + i(T))/3 * h + sum(i(0:N-1)) * h;

% Define the Simpson rule 1/3
h = T/(2*N);

% Calculate the Simpson rule 1/3
I_Simpson_1by3 = (i(0) + 3*i(T/2) + i(T))/3 * h + sum(i(0:N-1)) * h;

% Calculate the mean square root
RMC_trapezoidal = sqrt(mean(I_trapezoidal.^2));
RMC_rectangle = sqrt(mean(I_rectangle.^2));
RMC_Simpson_3by8 = sqrt(mean(I_Simpson_3by8.^2));
RMC_Simpson_1by3 = sqrt(mean(I_Simpson_1by3.^2));

end
