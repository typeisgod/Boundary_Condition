function ret =antiBC(img,pad_h,pad_v)
    [m,n,d]=size(img);
    ret=zeros(m+2*pad_h,n+2*pad_v,d);
    ret(pad_h+1:pad_h+m,pad_v+1:pad_v+n,:)=img;
    for i=1:pad_h
        ret(pad_h+1-i,:,:)=2*ret(pad_h+1,:,:)-ret(pad_h+1+i,:,:);
        ret(i+pad_h+m,:,:)=2*ret(pad_h+m,:,:)-ret(pad_h+m-i,:,:);
    end
    for i=1:pad_v
        ret(:,pad_v+1-i,:)=2*ret(:,pad_v+1,:)-ret(:,pad_v+1+i,:);
        ret(:,i+pad_v+n,:)=2*ret(:,pad_v+n,:)-ret(:,pad_v+n-i,:);
    end
end