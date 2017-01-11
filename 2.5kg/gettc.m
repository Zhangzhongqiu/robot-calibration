function [Tc1,Tc2]=gettc(x)
r1=rpy2r(x(29),x(30),x(31));%rotation matrix
r2=rpy2r(x(32),x(33),x(34));
t1=[x(35),x(36),x(37)];
t2=[x(38),x(39),x(40)];
Tc1=[r1,t1';0,0,0,1];
Tc2=[r2,t2';0,0,0,1];
end