
%A is the transform matrix from model, B from measurement, C is the
%rogistered matrix
function y=lsfun(A, B, a1, a2, a3, a4, a5, a6, b1, b2, b3, b4, b5, b6)
n=size(A,3);
y=0;
r1=rpy2r(a1,a2,a3);%rotation matrix
r2=rpy2r(b1,b2,b3);
t1=[a4,a5,a6];
t2=[b4,b5,b6];
T1=[r1,t1';0,0,0,1];
T2=[r2,t2';0,0,0,1];
for i=1:n
    
  C(:,:,i)=T2*A(:,:,i)*T1;
end

tc=transl(C);
tb=transl(B);
rc=t2r(C);
rb=t2r(B);
for j=1:n
d=(norm(tc(j,:)-tb(j,:)))^2;
diff(:,:,j)=rc(:,:,j)*inv(rb(:,:,j));
axang(i,:) = rotm2axang(diff(:,:,j)); %get the rotation axis and angle
theta=(0.2*axang(i,4))^2;
y=y+d+theta;
end
end