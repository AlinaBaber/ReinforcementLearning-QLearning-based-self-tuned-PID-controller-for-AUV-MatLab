function [ TTm ] = TRIM( ptr,tr,int,di,f ,Kp,Ki,Kd )

if f==1
    %TTm = (di-tr)*100+int*80+((di-tr)-(di-ptr))*800;%D==10
    TTm = (di-tr)*Kp+int*Ki+((di-tr)-(di-ptr))*Kd;%D==10
else
    %TTm = (di-tr)*200+int*20+((di-tr)-(di-ptr))*500;
    TTm = (di-tr)*Kp+int*Ki+((di-tr)-(di-ptr))*Kd;
end

%+int*0.1+;
%+int*5;
% a=95;
% if TTm>a
%     TTm=a;
% elseif TTm<-a
%     TTm=-a;
% end
end

