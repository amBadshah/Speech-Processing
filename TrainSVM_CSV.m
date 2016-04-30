% % Training Level 0 Classifier =======================================================

clear all
dd=dir('D:\MATLAB\Matlab Projects\Speech Processing\TrainData\1male\*.csv');
d='D:\MATLAB\Matlab Projects\Speech Processing\TrainData\1male\';

tdata=[];
label=[];

modName='SVM_Model_1';


for i=1:length(dd)
%     fn=sprintf('
    data=csvread([d dd(i).name]);
    s=size(data,1);
    label=[label; ones(s,1)];
    tdata = [tdata;data(:,1:16)];
end

dd=dir('D:\MATLAB\Matlab Projects\Speech Processing\TrainData\female\*.csv');
d='D:\MATLAB\Matlab Projects\Speech Processing\TrainData\female\';

for i=1:length(dd)
    data=csvread([d dd(i).name]);
    s=size(data,1);
    label=[label; ones(s,1)*2];
    tdata = [tdata;data(:,1:16)];
end

% Save Data as CSV
csvwrite('NewTrainData.csv',[tdata label]);


% Train SVM
% disp('Training...');
% % l1=[ones(100,1)*2; ones(100,1)];
% model=svmtrain(label,tdata,'-b 1');
% disp('Training Complete');
% % save('model4StackSVML0','model');
% 
% save(modName,'model');