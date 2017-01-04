function [f1,f2]=figplot(d,theta)
d=1000*d;
edges1=0:.05:2.7;
ed1=0:.05:2.65;
N(:,1)=histcounts(d(:,1),edges1);
N(:,2)=histcounts(d(:,2),edges1);
figure
f1=bar(ed1,N);
f1(1).FaceColor='b';
f1(2).FaceColor='r';
set(gca,'xlim',[0 2.7],'YGrid','on','XTick',ed1,'XTickLabelRotation',45);
set(gca,'XTicklabel',sprintf('%3.2f\n',ed1));
xlabel('Translation error [mm]');
ylabel('Number of measurements');
box off;
mean1=sum(d)/227;
max1=max(d);
s1=std(d);

%legend
ldg1=legend({['After calibration', sprintf('\n'), 'mean=',num2str(mean1(1)),'mm ', 'std=',num2str(s1(1)),'mm '...
    'max=',num2str(max1(1)),'mm'],['Before calibration (nominal model)',...
    sprintf('\n'),'mean=',num2str(mean1(2)),'mm ','std=',num2str(s1(2)),'mm ','max=',num2str(max1(2)),'mm']},'FontSize',25);
ldg1.Box='off';
%plot rotation error
deg=pi/180;
theta=theta/deg;
edges2=(0:0.00018:0.009)/deg;
ed2=(0:0.00018:0.00882)/deg;
M(:,1)=histcounts(theta(:,1),edges2);
M(:,2)=histcounts(theta(:,2),edges2);
figure
f2=bar(ed2,M);
f2(1).FaceColor='b';
f2(2).FaceColor='r';
set(gca,'xlim',[0 0.01/deg],'YGrid','on','XTick',ed2,'XTickLabelRotation',45);
set(gca,'XTickLabel',sprintf('%3.3f\n',ed2));
xlabel('Rotation error [deg]');
ylabel('Number of measurements');
box off;
mean2=sum(theta)/227;
max2=max(theta);
s2=std(theta);

%legend
ldg2=legend({['After calibration', sprintf('\n'), 'mean=',num2str(mean2(1)),'deg ', 'std=',num2str(s2(1)),'deg '...
    'max=',num2str(max2(1)),'deg'],['Before calibration (nominal model)',...
    sprintf('\n'),'mean=',num2str(mean2(2)),'deg ','std=',num2str(s2(2)),'deg ','max=',num2str(max2(2)),'deg']},'FontSize',25);
ldg2.Box='off';
end