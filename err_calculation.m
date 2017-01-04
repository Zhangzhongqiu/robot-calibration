load outputs;%x
load torque;%tau
load run2_config;%load configurations q
[q_opt,q_test]=qget(Q);
load transform2; % transform matrix of dataset2 Tr
load Tc1;%load coordinate transform matrix before calibration Tc1
load Tc2;%load coordinate transform matrix before calibration Tc2

[Tc1_ac,Tc2_ac]=gettc(x);% get the coordinate transform matrix after calibration
[theta,d]=error_est(x,tau,q_opt,Tr2,Tc1,Tc2,Tc1_ac,Tc2_ac);