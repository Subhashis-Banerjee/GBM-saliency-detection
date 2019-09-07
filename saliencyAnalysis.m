clear all; close all; clc;



slice = 58;
precision = zeros(5, 0);  % Specificity
recall = zeros(5, 0);     % Sensitivity
hit_rate = zeros(5, 0);
false_alarm_rate = zeros(5, 0);

n = 1;
for i=slice:real(i+4):74
    no = num2str(i);
    GT = load(strcat('../Data/HG/P2/Results/',no,'_GT.mat'));
    T = GT.GT;
    T = T(:);
    
    S = load(strcat('../Data/HG/P2/Results/',no,'_Map.mat'));
    Si = S.salmapSmooth;
    figure; imshow(Si, []);
    k=1;
    
    for th=0 :0.001: 1
        S = (Si > th);
        S = S(:);
        tp = sum(T == 1 & S ==1);
        fn = sum(T == 1 & S ==0);
        tn = sum(T == 0 & S ==0);
        fp = sum(T == 0 & S ==1);
        
        precision(n, k) = tp/(tp+fp);
        recall(n, k) = tp/(tp+fn);
        hit_rate(n,k) = tp/(tp+fn); 
        false_alarm_rate(n,k) = fp/(fp+tn); 
        k=k+1;
    end
    n = n+1;
end
xlswrite('../Data/HG/P2/Results/Precision.xlsx', precision);
xlswrite('../Data/HG/P2/Results/Recall.xlsx', recall);
xlswrite('../Data/HG/P2/Results/Hit_rate.xlsx', hit_rate);
xlswrite('../Data/HG/P2/Results/False_alarm_rate.xlsx', false_alarm_rate);



