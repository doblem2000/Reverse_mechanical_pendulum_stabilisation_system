clear all
close all
clc
%% 
A=[0 1; 9.81 -0.1];
B=[0; 1];
C=[1 0];
D=0;
%% PASSIAMO ALL'OSSERVATORE (WP3)

% Innanzitutto verifichiamo l'osservabilità
Wo = [C;C*A];
rank(Wo);

% Il rango è 2, di conseguenza il sistema è osservabile
K =  [ 1.0e+03*1.8356   1.0e+03*0.1923];
kr=-1/(C*inv(A-B*K)*B)

P = eig(A - B * K);
% Nel caso preso di esempio, i poli a ciclo chiuso del sistema sono
% posizionati in:
% P = [ -13.4037 + 1.7828i,  -13.4037 - 1.7828i]


% Scegliamo poli a ciclo chiuso dell'osservatore che convergano più
% velocemente del sistema a ciclo chiuso

P_obs = [-3000 -3500];
L = place(A.',C.',P_obs);
L=L.';
r=pi


simOut = sim("simulation_control_observer_WP3.slx", 'SimulationMode', 'normal');

% Chiamata alla funzione per visualizzare i risultati
plotSimulationResults(simOut,1);

%{ ANALISI DEI RISULTATI

%}
