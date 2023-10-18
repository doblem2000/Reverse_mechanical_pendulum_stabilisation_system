
K = [18235, 53.9] 
kr = 18235 

%plot simulink
x=out.x
xdot=out.xdot
t=out.t
y=out.y
x1=x(:,1); % prima colonna
x2=x(:,2); %seconda colonna
x1dot=xdot(:,1)
x2dot=xdot(:,2)

%simulazione
figure()
plot(t, x1,'r',t, x2, 'b');
xlabel('t');
ylabel('x1 and x2');
%piano delle fasi
figure()
plot(x1dot,x2dot, 'r')
xlabel('x1');
ylabel('x2');
%uscita
figure()
plot(t,y)
xlabel('t');
ylabel('y');

%prestazioni
stepinfo(y,t)
