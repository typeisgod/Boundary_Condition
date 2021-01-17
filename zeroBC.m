function ret=zeroBC(img, pad_h,pad_v)
    [m,n,d]=size(img);
    ret=zeros(m+2*pad_h,n+2*pad_v,d);
    ret(pad_h+1:pad_h+m,pad_v+1:pad_v+n,:)=img;
end