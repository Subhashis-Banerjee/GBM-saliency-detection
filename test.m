clear all; close all;clc;

FLAIR = double(imread('Data/HG/FLAIR/14.pgm'));
T1C = double(imread('Data/HG/T1C/14.pgm'));
T2 = double(imread('Data/HG/T2/14.pgm'));

CSF = double(abs(T2-FLAIR));
CSF = double(CSF>50);
CSF = CSF.*255;
%T2 = abs(T2-CSF)./255;

[r,c,~]=size(FLAIR);
w = 32;

T2 = imresize(T2, [256 256]);
% Divide the whole image into blocks and calculate their means
ML = mat2cell(T2,ones(256/w,1)*w,ones(256/w,1)*w);
V = zeros(w, w);
m = 1;
for i = 1 : 256/w
    for j = 1 : 256/w
        
        W = ML{i, j};
        Wmax = max(W(:));
        Wmin = min(W(:));
        Wmean = mean(W(:));
        
        for k = 1 : size(W, 1)
            for l = 1 : size(W, 2)
                %V(k, l) = max(W(k, l),Wmean)/255;
                V(k, l) = Wmean/255;
            end
        end
        ML{i, j} = V;
        
    end
end
A = cell2mat(ML);
imshow(A, []);

