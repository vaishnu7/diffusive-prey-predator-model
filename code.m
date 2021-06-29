clc;
clear;
close all;
format long

%parameters in the model
Dr = 0.04;
Dc = 0.5;
r = 4;
k = 14.95;
acr = 1.01;
efrc = 1;
mc = 0.0201; %value of mc to change
qc = 0.05;
Thcr = 1;

%---------------------------------------------------%
%initialization and step size definition  
L=10;
T=1000;
dx = 0.05;
dt = 0.001;
x=0:dx:L;
t=0:dt:T;
Nx = length(x);
Nt = length(t);

nu=dt/(dx.*dx);

%Boundary Conditions
 R(1,2:Nt) = 0;
 C(1,2:Nt) = 0;
 R(Nx,2:Nt)=0;
 C(Nx,2:Nt)=0;

%Initial conditions
R(1:Nx,1) = 1.2;
C(1:Nx,1) = 1;
%---------------------------------------------------%
% Finite Difference Method

for n = 1:Nt-1
       
    for  j=2:Nx-1 
    
    R(j,n+1)=R(j,n)  +  nu*Dr.*(  R(j+1,n)-2.*R(j,n)+R(j-1,n)  )   +   dt.*(    r.*R(j,n).*(1-R(j,n)./k)  -  (acr.*R(j,n).*C(j,n))./(1+acr.*Thcr.*R(j,n)));
    C(j,n+1)=C(j,n)  +  nu*Dc.*(  C(j+1,n)-2.*C(j,n)+C(j-1,n)  )   +   dt.*(    (efrc*acr.*R(j,n).*C(j,n))./(1+acr.*Thcr.*R(j,n))   - mc.*C(j,n)  -  qc.*C(j,n).^2   );
    
    end
end
plot(x, C(:,Nt))
hold on
mc = 0.0202; %value of mc to change
for n = 1:Nt-1
       
    for  j=2:Nx-1 
    
    R(j,n+1)=R(j,n)  +  nu*Dr.*(  R(j+1,n)-2.*R(j,n)+R(j-1,n)  )   +   dt.*(    r.*R(j,n).*(1-R(j,n)./k)  -  (acr.*R(j,n).*C(j,n))./(1+acr.*Thcr.*R(j,n)));
    C(j,n+1)=C(j,n)  +  nu*Dc.*(  C(j+1,n)-2.*C(j,n)+C(j-1,n)  )   +   dt.*(    (efrc*acr.*R(j,n).*C(j,n))./(1+acr.*Thcr.*R(j,n))   - mc.*C(j,n)  -  qc.*C(j,n).^2   );
    
    end
end
plot(x, C(:,Nt))
%we are plotting C because we are concerned with the Predator here, if we are to check the plot for R we can change the command as plot(x, R(:, Nt))
