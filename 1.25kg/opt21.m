

function [x,fval, exitflag, output]=opt21(q,tau,Tr)
[config_opt,config_test]=qget(q);

fun = @(x) costfunction(x,tau,config_opt,Tr);
x0=zeros(1,40);

options=optimoptions('fminunc','Algorithm','quasi-newton');
options.Display='iter';
options.MaxFunEvals=100000;
[x,fval, exitflag, output]=fminunc(fun,x0,options);
end