datos = [8.8 9.5 9.8 9.4 10.0;         9.4 10.1 9.2 11.3 9.4;         10.0 10.4 7.9 10.4 9.8;         9.8 9.5 8.9 8.8 10.6;         10.1 9.5 9.6 10.2 8.9];

media = mean(datos, 'all');
desviacion_estandar = std(datos, 0, 'all');
varianza = var(datos, 0, 'all');
coeficiente_de_variacion = desviacion_estandar / media;

n = numel(datos);
t = tinv(0.975, n-1);
se = desviacion_estandar / sqrt(n);
intervalo_de_confianza = [media - t*se, media + t*se];

rango = [7.5, 11.5];
ancho_intervalos = 0.5;
histograma = histogram(datos, 'BinLimits', rango, 'BinWidth', ancho_intervalos);
