
function [ TT ] = Direct( pan,an,int,f ,Kp,Ki,Kd)
if f==1
   % TT = an*150+0.3*int+250*((an)-(pan));
    TT = an*Kp+Ki*int+Kd*((an)-(pan));
else
   % TT = an*150+0.3*int+250*((an)-(pan));
    TT = an*Kp+Ki*int+Kd*((an)-(pan));
end



end

