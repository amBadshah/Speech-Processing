clear allcl
file = xlsread('Level_343.csv');
heder= {'Hrate','BR','Posture','Activity','PeakAccel','BRAmplitude','BRNoise','BRConfidence','ECGAmplitude','ECGNoise','HRConfidence','HRV','ROG','SCL','HSS','HR','COH'};
csvwrite_with_headers('Level_TRY_343.csv',file,heder);