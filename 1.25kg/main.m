%read the output of measurement
data=csvread('20161216_run2_1.25kg.csv',1,1);
[Q,tau,Tr2]=gettrans(data);
%calibration
[x,fval, exitflag, output]=opt21(Q,tau,Tr2);
save('outputs.mat','x');  %%save the identified errors
%error calculation
[q_opt,q_test]=qget(Q);
[Tc1,Tc2]=coordinate_trans(Q,Tr2);
% load Tc1;%load coordinate transform matrix before calibration Tc1
% load Tc2;%load coordinate transform matrix before calibration Tc2
[Tc1_ac,Tc2_ac]=gettc(x);% get the coordinate transform matrix after calibration
[theta,d]=error_est(x,tau,q_opt,Tr2,Tc1,Tc2,Tc1_ac,Tc2_ac);

%figure plot
[f1,f2]=figplot(d,theta);