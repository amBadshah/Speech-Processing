clear allcl

mL1=load('SVM_Stack_L1_10');

% ================================================
                        TEST = 'M';
                        INTERVAL = 10;
                        CLASSIFIER  = 'SVM';
% ================================================

Accuracies=[];

if(TEST=='M')
    trueLabel=1;
    files=79;
else
    trueLabel=2;
    files=180;
end

for i=[1:files]
    P10=[];
    P10D=[];
    P50=[];
    P100=[];
    fn=sprintf('%c(%d).csvProb.csv',TEST,i);
%     
%     if(TEST=='M')
%         sample=csvread(['.\Features_Audio2\Features\' fn]); 
%     else
%         sample=csvread(['.\Features_Audio2\Features\' fn]); 
%     end
    
%     [cSVM,acc,probM] = svmpredict(ones(size(sample,1),1)*trueLabel,sample(:,1:end-1),mL0.model,'-b 1');

    probM = csvread(['.\Features_New\AvgSVM10\' fn]); 

%     figure
    
    % Interval = 50
%     for j=1:INTERVAL:length(probM)-INTERVAL
%         s=sum(probM(j:j+INTERVAL-1,trueLabel));
%         avg=s/INTERVAL;
%         P10=[P10 avg];       
%     end

    P10=probM(:,trueLabel);
    
    accP10=length(find(P10>0.5));
    accP10=accP10/(length(P10))*100;
    accP10=mean(P10);
    
%     subplot(311),plot(P10),title(sprintf('[ %s ] : %s Interval = %d : Average = %.2f',fn, CLASSIFIER, INTERVAL,accP10));
%     ylim([0 1]); xlim([0 length(P10)]); drawnow; grid on
%     
    if(TEST=='M')
        csvwrite(['Results_SVM_DST\' sprintf('%c(%d)-%s-%d.csv',TEST,i,CLASSIFIER, INTERVAL)],[P10' (1-P10)']);
    else
        csvwrite(['Results_SVM_DST\' sprintf('%c(%d)-%s-%d.csv',TEST,i,CLASSIFIER, INTERVAL)],[(1-P10)' P10']);
    end
    
    % DST Code
    if(TEST=='M')
        pp=[P10 (1-P10)];
        ps=pp;
    else
        pp=[(1-P10) P10];
        ps=pp;
    end
    

    dd=myDST4B(pp);
    if(isempty(dd))
        continue;
    end
    if(TEST=='M')
        P10D=dd(:,1);
        
    else
        P10D=dd(:,2);
    end
    
    accP10D=length(find(P10D>0.5));
    accP10D=accP10D/(length(P10D))*100;
    accP10D=mean(P10D);
    
%     subplot(312),plot(P10D,'k-o'),title(sprintf('[ %s ] : %s + DST Average = %.2f',fn,CLASSIFIER, accP10D));
%     ylim([0 1]); xlim([0 length(P10D)]); drawnow; grid on
%     
    if(TEST=='M')
        csvwrite(['Results_SVM_DST\' sprintf('%c(%d)-%s-DST-%d.csv',TEST,i,CLASSIFIER,INTERVAL)],[P10D (1-P10D)]);
    else
        csvwrite(['Results_SVM_DST\' sprintf('%c(%d)-%s-DST-%d.csv',TEST,i,CLASSIFIER,INTERVAL)],[(1-P10D) P10D]);
    end

    % Stacking Code
    
    if(INTERVAL==100)
    arr=[];
    TDM=[];
    for j=1:length(ps)
        arr=[arr ps(j,:)];
        if(mod(j,INTERVAL)==0)
            TDM(j/INTERVAL,:)=arr;
            arr=[];
        end
    end

    TDM=TDM(1:end,:);
    
    [cSVM,acc,probML1] = svmpredict(ones(size(TDM,1),1)*trueLabel, TDM, mL1.model,'-b 1');
    
    if(TEST=='M')
        pr = probML1(:,1);
    else
        pr = probML1(:,2);
    end
    
    accP10S=length(find(pr>0.5));
    accP10S=accP10S/(length(pr))*100;
    accP10S=mean(pr);
    
%     subplot(313),plot(pr,'r-o'),title(sprintf('[ %s ] : %s + Stacking : Average = %.2f',fn,CLASSIFIER, accP10S));
%     ylim([0 1]); xlim([0 length(pr)]); drawnow; grid on
    
    if(TEST=='M')
        csvwrite(['Results_SVM_DST\' sprintf('%c(%d)-%s-Stack-%d.csv',TEST,i,CLASSIFIER, INTERVAL)],[pr (1-pr)]);
    else
        csvwrite(['Results_SVM_DST\' sprintf('%c(%d)-%s-Stack-%d.csv',TEST,i,CLASSIFIER, INTERVAL)],[(1-pr) pr]);
    end
    
    end
    
%     saveas(gcf,sprintf('Results_SVM_DST\\%c(%d)-%s_DST_Stack-%d.jpg',TEST,i,CLASSIFIER,INTERVAL));
    
%     csvwrite(['Results_SVM_DST\' sprintf('%c(%d)-10.csv',TEST,i)],[P10' (1-P10)']);
    
    % Interval = 50
%     for j=1:50:length(probM)-50
%         s=sum(probM(j:j+50,trueLabel));
%         avg=s/50;
%         P50=[P50 avg];       
%     end
%     
%     accP50=length(find(P50>0.5));
%     accP50=accP50/(length(P50))*100;
%     
%     subplot(312),plot(P50),title(sprintf('[ %s ] : Interval = 50 : Average = %.2f',fn, accP50));
%     ylim([0 1]); xlim([0 length(P50)]);drawnow; grid on
%     csvwrite(['Results_SVM_DST\' sprintf('%c(%d)-50.csv',TEST,i)],[P50' (1-P50)']);
%     
%     
%     for j=1:100:length(probM)-100
%         s=sum(probM(j:j+100,trueLabel));
%         avg=s/100;
%         P100=[P100 avg];       
%     end
%     
%     accP100=length(find(P100>0.5));
%     accP100=accP100/(length(P100))*100;
%     
%         
%     subplot(313),plot(P100),title(sprintf('[ %s ] : Interval = 100 : Average = %.2f',fn, accP100));
%     ylim([0 1]); xlim([0 length(P100)]);drawnow; grid on
%     csvwrite(['Results_SVM_DST\' sprintf('%c(%d)-100.csv',TEST,i)],[P100' (1-P100)']);
%     
if(INTERVAL==100)
    Accuracies = [Accuracies; [accP10 accP10D accP10S]];
else
    Accuracies = [Accuracies; [accP10 accP10D]];
end
    
%     saveas(gcf,sprintf('Results_SVM_DST\\%c(%d)-SVM.jpg',TEST,i));
end

if(TEST=='M')
    csvwrite('Results_SVM_DST\Results_Summary_Male.csv',Accuracies);
else
    csvwrite('Results_SVM_DST\Results_Summary_Female.csv',Accuracies);
end

