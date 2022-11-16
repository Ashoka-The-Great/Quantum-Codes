// solve the s-wave radial schrodinger equation..... coulomb screened potential. find the energy of atom in ground state

clc
clear()
clf()
h=1973;
m=0.511e6;
a = [3,5,7]
for j =1:1:3
    as = a(j)
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
V1(i,i)=(-(e^2)/r(i))*(exp(-r(i)/as));
end
H1=(-(h^2)/(2*m*d^2)*A)+V1;
[y1,eign1]=spec(H1);
E = diag(eign1)
disp("Ground state energy = ",E(2));
subplot(2,2,j)
title('Graph between wavefunction and radius = ');
plot(r,[abs(y1(:,2))]);
plot(r,[abs(y1(:,3))]);
xlabel("r");
ylabel("wavefunction")
legend('ground state energy','1st excited state energy');
end
