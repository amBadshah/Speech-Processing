clear allcl
files=1;
TEST = 'NAME';
%heder= {'Hrate','BR','Posture','Activity','PeakAccel','BRAmplitude','BRNoise','BRConfidence','ECGAmplitude','ECGNoise','HRConfidence','HRV','ROG','SCL','HSS','HR','COH'};
%heder= {Hrate BR Posture Activity PeakAccel BRAmplitude BRNoise BRConfidence ECGAmplitude ECGNoise HRConfidence HRV ROG SCL HSS HR COH};
for i=[1:files]
    %fn=sprintf('%d_Out.csv',i); 
    [h,m] = csvreadh('Level_343.xlsx');%.'['Files\' fn]);
%     file = xlsread('1.csv');
    %selectCol=file(:,[4,5,7,8,9,12,13,14,15,16,17,18,22,38,39,40,41]);
    selectColx=x(:,[3,4,6,7,8,11,12,13,14,15,16,17,21,37,38,39,40]);
    selectColy=y(:,41);%,38,39,40]);
%     csvwrite('Result\.csv',selectCol);
%     csvwrite(['Results\' sprintf('%c(%d)-%s-%d.csv',TEST,i,)],[P10' (1-P10)']);
%         xlswrite('1_1.csv',selectCol);
        csvwrite('Level_TRY_343.csv',heder);%selectCol);
%         dlmwrite('Level_TRY_343.csv',selectColx,'-append');%['Results\' sprintf('%d_Out_E_B.csv',i)],selectCol);
%         dlmwrite('Level_TRY_343.csv',selectColy,'-append');
 end
    
