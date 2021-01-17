function ret=periodBC(img,pad_h,pad_v)
    [m,n,d]=size(img);
    ret=zeros(m+2*pad_h,n+2*pad_v,d);
    ret(pad_h+1:pad_h+m,pad_v+1:pad_v+n,:)=img;
    for i=1:pad_h
        ret(i,:,:)=ret(m+i,:,:);
        ret(i+pad_h+m,:,:)=ret(pad_h+i,:,:);
    end
    for i=1:pad_v
        ret(:,i,:)=ret(:,n+i,:);
        ret(:,i+pad_v+n,:)=ret(:,pad_v+i,:);
    end
end