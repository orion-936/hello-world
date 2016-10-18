clear;
clc;
% ******************************************************
%先规定数据存储时文件的命名规则

% 读入TR测试数据，比如201点prn，取出需要的5个频点的幅度和相位信息，得出相位差值大于3°的点
% ******************************************************
% path1 = '.\0826\7.15H.prn';
% path2 = '.\0825\7.15e.prn';

%画出全部数据图
for j = 1:1:4 %TR编号，板子上从下往上数1:4
   k =1; %幅度还是相位
        path=['110.prn','110.prn','110.prn','110.prn','110.prn','110.prn','110.prn','110.prn'];
        for i = 0:1:7 %无衰减和各位单独的作用
             %*************************************************************
             %拟读取文件路径和名称
             %*************************************************************
             a = num2str(100*j+10*k+i);
             path(1+i,1:7) = strcat(a,'.prn');
             %path1 = '110.prn';
             
             %*************************************************************
             %拟读取prn文件的头部处理
             %注意，和矢网存储的点数有关
             %*************************************************************
             fid1 = fopen(path(1+i,1:7), 'r');
             fgetl(fid1);
             fgetl(fid1);
             da1 = fscanf(fid1, '%*lf  , %lf', [1 201]);
            
             data(1+i,1:5) = [da1(1),da1(61),da1(101),da1(141),da1(201)];
%            data(1+i,1:5) = [1,61,101,141,201]
%            data2 = [1+i,1:5] = [1,61,101,141,201]

%             freq = (0:200)+1100;
%             plot(freq, da1, '-r', 'LineStyle', '-','LineWidth', 2);
%             % hold on;
%             % plot(theta+(361 - l2) * 0.25, da2, '-r', 'LineStyle', '--', 'LineWidth', 2);
%             xlabel('freq(MHz)');
%             ylabel('Gain(dB)');
%             minium = min(da1)
%             delta = max(da1)-min(da1)
% 
%             path2 = strcat('F:\academic\doc_project项目文件\实际工程\2015_501薄膜天线\测试数据\TR绘图\20161012\',a)
%             saveas(1,path2,'png')
                

            fclose('all');
        end
        %处理数据
        disp('第一行为无衰减实测值，后面的是从低位到高位，每位的衰减量');
        for counter_freq = 1:5
            for counter = 2:8
                data(counter,counter_freq) = data(1,counter_freq) - data(counter,counter_freq);
            end
        end
        data; %显示矩阵
end
 %*************************************************************************************************************************************%
 ref = [2,5,10.5,22.5,43.5,88.5,177] %典型值
 ref1 = [2.8125,5.625,11.25,22.5,45,90,180] %标准值
 for j = 1:1:4
   k = 2 ;
        path=['110.prn','110.prn','110.prn','110.prn','110.prn','110.prn','110.prn','110.prn'];
        for i = 0:1:7 %无衰减和各位单独的作用
             a = num2str(100*j+10*k+i);
             path(1+i,1:7) = strcat(a,'.prn');
             %path1 = '110.prn';
             fid1 = fopen(path(1+i,1:7), 'r');
             fgetl(fid1);
             fgetl(fid1);
             da1 = fscanf(fid1, '%*lf  , %lf', [1 201]);
            % 3 63 103 143 203
            data(1+i,1:5) = [da1(1),da1(61),da1(101),da1(141),da1(201)];
%            data(1+i,1:5) = [1,61,101,141,201]
%            data2 = [1+i,1:5] = [1,61,101,141,201]

%             freq = (0:200)+1100;
%             plot(freq, da1, '-r', 'LineStyle', '-','LineWidth', 2);
%             % hold on;
%             % plot(theta+(361 - l2) * 0.25, da2, '-r', 'LineStyle', '--', 'LineWidth', 2);
%             xlabel('freq(MHz)');
%             ylabel('Gain(dB)');
%             minium = min(da1)
%             delta = max(da1)-min(da1)
% 
%             path2 = strcat('F:\academic\doc_project项目文件\实际工程\2015_501薄膜天线\测试数据\TR绘图\20161012\',a)
%             saveas(1,path2,'png')
                

            fclose('all');
        end
        %处理数据
        disp('第一行为无相移实测值，后面的是从低位到高位，每位的相移量');
        for counter_freq = 1:5
            for counter = 2:8
                data(counter,counter_freq) = data(1,counter_freq) - data(counter,counter_freq);
                if data(counter,counter_freq)<0
                    data(counter,counter_freq) = 360 +data(counter,counter_freq);
                end

                if abs(data(counter,counter_freq) - ref1(counter-1)) >=3
                    
                    disp('超过3°误差的TR编号')
                    disp(j)
                    disp('控制串码位')
                    disp(counter)
                    disp('频率')
                    disp(counter_freq)
                end
            end
        end
        data; %显示矩阵
end

%************************************************

