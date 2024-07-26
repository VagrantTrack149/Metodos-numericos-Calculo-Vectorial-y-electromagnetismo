% Parámetros
T = 1; % Periodo en segundos

% Función de corriente
i = @(t) sin(2*pi/T*t); % Corriente instantánea

% Número de intervalos para la aproximación
N = 1000;

% Paso de tiempo
dt = T/N;

% Cálculo de la RMC utilizando la regla del trapecio
t = 0:dt:T;
RMC_trapecio = sqrt((1/T) * sum(i(t).^2) * dt);

% Cálculo de la RMC utilizando la regla del rectángulo
t = 0:dt:T-dt;
RMC_rectangulo = sqrt((1/T) * sum(i(t+dt/2).^2) * dt);

% Cálculo de la RMC utilizando la regla de Simpson ⅜
t = 0:dt:T-3*dt;
RMC_Simpson_3_8 = sqrt((3/T) * (3*sum(i(t+dt).^2) + 3*sum(i(t+2*dt).^2) + sum(i(t+3*dt).^2)) * dt);

% Cálculo de la RMC utilizando la regla de Simpson 1/3
t = 0:dt:T-2*dt;
RMC_Simpson_1_3 = sqrt((2/T) * ((i(0))^2 + 4*sum(i(t+dt).^2) + 2*sum(i(t+2*dt).^2) + (i(T))^2) * dt);

% Tabla de resultados
disp('Regla | RMC   | Error');
disp('------+-------+-----------');
disp(['T     | ' num2str(RMC_trapecio) ' | ' num2str(abs(RMC_trapecio-1))]);
disp(['R     | ' num2str(RMC_rectangulo) ' | ' num2str(abs(RMC_rectangulo-1))]);
disp(['S3/8  | ' num2str(RMC_Simpson_3_8) ' | ' num2str(abs(RMC_Simpson_3_8-1))]);
disp(['S1/3  | ' num2str(RMC_Simpson_1_3) ' | ' num2str(abs(RMC_Simpson_1_3-1))]);

% Gráfica de la función de corriente y las aproximaciones numéricas
figure;
t = 0:0.001:T;
plot(t, i(t), 'LineWidth', 2);
hold on;
plot(t, sqrt((1/T) * sum(i(0:dt:T).^2) * dt) * ones(size(t)), 'LineWidth', 2);
plot(t, sqrt((1/T) * sum(i(0:dt:T-dt/2+eps).^2) * dt) * ones(size(t)), 'LineWidth', 2);
plot(t, sqrt((3/T) * (3*sum(i(0:dt:T-3*dt+eps).^2) + 3*sum(i(dt:dt:T-2*dt+eps).^2) + sum(i(2*dt:dt:T).^2)) * dt) * ones(size(t)), 'LineWidth', 2);
plot(t, sqrt((2/T) * ((i(0))^2 + 4*sum(i(dt:dt:T-2*dt+eps).^2) + 2*sum(i(2*dt:dt:T).^2) + (i(T))^2) * dt) * ones(size(t)), 'LineWidth', 2);
legend('Corriente', 'Trapecio', 'Rectángulo', 'Simpson 3/8', 'Simpson 1/3');
xlabel('Tiempo');
ylabel('Corriente');
title('Aproximaciones numéricas');

% Respuestas a las preguntas
error = [abs(RMC_trapecio-1), abs(RMC_rectangulo-1), abs(RMC_Simpson_3_8-1), abs(RMC_Simpson_1_3-1)];
[min_error, min_error_index] = min(error);
[max_error, max_error_index] = max(error);

disp('Respuestas a las preguntas:');
disp(['a) La regla que produce el menor error es: ']);
switch min_error_index
case 1
disp('Regla del trapecio');
case 2
disp('Regla del rectángulo');
case 3
disp('Regla de Simpson 3/8');
case 4
disp('Regla de Simpson 1/3');
end

disp(['b) La regla que produce el mayor error es: ']);
switch max_error_index
case 1
disp('Regla del trapecio');
case 2
disp('Regla del rectángulo');
case 3
disp('Regla de Simpson 3/8');
case 4
disp('Regla de Simpson 1/3');
end

disp('c) No hay ninguna regla que siempre tenga un error mayor a todas las reglas. El error puede variar dependiendo de la forma de onda y el número de intervalos utilizados.');

% Cálculo del tiempo de ejecución para diferentes segmentos
N_values = [100, 1000, 10000]; % Número de intervalos
times = zeros(size(N_values));

for i = 1:numel(N_values)
N = N_values(i);
dt = T/N;
tic; % Inicio del temporizador
% Cálculo de la RMC utilizando la regla del trapecio
t = 0:dt:T;
RMC_trapecio = sqrt((1/T) * sum(i(t).^2) * dt);
times(i) = toc; % Fin del temporizador
end

disp(['a) La regla que tarda menos en los diferentes segmentos es: ']);
[~, min_time_index] = min(times);
switch min_time_index
case 1
disp('Regla del trapecio');
case 2
disp('Regla del rectángulo');
case 3
disp('Regla de Simpson 3/8');
case 4
disp('Regla de Simpson 1/3');
end

disp(['b) La regla que tarda más en los diferentes segmentos es: ']);
[~, max_time_index] = max(times);
switch max_time_index
case 1
disp('Regla del trapecio');
case 2
disp('Regla del rectángulo');
case 3
disp('Regla de Simpson 3/8');
case 4
disp('Regla de Simpson 1/3');
end
disp('c') 
% El consumo de tiempo de cada regla tiene un crecimiento lineal con respecto al número de segmentos. A medida que aumenta el número de segmentos, aumenta proporcionalmente el tiempo de ejecución de cada regla.');

% Comparación de la integral en la segunda mitad del periodo
t = T/2:dt:T;
integral_exacta = integral(i, T/2, T);
integral_trapecio = sum(i(t))*dt;
integral_rectangulo = sum(i(t+dt/2))*dt;
integral_Simpson_3_8 = (3*sum(i(t+dt))+3*sum(i(t+2*dt))+sum(i(t+3*dt)))*dt/8;
integral_Simpson_1_3 = ((i(T/2))^2 + 4*sum(i(t+dt).^2) + 2*sum(i(t+2*dt).^2) + (i(T))^2)*dt/6;

disp(['Para la segunda mitad del periodo, las diferencias en la integral son:']);
disp(['- Regla del trapecio: ' num2str(abs(integral_exacta - integral_trapecio))]);
disp(['- Regla del rectángulo: ' num2str(abs(integral_exacta - integral_rectangulo))]);
disp(['- Regla de Simpson 3/8: ' num2str(abs(integral_exacta - integral_Simpson_3_8))]);
disp(['- Regla de Simpson 1/3: ' num2str(abs(integral_exacta - integral_Simpson_1_3))]);
