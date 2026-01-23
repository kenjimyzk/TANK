c=1;
n=1;
gamma=1.5;
varphi=3;
u=c^(1-gamma)-n^(1+varphi)*(1-gamma)/(1+varphi);

n=linspace(0,2,100);
c=linspace(0,2,100);
u=c.^(1-gamma)-n.^(1+varphi)*(1-gamma)/(1+varphi);
f=n.^(1+varphi).*(1-gamma)./(1+varphi) ;
g=c.^(1-gamma)
plot(n,g,'r',n,f,'b');

plot(n,u,'r');
