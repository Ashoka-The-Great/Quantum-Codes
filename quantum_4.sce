// to solve s-wave schrodinger equation for mass m and harmonic oscillator potential for ground state and plot the wave-function

clc
clear()
clf()
h=197.3;
m=940;
b = [0,10,30]
for j =1:1:3
    bs = b(j)
n=800;
k = 100
r0=0.0001;
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
V1(i,i)=(1/2)*(k*(r(i)^2))+(1/3)*(bs*(r(i)^2));
end
H1=(-(h^2)/(2*m*d^2)*A)+V1;
[y1,eign1]=spec(H1);
E = diag(eign1)
disp("Ground state energy = ",E(1));
subplot(2,2,j)
title('Graph between wavefunction and radius = ');
plot(r,[abs(y1(:,1))]);
plot(r,[abs(y1(:,2))]);
xlabel("r");
ylabel("wavefunction")
legend('ground state energy','1st excited state energy');
end

