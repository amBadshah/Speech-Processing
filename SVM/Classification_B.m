clear allcl

TEST = 'F';
Accuracies=[];

if(TEST=='M')
    trueLabel=1;
    files=2674;
else
    trueLabel=2;
    files=1656;
end

for i=[1:files]
    
    fn=sprintf('%c(%d).csvAvg.csv',TEST,i); 
    prob1 = csvread(['.\Averages\Model_1\' fn]);
    prob2 = csvread(['.\Averages\Model_2\' fn]); 
    prob3 = csvread(['.\Averages\Model_3\' fn]); 
    prob4 = csvread(['.\Averages\Model_4\' fn]); 
    
    pp = (prob1+prob2+prob3+prob4)./4;
    dd=myDST4(pp);
    
    if(TEST=='M')
        P10D=dd(:,1);
    else
        P10D=dd(:,2);
    end
    
    accP10D=length(find(P10D>0.5));
    accP10D=accP10D/(length(P10D))*100;
    accP10D=mean(P10D);
    Accuracies = [Accuracies; accP10D];
end

if(TEST=='M')
    csvwrite('Averages\Result\Results_Summary_Male.csv',Accuracies);
else
    csvwrite('Averages\Result\Results_Summary_Female.csv',Accuracies);
end








