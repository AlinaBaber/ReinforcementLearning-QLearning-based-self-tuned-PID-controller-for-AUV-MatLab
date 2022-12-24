function [ T1,T2 ] = Control( pusb,usb,f,intx,inty )
    if f==0
        T1=0;
    else
        T1=30*usb(1)+0.01*intx+80*(usb(1)-pusb(1));
    end
    T2=60*usb(2)+0.1*inty++200*(usb(2)-pusb(2));
end

