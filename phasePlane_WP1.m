clear all;
close all;

tspan = [0 100];  % intervallo di simulazione
x0_1 = (0); x0_2 = 0; % condizioni iniziali
x0 = [x0_1 x0_2];

% Utilizzeremo il solver 'ode45' (anche altri solver sono disponibili in Matlab)
[t, x] = ode45(@function_ode_WP1, tspan, x0);

% Otteniamo le variabili di stato in due vettori separati
x1 = x(:,1);
x2 = x(:,2);

% Plot dei risultati
plot(t,x1,'r',t,x2,'b'),grid
xlabel('t'),ylabel('x1 and x2')
legend('x1','x2')

% Plot di una traiettoria del piano delle fasi
% Nota: per un diagramma delle fasi complto bisogna creare un ciclo for...
 figure()
 plot(x1,x2)

 function xdot = function_ode_WP1(t,x)
    m=1;
    l=1;
    g=9.81;
    b=0.1;
    x1=x(1);
    x2=x(2);
    u=pi;
    x1dot= x2;
    x2dot= - ((g/l)*sin(x1)) - ((b/(m*(l^2)))* x2) + (u/(m*(l^2)));
    xdot=[x1dot, x2dot].';
 end
 