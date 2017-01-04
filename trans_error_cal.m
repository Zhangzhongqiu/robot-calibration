load run2_config;
load transform2;
[Tc1,Tc2]=coordinate_trans(Q,Tr2);
[theta,d]=trans_error_est(Q,Tr2,Tc1,Tc2);