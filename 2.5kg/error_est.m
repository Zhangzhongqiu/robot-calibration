function [theta,d]=error_est(x,tau,q,Tr,Tc1,Tc2,Tc1_ac,Tc2_ac)
%     lbr1=iiwa7_mdl(x(1),x(2),x(3),x(4),x(5),x(6),x(7),...
%         x(8),x(9),x(10),x(11),x(12),x(13),x(14),...
%         x(15),x(16),x(17),x(18),x(19),x(20),x(21));
    n=size(q,1);    
    lbr2=iiwa7;
    %Tr_ac=lbr1.fkine(q);%the model transform matrix ac
    Tr_bc=lbr2.fkine(q);%the model transform matrix bc
    
    for g=1:n
    lbr1(g)=iiwa7_mdl(x(1:28),tau(g,:));
    Tr_ac(:,:,g) = lbr1(g).fkine(q(g,:));%get the transform matrix from the model
    Tr_ac(:,:,g) = Tc2_ac*Tr_ac(:,:,g)*Tc1_ac;
%     R_ac(:,:,g) = t2r(Tr_ac(:,:,g));
%     T_ac(:,g) = transl(Tr_ac(:,:,g));
    end
    
    for h=1:n
    Tr_bc(:,:,h)=Tc2*Tr_bc(:,:,h)*Tc1;
    end
    
    T_bc=transl(Tr_bc);
    R_bc=t2r(Tr_bc);
    T_ac=transl(Tr_ac);
    R_ac=t2r(Tr_ac);

    T=transl(Tr);
    R=t2r(Tr);
    
    

    %calculate the error after calibration
    for i =1:n
    
    d(i,1)=norm(T_ac(i,:)-T(i,:));
    
    R_diff_ac(:,:,i) = R_ac(:,:,i)*inv(R(:,:,i));
    axang_ac(i,:) = rotm2axang(R_diff_ac(:,:,i));
    theta(i,1) = axang_ac(i,4);%rad
    
    end
  %calculate the error before calibration  

    for k=1:n
    d(k,2)=norm(T_bc(k,:)-T(k,:));
    R_diff_bc(:,:,k) = R_bc(:,:,k)*inv(R(:,:,k));
    axang_bc(k,:)= rotm2axang(R_diff_bc(:,:,k));
    theta(k,2) = axang_bc(k,4);
    end
    
end