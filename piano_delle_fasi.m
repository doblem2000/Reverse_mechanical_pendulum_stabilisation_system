%%x_1=0
A=[0 1;-9.81*cos(0) -1]
[V,D] = eig(A)

%x_1=pi
A=[0 1;-9.81*cos(pi) -1]
[V,D] = eig(A)