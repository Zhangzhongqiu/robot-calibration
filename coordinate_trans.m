%find the 2 transform matrix Tc1 and Tc2 for rigistration
function [Tc1,Tc2]=coordinate_trans(Q,Tr2)

robot=iiwa7;
Trm=robot.fkine(Q);
A=Trm;

B=Tr2;

x0=zeros(1,12);
f= @(a1,a2,a3,a4,a5,a6, b1, b2, b3, b4, b5, b6)lsfun(A, B, a1, a2, a3, a4, a5,a6, b1, b2, b3, b4, b5, b6);
fun= @(x)f(x(1),x(2),x(3),x(4),x(5),x(6),x(7),x(8),x(9),x(10),x(11),x(12));
options=optimoptions('fminunc','Algorithm','quasi-newton','MaxFunEvals',2500);
options.Display='iter';
% [x,fval, exitflag, output]=fminunc(fun,x0,options);
x=fminunc(fun,x0,options);
r1=rpy2r(x(1),x(2),x(3));
r2=rpy2r(x(7),x(8),x(9));
t1=[x(4),x(5),x(6)];
t2=[x(10),x(11),x(12)];
Tc1=[r1,t1';0 0 0 1];
Tc2=[r2,t2';0 0 0 1];
end