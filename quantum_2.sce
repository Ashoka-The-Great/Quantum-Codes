// plot wave function for experiment1 in 1-d potential well for both symmetric and asymmetric conditions.

clc;
clear()
clf()
h=1973;
m=0.511e6;
n=800;
rs=[0,-5];
rs1=[10,5]
for kk=1:2;
r0=rs(kk);
rf=rs1(kk);
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
end
H=(-(h^2)/(2*m*d^2)*A);
[y,eign]=spec(H);
E=diag(eign);
disp("ground state energy:",E(1));
disp("1st excited state energy:",E(2));
title('graph between wavefunction and r:'); 
subplot(1,2,kk)
plot(r,[abs(y(:,1))],'linwidth',);
subplot(1,2,kk)
plot(r,[abs(y(:,2))]+0.06);
subplot(1,2,kk)
plot(r,[abs(y(:,3))]+0.12);
xlabel("x axis");
ylabel("y axis")
legend('ground state energy','1st excited state energy','2nd excited state energy')
end

