clear;
clc;
% ******************************************************
% 读入测试数据，比如prn与dat
% ******************************************************
% path1 = '.\0826\7.15H.prn';
% path2 = '.\0825\7.15e.prn';
path1 = '11x.prn';
fid1 = fopen(path1, 'r');
fgetl(fid1);
fgetl(fid1);
da1 = fscanf(fid1, '%*lf, %lf,', [1 801]);

[c1, l1] = max(da1)

da1 = da1 - c1;

cont1=1;
while da1(cont1)<da1(801)
    cont1 = cont1 + 1 ;
end



da2 = [da1(1 : 801) da1(cont1 : 801)];
%da3 = da2(l1+400-(cont1-1) : l1+400+(800-cont1)-(cont1-1));
da3 = da2(((800+l1-cont1)-(800-cont1)/2) : ((800+l1-cont1)+(800-cont1)/2))

% fid2 = fopen(path2, 'r');
% fgetl(fid2);
% fgetl(fid2);
% da2 = fscanf(fid2, '%*lf, %lf,', [1 721]);
% [c2, l2] = max(da2);
% da2 = da2 - c2;

theta = (0:(800-cont1))*800/(800-cont1);
% theta = -90 : 0.25 : 90;
plot(theta, da3, '-k', 'LineStyle', '-','LineWidth', 2);
% hold on;
% plot(theta+(361 - l2) * 0.25, da2, '-r', 'LineStyle', '--', 'LineWidth', 2);
xlabel('theta(^o)');
ylabel('Gain(dB)');
hold on;
%axis([-100 100 -70 0]);
% l = l1; r = l1;
% while da1(l) > -3
%     l = l - 1;
% end
% while da1(r) > -3
%     r = r + 1;
% end
% dbwidth = (r - l + 1) * 0.25
% 
% l = l2; r = l2;
% while da2(l) > -3
%     l = l - 1;
% end
% while da2(r) > -3
%     r = r + 1;
% end
% dbwidth = (r - l + 1) * 0.25

% ******************************************************
% 读入仿真的csv数据
% ******************************************************
path1 = 'x.csv';
fid1 = fopen(path1, 'r');
fgetl(fid1);
%fgetl(fid1);
da1 = fscanf(fid1, '%*lf, %lf,%*lf,%*lf', [1 801]);

[c1, l1] = max(da1);

da1 = da1 - c1;

cont1=1;
while da1(cont1)<da1(801)
    cont1 = cont1 + 1 ;
end



da2 = [da1(1 : 801) da1(cont1 : 801)];
da3 = da2(l1+400-(cont1-1) : l1+1200-(cont1-1));
% 
% fid2 = fopen(path2, 'r');
% fgetl(fid2);
% fgetl(fid2);
% da2 = fscanf(fid2, '%*lf, %lf,', [1 721]);
% [c2, l2] = max(da2);
% da2 = da2 - c2;

theta = (0:800);
% theta = -90 : 0.25 : 90;
plot(theta, da3, '-r', 'LineStyle', '--','LineWidth', 2);
% hold on;
% plot(theta+(361 - l2) * 0.25, da2, '-r', 'LineStyle', '--', 'LineWidth', 2);
xlabel('theta(^o)');
ylabel('Gain(dB)');
%************************************************
fclose('all');
