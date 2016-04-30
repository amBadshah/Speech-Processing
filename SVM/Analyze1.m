data=csvread('Su-Means.csv');
data=data';
mx=max(data);
h=zeros(1,length(mx));

for i=1:length(mx)
    v=data(:,i);
    mx=max(v);
    mx=mx(1);
    id=find(v==mx);
    idx(i)=id(1);
    h(idx(i))=h(idx(i))+1;
end

bar(h)
xlim([1 7])
h(1:7)