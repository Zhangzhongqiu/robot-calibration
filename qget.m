function [q1,q2]=qget(configuration)
m = size(configuration,1);
a = round(4*m/5);
q1 = configuration(1:a,:);
q2 = configuration(a+1:m,:);
end