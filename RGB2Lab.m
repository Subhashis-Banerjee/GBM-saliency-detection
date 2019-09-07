function [Lab] = RGB2Lab(RGB)

Xn=0.951; Yn=1.0; Zn=1.089;
R=double(RGB(:,:,1));
G=double(RGB(:,:,2));
B=double(RGB(:,:,3));

for i=1:size(RGB,1)
    for j=1:size(RGB,2)
               
        lp=R(i,j)/2.550;
        ap=(G(i,j)-128.0)/1.27;
        bp=(B(i,j)-128.0)/1.27;

        p=(lp+16)/116;
        yyn=p*p*p;
        
        if yyn>0.008856
            y=Yn*yyn;
            ha=(p+ap/500.);
            x=Xn*ha*ha*ha;
            hb=(p-bp/200.);
            z=Zn*hb*hb*hb;
        else
            y=Yn*lp/903.3;
            sqyyn=(lp/903.3)^(1/3);
            ha=ap/500/7.787+sqyyn;
            x=Xn*ha*ha*ha;
            hb=sqyyn-bp/200/7.787;
            z=Zn * hb*hb*hb;
        end
        
        L=3.063*x-1.393*y-0.476*z;
        a=-0.969*x+1.876*y+0.042*z;
        b=0.068*x-0.229*y+1.069*z;

        if L<0
            L=0;
        end
        
        if a<0
            a=0;
        end
        
        if b<0
            b= 0;
        end
        
        if L>1.0
            L=1.0;
        end
        
        if a>1.0
            a=1.0;
        end
        
        if b>1
            b=1.0;
        end

      Lab(i,j,1)=L*255;
      Lab(i,j,2)=a*255;
      Lab(i,j,3)=b*255;
    end
end
Lab=uint8(Lab);
end
