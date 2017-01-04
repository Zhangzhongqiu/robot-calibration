%run1(1:20,:)=[];
n=size(run1,1);

Q(:,:)=run1(:,2:8);
tau(:,:)=run1(:,9:15);
for i=1:n
Tr2(1,:,i)=run1(i,16:19);
Tr2(2,:,i)=run1(i,20:23);
Tr2(3,:,i)=run1(i,24:27);
Tr2(4,:,i)=run1(i,28:31);
end
clear i;
clear n;