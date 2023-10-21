A=[0 1; 9.81 -0.1];
B=[0; 1];
C=[1 0];
D=0;

%matrice di raggiungibilità
%for per automatizzare
W_R=[B A*B];
det(W_R)
%verifichiamo che rango sia uguale a max(n righe, n colonne) di W_R
rank(W_R)

%p=[-1 -2] % posizione desiderata dei poli 

%K=place(A,B,p)
K=[17.1 5.3]
k_r=-1/(C*inv(A-B*K)*B)

%sim('laboratorio2_sm_poleplacement.slx')