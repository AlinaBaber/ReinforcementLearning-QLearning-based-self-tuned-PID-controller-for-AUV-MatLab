function [ TTz ] = Deep( ph,h,int,di )
TTz = (di-h)*100+int*0.2+((di-h)-(di-ph))*80;%D==16
%+int*0.1+(h-ph)*0.1;
%1;
end

