// s-wave schrodinger equation for ground and first excited state of hydrogen atom

clc;
clear()
clf()
h=1973;
m=0.511e6;
n=800;
r0=1e-15;
rf=10;
e=3.795;
r=linspace(r0,rf,n);
d=(rf-r0)/n;
A=zeros(n,n);
V=zeros(n,n);
A(1,[1:2])=[-2,1];
A(n,[n-1:n])=[1,-2];
for i=2:n-1
A(i,[i-1:i+1])=[1,-2,1];
end
for i=1:n
V(i,i)=(-(e^2)/r(i));
end
H=(-(h^2)/(2*m*d^2)*A)+V;
[y,eign]=spec(H);
E=diag(eign);
disp("ground state energy:",E(2));
disp("1st excited state energy:",E(3));
title('graph between wavefunction and r:'); 
subplot(2,1,1)
plot(r,[abs(y(:,2))],'linwidth',4);
xlabel("r----")
ylabel("wavefunction")
legend('ground state energy','fontsize',-5);
xgrid(5)
subplot(2,1,2)
plot(r,[abs(y(:,3))],'linwidth',6);
xlabel("x axis");
ylabel("y axis")
legend('1st excited state energy','fontsize',-5);
xgrid(6)
