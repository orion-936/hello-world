clear;
clc;
% ******************************************************
%�ȹ涨���ݴ洢ʱ�ļ�����������

% ����TR�������ݣ�����201��prn��ȡ����Ҫ��5��Ƶ��ķ��Ⱥ���λ��Ϣ���ó���λ��ֵ����3��ĵ�
% ******************************************************
% path1 = '.\0826\7.15H.prn';
% path2 = '.\0825\7.15e.prn';

%����ȫ������ͼ
for j = 1:1:4 %TR��ţ������ϴ���������1:4
   k =1; %���Ȼ�����λ
        path=['110.prn','110.prn','110.prn','110.prn','110.prn','110.prn','110.prn','110.prn'];
        for i = 0:1:7 %��˥���͸�λ����������
             %*************************************************************
             %���ȡ�ļ�·��������
             %*************************************************************
             a = num2str(100*j+10*k+i);
             path(1+i,1:7) = strcat(a,'.prn');
             %path1 = '110.prn';
             
             %*************************************************************
             %���ȡprn�ļ���ͷ������
             %ע�⣬��ʸ���洢�ĵ����й�
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
%             path2 = strcat('F:\academic\doc_project��Ŀ�ļ�\ʵ�ʹ���\2015_501��Ĥ����\��������\TR��ͼ\20161012\',a)
%             saveas(1,path2,'png')
                

            fclose('all');
        end
        %��������
        disp('��һ��Ϊ��˥��ʵ��ֵ��������Ǵӵ�λ����λ��ÿλ��˥����');
        for counter_freq = 1:5
            for counter = 2:8
                data(counter,counter_freq) = data(1,counter_freq) - data(counter,counter_freq);
            end
        end
        data; %��ʾ����
end
 %*************************************************************************************************************************************%
 ref = [2,5,10.5,22.5,43.5,88.5,177] %����ֵ
 ref1 = [2.8125,5.625,11.25,22.5,45,90,180] %��׼ֵ
 for j = 1:1:4
   k = 2 ;
        path=['110.prn','110.prn','110.prn','110.prn','110.prn','110.prn','110.prn','110.prn'];
        for i = 0:1:7 %��˥���͸�λ����������
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
%             path2 = strcat('F:\academic\doc_project��Ŀ�ļ�\ʵ�ʹ���\2015_501��Ĥ����\��������\TR��ͼ\20161012\',a)
%             saveas(1,path2,'png')
                

            fclose('all');
        end
        %��������
        disp('��һ��Ϊ������ʵ��ֵ��������Ǵӵ�λ����λ��ÿλ��������');
        for counter_freq = 1:5
            for counter = 2:8
                data(counter,counter_freq) = data(1,counter_freq) - data(counter,counter_freq);
                if data(counter,counter_freq)<0
                    data(counter,counter_freq) = 360 +data(counter,counter_freq);
                end

                if abs(data(counter,counter_freq) - ref1(counter-1)) >=3
                    
                    disp('����3������TR���')
                    disp(j)
                    disp('���ƴ���λ')
                    disp(counter)
                    disp('Ƶ��')
                    disp(counter_freq)
                end
            end
        end
        data; %��ʾ����
end

%************************************************

