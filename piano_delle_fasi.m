x1=sym('x1')
A=[0 1;-9.81*cos(x1) -1]
[V,D] = eig(A)

%a=sym('a')
%A=[a 0; 0 -1]
%[V,D] = eig(A)