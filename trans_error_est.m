function [theta,d]=trans_error_est(q,Tr,Tc1,Tc2)

robot=iiwa7;

n=size(q,1);
Tm=robot.fkine(q);
T=transl(Tr);
R=t2r(Tr);

for i=1:n
Tm(:,:,i)=Tc2*Tm(:,:,i)*Tc1;
end
    T_bc=transl(Tm);
    R_bc=t2r(Tm);

for k=1:n
  d(k)=norm(T_bc(k,:)-T(k,:));
  R_diff_bc(:,:,k) = R_bc(:,:,k)*inv(R(:,:,k));
  axang_bc(k,:)= rotm2axang(R_diff_bc(:,:,k));
  theta(k) = axang_bc(k,4);
  
end

end