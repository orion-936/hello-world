clear;
clc;
% ******************************************************
% 读入测试数据，比如prn与dat
% ******************************************************
% path1 = '.\0826\7.15H.prn';
% path2 = '.\0825\7.15e.prn';

%画出全部数据图
delta_max = 0
for j = 1:1:4
   for k =2:1:2
        for i = 0:1:7
            a = num2str(100*j+10*k+i);
            path1 = strcat(a,'.prn');
            %path1 = '110.prn';
            fid1 = fopen(path1, 'r');
            fgetl(fid1);
            fgetl(fid1);
            da1 = fscanf(fid1, '%*lf  , %lf', [1 201]);
            freq = (0:200)+1100;
            plot(freq, da1, '-r', 'LineStyle', '-','LineWidth', 2);
            % hold on;
            % plot(theta+(361 - l2) * 0.25, da2, '-r', 'LineStyle', '--', 'LineWidth', 2);
            xlabel('freq(MHz)');
            ylabel('Gain(dB)');
            minium = min(da1);
            delta = max(da1)-min(da1)
            if delta > delta_max
                delta_max = delta;
            end

             path2 = strcat('F:\academic\doc_project项目文件\实际工程\2015_501薄膜天线\测试数据\TR绘图\20161014\',a);
             saveas(1,path2,'png');


            fclose('all');
        end
   end
end

%************************************************

