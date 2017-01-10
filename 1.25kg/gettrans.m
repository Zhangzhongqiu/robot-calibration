function [Q,tau,Tr2]=gettrans(data)
n=size(data,1);

Q(:,:)=data(:,1:7);
tau(:,:)=data(:,8:14);

for i=1:n
    Tr2(1,:,i)=data(i,15:18);
    Tr2(2,:,i)=data(i,19:22);
    Tr2(3,:,i)=data(i,23:26);
    Tr2(4,:,i)=data(i,27:30);
    
end
Tr2(1:3,4,:)=Tr2(1:3,4,:)/1000;
end