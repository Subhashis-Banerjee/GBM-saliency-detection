% Saliency based tumor and edema detection from brain MR images
% Copyright (c) 2014 Subhashis Banerjee
% Machine Intelligence Unit (MIU)
% Indian Statistical Institute, Kolkata

function [ FL ] = computeSalMap( L, a, b, w )
% L, a, b Lab color values
% w window size

[r,c,~]=size(L);
% Divide the whole image into blocks and calculate their means
ML = mat2cell(L,ones(256/w,1)*w,ones(256/w,1)*w);
FL = cellfun(@(in) mean(in(:)), ML);
Ma = mat2cell(a,ones(256/w,1)*w,ones(256/w,1)*w);
Fa = cellfun(@(in) mean(in(:)), Ma);
Mb = mat2cell(b,ones(256/w,1)*w,ones(256/w,1)*w);
Fb = cellfun(@(in) mean(in(:)), Mb);
% Calculate the saliency map
%V = calculateMap_mex(FL, Fa, Fb, int32(w), int32(r), int32(c));
%V = cell2mat(FL);
end

