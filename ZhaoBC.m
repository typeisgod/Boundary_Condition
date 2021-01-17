function ret=ZhaoBC(img,pad_h,pad_v)
    [m,n,d]=size(img);
    pad_h=pad_h+1;
    pad_v=pad_v+1;
    ret=zeros(m+2*pad_h-2,n+2*pad_v-2,d);
    ret(pad_h:pad_h+m-1,pad_v:pad_v+n-1,:)=img;
    for i=1:pad_h-1
        ret(i,:,:)=ret(2*pad_h-i-1,:,:);
        ret(pad_h+m+i-1,:,:)=ret(m-i+pad_h-2,:,:);
    end
    for i=1:pad_v-1
        ret(:,i,:)=ret(:,2*pad_v-i-1,:);
        ret(:,i+pad_v+n-1,:)=ret(:,n-i+pad_v-2,:);
    end

    A=linspace(0,pi/2,pad_v-1+2);
    B=linspace(0,pi/2,pad_h-1+2);
    S=zeros(m+2*pad_h-2,n+2*pad_v-2);
    for i=1:pad_v-1
        S(pad_h:pad_h+m-1,i)=1-cos(A(i+1));
    end
    for i=1:pad_h-1
        S(i,pad_v:pad_v+n-1)=1-cos(B(i+1));
    end
    for i=1:pad_h-1
        for j=1:pad_v-1
            A2=linspace(0,acos(1-S(i,pad_v)),pad_v-1+2);
            A1=linspace(0,acos(1-S(pad_h,j)),pad_h-1+2);
            S(i,j)=0.5*(2-cos(A2(j+1))-cos(A1(i+1)));
        end
    end

    for j=n+pad_v:n+2*pad_v-2
        S(:,j)=S(:,n+2*pad_v-1-j);
    end
    for i=m+pad_h:m+2*pad_h-2
        S(i,:)=S(m+2*pad_h-1-i,:);
    end
    S(pad_h:pad_h+m-1,pad_v:pad_v+n-1)=1;
    ret=ret.*S;
end