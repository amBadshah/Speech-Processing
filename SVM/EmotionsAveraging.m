fNames=dir('.\ProbOne\*.csv');
dataMean=zeros(15,7);

for i=1:length(fNames)
    data = csvread(['.\ProbOne\' fNames(i).name]);
    dataMean(i,:)=mean(data);
end

 csvwrite('Su-Means.csv',dataMean);