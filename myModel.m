function fit = myModel(b, x)
D=2.0*10^-9; % m^2/s
F=96485.33289; % C/mol
R=8.314; % J/mol/K
T= 298 ; % K
pi=3.141592653;
d=1.0*10^-4; %m NGO 1; N 1.83

H= 0.065; % m
W= 0.055/1.414; % m
L= 0.055; % m
% c1= x(2,:)*1000; % mol/m^3
% c2= x(1,:)*1000; % mol/m^3
 c1= 10.^(x)*1000; % mol/m^3
 c2= 10.^(x)*1000; % mol/m^3
%sigmas=b(1)*10^-3; 
zeta=-9.52*10^(-3);%V -9.1833 NGO, -0.63033 N
er=80;

e0=8.854187817*10^(-12);%F/m
ldeb=(er*e0*R*T/2./c1/F/F).^0.5;
sigmas=er*e0*zeta./ldeb;% C/m^2

r=b(1)*10^-9; % m
Dens= b(2)*10^12/8*3; % /mm^2
Num= 100*Dens;%100 for nafion
N=-sigmas/F/r;


%sigma=2*D*F*F/R/T*pi*r*r/d*((c1+c2).^2/4+(N/2)^2).^0.5*Num;
PP=R*T/D/F/F;
sigma=2/PP*pi*r*r/d*(c1.^2+(N/2).^2).^0.5*Num;
Rmicro1=PP./c1*L/H/W;
Rmicro2=PP./c2*L/H/W;
Rff1=PP./c1*(1-log(pi*2*r/H));%/L/Num
Rff2=PP./c2*(1-log(pi*2*r/H));%/L/Num
Rnano=1./sigma;
%Rnano=PP*F/Num*d/2/r/2/sigmas;
fit=Rnano+Rmicro1+Rmicro2+Rff1+Rff2;
%fit=Rnano;



 
% 自定义模型函数

end