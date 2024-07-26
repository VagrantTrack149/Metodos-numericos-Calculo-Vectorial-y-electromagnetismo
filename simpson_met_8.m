function area = simpson_met_8(funcion, a, b, n)
    % Calcula el área bajo la curva de una función en el intervalo [a, b]
    % utilizando la regla de Simpson 3/8 con n subdivisiones
    
    % Tamaño de cada subintervalo
    h = (b - a) / n;
    
    % Puntos de evaluación de la función
    x = a : h : b;
    
    % Evaluación de la función en los puntos
    f = funcion(x);
    
    % Cálculo del área utilizando la regla de Simpson 3/8
    area = (3 * h / 8) * (f(1) + 3 * sum(f(2:3:end-2)) + 3 * sum(f(3:3:end-1)) + 2 * sum(f(4:3:end-3)) + f(end));
end
