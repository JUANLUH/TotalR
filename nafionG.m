clear
clc

xData = log10([0.001 0.01 0.1 0.5 1]);
yDataNGO = [12121.78335 1476.2254 210.71931 49.00189 31.76462];
yDataN = [20922.94888 3278.20255 392.67959 101.69536 62.80226];

% xData =log10([0.001 0.001 0.001 0.001 0.001; 0.01 0.1 0.5 1 6]);
% yData1 = [52999.50122 26302.48879 23117.51815 18829.78622 14509.18913];
% %yData2 = [68010.89653 43952.5906 41547.25623 35175.8667 13353.15549];
% yData3 = [41419.7017 39334.77036 36002.43376 32166.75244 12260.80698];
%yData4 = [58663.75694 52038.34185 50236.36208 46548.43365 24026.67922];
beta0=[0.11,0.12];%半径，孔道密度
% 创建拟合模型
% options = optimset('Display', 'off');
% options = optimset(options, 'MaxIter', 100000);
% options = optimset(options, 'TolFun', 1e-10);
% [beta,R,J,CovB, MSE,ErrorModelInfo] = nlinfit(xData,yDataNGO,'myModel',beta0, options);

% 绘制数据和拟合曲线
xp=-3:0.01:1;
yp1=myModel(beta0,xp);
yp2=myModel(beta0+[0,0.],xp);
yp3=myModel(beta0+[0,0.],xp);
%plot(xData(2,:),yData3,'.k',xp(2,:),yp1,'r',xp(2,:),yp2,'r',xp(2,:),yp3,'k')
%plot(xp(2,:),yp1,'r',xp(2,:),yp2,'r',xp(2,:),yp3,'k')

figure; % 创建一个新的图形窗口
%subplot(3,1,1); % 创建两行一列的子图布局，并选择第一个子图
plot(xData,yDataNGO,'.k',xp,yp1,'r',xp,yp2,'r',xp,yp3,'r'); 
title('01'); % 给图加上标题
 
% subplot(3,1,2); % 创建两行一列的子图布局，并选择第一个子图
% plot(xData,yDataNGO,'.k',xp,yp2,'r'); % 画出正弦曲线
% title('02'); % 给图加上标题
% 
% subplot(3,1,3); % 创建两行一列的子图布局，并选择第一个子图
% plot(xData,yDataNGO,'.k',xp,yp3,'r'); % 画出正弦曲线
% title('03'); % 给图加上标题



% yp=myModelmicro(beta0,xp);
% plot(xp(2,:),yp,'r')
% plot(xData(2,:),yData1,'.k',xData(2,:),yData2,'.r')


