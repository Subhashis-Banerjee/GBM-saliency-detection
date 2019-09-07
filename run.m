
% Saliency based tumor and edema detection from brain MR images
% Copyright (c) 2014 Subhashis Banerjee
% Machine Intelligence Unit (MIU)
% Indian Statistical Institute, Kolkata

clear all; close all;clc;
% Read FLAIR, T1C and T2 weighted images and create the RGB image 
FLAIR = imread('Data/HG/FLAIR/14.pgm');
T1C = imread('Data/HG/T1C/14.pgm');
T2 = imread('Data/HG/T2/14.pgm');

CSF = abs(T2-FLAIR);
CSF = uint8(CSF>50);
CSF = CSF.*255;

T2 = abs(T2-CSF);

RGB(:,:,1) = FLAIR;
RGB(:,:,3) = T2;
RGB(:,:,2) = T1C;

[x,y,z]=size(RGB);

%RGB to LAB convertion
%[Lab] = RGB2Lab(RGB);
Lab = RGB;
%resizethe image into 256 X 256
Lab = imresize(Lab, [256 256]);
[r,c,d]=size(Lab);

L = double(Lab(:,:,1));
a = double(Lab(:,:,2));
b = double(Lab(:,:,3));





%Calculate the saliency map
m=1;
w=8;
salmap=zeros(r,c,4);
map=computeSalMap(L,a,b,w);
 
% while m<=4
%     map=computeSalMap(L,a,b,w);
% %     salmap(:,:,m)=imresize(map, [r, c] , 'bilinear');
% %     m=m+1;
% %     w=w*2;
% end
% 
%  map=zeros(r,c);
%  for i=1 : 4
%     map=map+(1/4)*salmap(:,:,i);
%  end
% 
% %0-1 normalization of the map
% norMap=((map-min(map(:)))/(max(map(:))-min(map(:))));
% %toc
% disp('Geneating saliency map.....');
% salmapSmooth = medfilt2(norMap, [25 25]);
% sm = imresize(salmapSmooth, [x y], 'bilinear');
% figure; imshow(sm, []);
% figure; imshow(sm,[],'Colormap',jet);
% % 
% % % imwrite(rgb, 'Data/HG/Out/104.tif');
% % % imwrite(salmapSmooth, 'Data/HG/Out/8.pgm');
% %%
% %%Fuzzy fication
% for i = 1 : 4
%     s = salmap(:, :, i);
%     x = s(:);
%     y = smf(x,[mean(x) 2*mean(x)]);
%     V(:, :, i) = reshape(y, size(s, 1), size(s, 2));
%     figure; imshow(V(:, :, i), []);
% end
%     
%  map=zeros(r,c);
%  for i = 1 : 4
%     map = map+(1/4)*V(:,:,i);
%  end
% figure;imshow(map, [])
% I = map>=0.8;
% figure;imshow(I)
