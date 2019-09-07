function [ f ] = compare( I1, I2 )

    h1 = imhist(I1)./numel(I1); 
    h2 = imhist(I2)./numel(I2);
    
    f = 1 - sum((h1 - h2).^2);

end

