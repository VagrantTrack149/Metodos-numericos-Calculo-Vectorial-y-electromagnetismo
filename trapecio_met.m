function area = trapecio_met(funcion, a, b, n)
    % Calcula el área bajo la curva de una función en el intervalo [a, b]
    % utilizando el método del trapecio con n subdivisiones
    
    % Tamaño de cada subintervalo
    h = (b - a) / n;
    
    % Puntos de evaluación de la función
    x = a : h : b;
    
    % Evaluación de la función en los puntos
    f = funcion(x);
    
    % Cálculo del área utilizando el método del trapecio
    area = h * (sum(f) - (f(1) + f(end)) / 2);
end
