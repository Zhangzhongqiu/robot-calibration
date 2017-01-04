load run2_config;
robot1=iiwa7;
Tm1=robot1.fkine(Q);
n=size(Q,1);
%load transform_matrix;
T1=transl(Tm1);%model position 
for i=1:n
T2(i,:)=T1(i,:)*r+t;%
end
T=transl(Tr2);


for j=1:n
e(j,1)=sqrt((T(j,1)-T1(j,1))^2+(T(j,2)-T1(j,2))^2+(T(j,3)-T1(j,3))^2);%e(j,1)=norm(T(j,:)-T1(j,:));
e(j,2)=sqrt((T(j,1)-T2(j,1))^2+(T(j,2)-T2(j,2))^2+(T(j,3)-T2(j,3))^2);%e(j,2)=norm(T(j,:)-T2(j,:));
end
edges=[0.005:0.001:0.025];
f=figure;
 y1=histogram(e(:,1),edges);
  hold on
y2=histogram(e(:,2));