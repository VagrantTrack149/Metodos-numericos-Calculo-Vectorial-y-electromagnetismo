function I = simpson(f, a, b, n)
% Implementación de la Regla de Simpson para calcular la integral de una
% función f(x) en el intervalo [a, b] utilizando n subintervalos.

% Calcular la anchura de cada subintervalo
h = (b-a)/n;

% Calcular los puntos x en los que se evalúa la función
x = a:h:b;

% Calcular los valores de la función en los puntos x
y = f(x);

% Calcular la integral por la Regla de Simpson
I = h/3 * (y(1) + 4*sum(y(2:2:end-1)) + 2*sum(y(3:2:end-2)) + y(end));

end
