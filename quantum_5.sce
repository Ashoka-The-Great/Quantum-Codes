// vibration of hydrogen atom

clc;
clear;
clf;
m = 940e6
h = 1973
D = 0.755
n = 800
a = 1.44
r0 = 0.131
r1 = 1
rf = 1.1
r = linspace(r1,rf,n)
d = (rf - r1)/n;
K = eye(n,n) * (-2)
for i = 1:n-1
 K(i,i+1) = 1
 K(i+1,i) = 1
end
V = zeros(n,n)
for j = 1:n
 r_(j) =(r(j) - r0)/r(j);
 V(j,j) = D*((exp(-2*a*r_(j))) - exp((-a)*r_(j)))
end
H = (-(h^2)/(2*m*d^2))*K + V
[val,eigen] = spec(H)
E = diag(eigen)
disp(E,"Vibrational Energy ")
Ve = min(E)
disp(Ve," Minimum Energy ")
plot(r,[abs(val(:,1))])
