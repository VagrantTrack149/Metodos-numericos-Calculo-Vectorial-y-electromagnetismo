function area = simpson_met_3(funcion, a, b, n)
    % Calcula el área bajo la curva de una función en el intervalo [a, b]
    % utilizando la regla de Simpson de 1/3 con n subdivisiones
    
    % Tamaño de cada subintervalo
    h = (b - a) / n;
    
    % Puntos de evaluación de la función
    x = a : h : b;
    
    % Evaluación de la función en los puntos
    f = funcion(x);
    
    % Cálculo del área utilizando la regla de Simpson de 1/3
    area = (h / 3) * (f(1) + 4 * sum(f(2:2:end-1)) + 2 * sum(f(3:2:end-2)) + f(end));
end
