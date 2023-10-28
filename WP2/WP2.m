clear all
close all
clc
%% Progettiamo un controllore migliore del precedente, considerando la linearizzazione del sistema intorno al punto di equilibrio (pi,0)
A=[0 1; 9.81 -0.1];
B=[0; 1];
C=[1 0];
D=0;
%matrice di raggiungibilità
W_R=[B A*B];
%verifichiamo che rango sia uguale a max(n righe, n colonne) di W_R
rank(W_R)
% Il sistema è raggiungibile


%% POLE PLACEMENT DEFINENDO I POLI ARBITRARIAMENTE
p=[-20 -40] % posizione desiderata dei poli 
% Proviamo pazziando noi i poli a ciclo chiuso
K=place(A,B,p)
kr=-1/(C*inv(A-B*K)*B)
%% TEST LINEARE
close all
rl = 0
simOut = sim('simulation_poleplacement_WP2_L', 'SimulationMode', 'normal');

% Chiamata alla funzione per visualizzare i risultati
plotSimulationResults(simOut);

%% TEST NON LINEARE
close all
r=pi
simOut = sim('simulation_poleplacement_WP2_NL', 'SimulationMode', 'normal');

% Chiamata alla funzione per visualizzare i risultati
plotSimulationResults(simOut);

% Ottenendo i seguenti risultati:
%{
RiseTime: 0.1307
TransientTime: 0.2300
SettlingTime: 0.2300
SettlingMin: 2.9405
SettlingMax: 3.1040
Overshoot: 0.0198
Undershoot: 0
Peak: 3.1040
PeakTime: 10.0996

ANALISI RISULTATI


%}

%% EQUIPOLLANZA DEI POLINOMI
%{
Proviamo a risolvere il problema tramite l'equipollanza dei polinomi,
dato che è un sistema del secondo ordine possiamo equiparare il polinomio
caratteristico di (A-BK), con il polinomio del secondo ordine:
s^2 + 2sξω + ω^2 = 0. 
Considerando K = [k1 k2] si ottiene:
A-BK = [0 1; 9.81-k1 -0.1-k2]
e calcolando il polinomio caratteristico:
s^2 + (0.1+k2)s + (k1-9.81)
Di conseguenza:
k1=ω^2+9.81 
k2=2ξω-0.1

Il k1, il k2 e il kr ottenuti sono relativi al controllore:
$u_l=-Kz + k_r r_l$
le $K$ e il $k_r$ che otterremo durante la procedura di sintesi saranno quindi relative a questo $u_l$
alla fine dovremo riportare questo al sistema non lineare: 
$u -u_e= -K (x-x_e) + k_r (r_{nl -\pi})$
$u_e=0$, $x_e=\begin{bmatrix}\pi \\ 0\end{bmatrix}$
$u=-K_1 x_1 - K_2 x_2 + K_1 \pi + k_r (r_{nl -\pi})$
$r_{nl} = \pi$
$u=-K_1 x_1 - K_2 x_2 + K_1 \pi$ 
%}

% Consideriamo ξ=1 (ovvero sovraelongazione pari a 0)
% e una ω=5.4 (ottenendo rise time = 0.5)
zita = 0.2
w = 24

k1=w^2+9.81 
k2=2*zita*w-0.1
K=[k1 k2]
kr=-1/(C*inv(A-B*K)*B)

%% TEST PRELIMINARE SUL LINEARE
close all
rl = 0
simOut = sim('simulation_poleplacement_WP2_L', 'SimulationMode', 'normal');

% Chiamata alla funzione per visualizzare i risultati
plotSimulationResults(simOut);

%% TEST SUL NON LINEARE
close all
r=pi
simOut = sim('simulation_poleplacement_WP2_NL', 'SimulationMode', 'normal');

% Chiamata alla funzione per visualizzare i risultati
plotSimulationResults(simOut);


% Ottenendo i seguenti risultati:
%{
RiseTime: 0.4490
TransientTime: 0.7219
SettlingTime: 0.7219
SettlingMin: 1.9824
SettlingMax: 2.1412
Overshoot: 0.1271
Undershoot: 0
Peak: 2.1412
PeakTime: 1.2266

ANALISI RISULTATI

Da cui notiamo che non riusciamo ad arrivare a regime, quindi rilassiamo un
pò l'overshoot
%}




%% LQR
% Proviamo a risolvere con un problema LQR:

Qz = eye(2);
Qu = 0.001; % Quando Qu è piccola -> non ha importanza quindi l'azione di controllo è più grande

[K,S,P] = lqr(A,B,Qz,Qu);


simOut = sim('simulation_control_LQR_WP2', 'SimulationMode', 'normal');

% Chiamata alla funzione per visualizzare i risultati
plotSimulationResults(simOut);


% Ottenendo i seguenti risultati:
%{
RiseTime: 2.2115
TransientTime: 3.9338
SettlingTime: 3.9338
SettlingMin: 2.8575
SettlingMax: 3.1318
Overshoot: 0
Undershoot: 0
Peak: 3.1318
PeakTime: 20

ANALISI RISULTATI



%}



