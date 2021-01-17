function ret=NeumannBC(img,pad_h,pad_v)
    [m,n,d]=size(img);
    ret=zeros(m+2*pad_h,n+2*pad_v,d);
    ret(pad_h+1:pad_h+m,pad_v+1:pad_v+n,:)=img;
    for i=1:pad_h
        ret(i,:,:)=ret(2*pad_h-i+1,:,:);
        ret(i+pad_h+m,:,:)=ret(m-i+pad_h+1,:,:);
    end
    for i=1:pad_v
        ret(:,i,:)=ret(:,2*pad_v-i+1,:);
        ret(:,i+pad_v+n,:)=ret(:,n-i+pad_v+1,:);
    end
end