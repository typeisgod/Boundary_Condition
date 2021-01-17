function ret=repeatBC(img,pad_h,pad_v)
    [m,n,d]=size(img);
    ret=zeros(m+2*pad_h,n+2*pad_v,d);
    for i=1:m+2*pad_h
        for j=1:n+2*pad_v
            if i<=pad_h 
                if j<=pad_h
                    ret(i,j,:)=img(1,1,:);
                elseif j<=pad_h+n
                    ret(i,j,:)=img(1,j-pad_h,:);
                else
                    ret(i,j,:)=img(1,n,:);
                end
            elseif i<=pad_h+m
                if j<=pad_h
                    ret(i,j,:)=img(i-pad_h,1,:);
                elseif j<=pad_h+n
                    ret(i,j,:)=img(i-pad_h,j-pad_h,:);
                else
                    ret(i,j,:)=img(i-pad_h,n,:);
                end
            else
                if j<=pad_h
                    ret(i,j,:)=img(m,1,:);
                elseif j<=pad_h+n
                    ret(i,j,:)=img(m,j-pad_h,:);
                else
                    ret(i,j,:)=img(m,n,:);
                end   
            end
        end
    end
end