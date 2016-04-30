data=csvread('Results_Summary_Female.csv');
idx=find(data(:,2)<0.5);

% sdir='F:/New Sounds/2-Features/6-Used 4330/male/';
%   sdir='F:/SOUNDS DATA/Sounds 1-19-2016/4 - N Features/All Features/female/';
    sdir='F:/SOUNDS DATA/Sounds 1-19-2016/4 - N Features/All Features/female/';

for i=1:length(idx)
    fname=sprintf('F(%d).csv',idx(i));
%     copyfile([sdir fname],'F:/New Sounds/2-Features/8-selected 150/male/');
      copyfile([sdir fname],'F:/SOUNDS DATA/Sounds 1-19-2016/4 - N Features/false/female');
end

