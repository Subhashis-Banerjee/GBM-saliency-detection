function [ V ] = calculateMap( FL, Fa, Fb, w, r, c )

%#codegen
coder.inline('never');

%Stores the 5 features in M
M=zeros((r/w)*(c/w),5);
k=1;
for i=1:(r/w)
    for j=1:(c/w)
       x1=i; y1=j;
       x2=i+w; y2=j+w;
       mx=(x1+x2)/2; my=(y1+y2)/2;
       M(k,1)=FL(x1, y1);
       M(k,2)=Fa(x1, y1);
       M(k,3)=Fb(x1, y1);
       M(k,4)=mx;
       M(k,5)=my;
       k=k+1;
    end
end

%Calculate the saliency map
v=zeros((r/w)*(c/w),1);
index=1;
for i=1:k-1
    s=0;   
    for j=1:k-1
        if i~=j
            d=sqrt((M(i,4)-M(j,4)).^2+(M(i,5)-M(j,5)).^2);
            fd=sqrt((M(i,1)-M(j,1)).^2+(M(i,2)-M(j,2)).^2+(M(i,3)-M(j,3)).^2);
            %s=s+fd; 
            s=s+(1/(d+1))*fd;
        end
    end
    v(index,1)=s;
    index=index+1;
end
V=reshape(v, [r/w c/w])';

end

