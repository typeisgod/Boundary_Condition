function ret=shiftBC(img,pad_h,pad_v)
    [m,n,d]=size(img);
    ret=zeros(m+2*pad_h,n+2*pad_v,d);
    ret(pad_h+1:pad_h+m,pad_v+1:pad_v+n,:)=img;
    ret(pad_h,:,:)=ret(pad_h+1,:,:);
    ret(:,pad_v,:)=ret(:,pad_v+1,:);
    ret(pad_h+m+1,:)=ret(pad_h+m,:);
    ret(:,pad_v+n+1,:)=ret(:,pad_v+n,:);
    for i=1:pad_h-1
        ret(pad_h-i,:,:)=ret(pad_h+i,:,:);
    end
        
    for i=2:pad_h
        ret(i+pad_h+m,:,:)=ret(m-i+pad_h+2,:,:);
    end
    
    for i=1:pad_v-1
        ret(:,pad_v-i,:)=ret(:,pad_v+i,:);
    end
        
    for i=2:pad_v
        ret(:,i+pad_v+n,:)=ret(:,n-i+pad_v+2,:);
    end
end