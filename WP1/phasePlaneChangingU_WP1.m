clear all;
close all;

tspan = [0 100];  % intervallo di simulazione
x0_1 = (-0.3);
x0_2 = 0; % condizioni iniziali
x0 = [x0_1 x0_2];

u_values = [6 , 8, 10, 12];  % Modifica questa lista con i valori desiderati

% Inizializza una cell array per memorizzare i risultati
results = cell(1, length(u_values));

% Utilizzeremo il solver 'ode45' (anche altri solver sono disponibili in Matlab)
for i = 1:length(u_values)
    u = u_values(i);
    [t, x] = ode45(@(t, x) function_ode_WP1(t, x, u), tspan, x0);
    results{i} = x;  % Salva i risultati nella cella
end

% Plot delle traiettorie nel piano delle fasi
figure();
hold on;
colors = 'bgrm';  % Colori per le diverse traiettorie
for i = 1:length(u_values)
    x = results{i};
    plot(x(:,1), x(:,2), colors(i));
end

xlabel('x1');
ylabel('x2');
legend('u = 0', 'u = 2', 'u = 4', 'u = 6');
grid on;

function xdot = function_ode_WP1(t, x, u)
    m = 1;
    l = 1;
    g = 9.81;
    b = 0.1;
    x1 = x(1);
    x2 = x(2);
    x1dot = x2;
    x2dot = -((g/l)*sin(x1)) - ((b/(m*(l^2)))*x2) + (u/(m*(l^2)));
    xdot = [x1dot, x2dot].';
end
