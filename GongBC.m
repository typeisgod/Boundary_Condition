function ret=GongBC(img,pad_h,pad_v)
    [m,n,d]=size(img);

    ret=zeros(m+2*pad_h,n+2*pad_v,d);
    ret(pad_h+1:pad_h+m,pad_v+1:pad_v+n,:)=img;
    
    for i=1:pad_h
        for j=1:pad_v
            
            k=ret(pad_h+1,pad_v+1,:);
            d=sqrt((pad_h+1-i)^2+(pad_v+1-j)^2);
            d=d/sqrt(pad_h^2+pad_v^2);
            ret(i,j,:)=k*cos(d*pi/2);
        end
    end
    
    for i=1:pad_h
        for j=pad_v+1:pad_v+n
            k=ret(pad_h+1,j,:);
            d=pad_h+1-i;
            d=d/pad_h;
            ret(i,j,:)=k*cos(d*pi/2);
        end
    end
    
    for i=1:pad_h
        for j=pad_v+n+1:n+2*pad_v
            k=ret(pad_h+1,pad_v+n,:);
            d=sqrt((pad_h+1-i)^2+(pad_v+n-j)^2);
            d=d/sqrt(pad_h^2+pad_v^2);
            ret(i,j,:)=k*cos(d*pi/2);
        end
    end

    for i=pad_v+1:pad_h+m
        for j=1:pad_v
            k=ret(i,pad_v+1,:);
            d=pad_v+1-j;
            d=d/pad_v;
            ret(i,j,:)=k*cos(d*pi/2);
        end
    end
    
    for i=pad_v+1:pad_h+m
        for j=pad_v+n+1:n+2*pad_v
            k=ret(i,pad_v+n,:);
            d=pad_v+n-j;
            d=d/pad_v;
            ret(i,j,:)=k*cos(d*pi/2);
        end
    end
    
    for i=pad_h+m+1:m+2*pad_h
        for j=1:pad_v
            k=ret(pad_h+m,pad_v+1,:);
            d=sqrt((pad_h+1+m-i)^2+(pad_v+1-j)^2);
            d=d/sqrt(pad_h^2+pad_v^2);
            ret(i,j,:)=k*cos(d*pi/2);
        end
    end
    
    for i=pad_h+m+1:m+2*pad_h
        for j=pad_v+1:pad_v+n
            k=ret(pad_h+m,j,:);
            d=pad_h+m-i;
            d=d/pad_h;
            ret(i,j,:)=k*cos(d*pi/2);
        end
    end
    
    for i=pad_h+m+1:m+2*pad_h
        for j=pad_v+n+1:n+2*pad_v
            k=ret(pad_h+m,pad_v+n,:);
            d=sqrt((pad_h+m-i)^2+(pad_v+n-j)^2);
            d=d/sqrt(pad_h^2+pad_v^2);
            ret(i,j,:)=k*cos(d*pi/2);
        end
    end
end