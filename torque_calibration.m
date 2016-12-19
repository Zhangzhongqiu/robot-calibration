load torque;
load run2_config;
load transform2;
[x,fval, exitflag, output]=opt21(Q,tau,Tr2);
save('outputs.mat','x');