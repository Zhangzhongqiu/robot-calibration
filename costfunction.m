function error = costfunction(a,tau,q,Tr)

r1=rpy2r(a(29),a(30),a(31));%rotation matrix
r2=rpy2r(a(32),a(33),a(34));
t1=[a(35),a(36),a(37)];
t2=[a(38),a(39),a(40)];
T1=[r1,t1';0,0,0,1];
T2=[r2,t2';0,0,0,1];

%cost function with 21 error parameter
%Tr is the measured transform matrix
R=t2r(Tr); %ger R, R is from Tr 
n = size(q,1); %get the number of configurations


d = 0; %initial error
d1 = 0; %inital angle error
d2 = 0; %initial translation error
error=0;
% for j=1:n
% r(j)=iiwa7_mdl(a,tau(j,:));
% 
% end
for i=1:n
    r(i)=iiwa7_mdl(a(1:28),tau(i,:));
    Tr_mdl(:,:,i) = r(i).fkine(q(i,:));%get the transform matrix from the model
    Tr_mdl(:,:,i) = T2*Tr_mdl(:,:,i)*T1;
    R_mdl(:,:,i) = t2r(Tr_mdl(:,:,i));%convert transform matrix to rotation matrix
    R_diff(:,:,i) = R_mdl(:,:,i)*inv(R(:,:,i));%get the rotation matrix of 2 frames
    axang(i,:) = rotm2axang(R_diff(:,:,i)); %get the rotation axis and angle
    d1=0.2*axang(i,4);
    
    T_mdl(:,i) = transl(Tr_mdl(:,:,i));%convert transform matrix to translation vector
    T(:,i) = transl(Tr(:,:,i)); %convert transform matrix to translation vector
    d2=norm(T_mdl(:,i)-T(:,i));
    d=d1^2+d2^2;
    error=error+d;
end

end