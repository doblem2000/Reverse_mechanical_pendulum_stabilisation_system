
K = [18235, 53.9] 
kr = 18235 

%plot simulink
x=out.x
t=out.t
y=out.y
x1=x(:,1); % prima colonna
x2=x(:,2); %seconda colonna

%simulazione
figure()
plot(t, x1,'r',t, x2, 'b');
xlabel('t');
ylabel('x1 and x2');
%piano delle fasi
figure()
plot(x1,x2, 'r')
xlabel('x1');
ylabel('x2');
%uscita
figure()
plot(t,y)
xlabel('t');
ylabel('y');
