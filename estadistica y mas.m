datos = [8.8 9.5 9.8 9.4 10.0;         
        9.4 10.1 9.2 11.3 9.4;        
        10.0 10.4 7.9 10.4 9.8;         
        9.8 9.5 8.9 8.8 10.6;         
        10.1 9.5 9.6 10.2 8.9];

% Calculando la media
media = sum(datos, 'all') / numel(datos);
fprintf("Media %f\n", media);

% Calculando la desviación estándar
suma_cuadrados = sum((datos - media).^2, 'all');
desviacion_estandar = sqrt(suma_cuadrados / (numel(datos) - 1));
fprintf("Desviacion estandar %f\n", desviacion_estandar);

% Calculando la varianza
varianza = desviacion_estandar^2;
fprintf("Varianza %f\n", varianza);

% Calculando el coeficiente de variación
coeficiente_de_variacion = desviacion_estandar / media;
fprintf("Coeficiente de variacion %f\n", coeficiente_de_variacion);

% Calculando el intervalo de confianza de 95% para la media
n = numel(datos);
t = tinv(0.975, n-1);
se = desviacion_estandar / sqrt(n);
intervalo_de_confianza = [media - t*se, media + t*se];
fprintf("Intervalo de confianza %f \n", intervalo_de_confianza);

% Construyendo el histograma
rango = [7.5, 11.5];
ancho_intervalos = 0.5;
histograma = histogram(datos, 'BinLimits', rango, 'BinWidth', ancho_intervalos);
