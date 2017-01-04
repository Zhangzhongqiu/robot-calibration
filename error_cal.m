%load identified_error;
load run2_config;
[q_opt,q_test]=qget(Q);
%load coordinate_trans2;
load transform2;
[Tc1,Tc2]=coordinate_trans(Q,Tr2);
%[theta,d]=error_est(x,q_opt,Tr2,Tc);