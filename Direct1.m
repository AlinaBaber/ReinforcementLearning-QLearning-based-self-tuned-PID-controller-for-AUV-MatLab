function [ TT ] = Direct( pan,an,int,f )

if f==1
    TT = an*150+0.3*int+250*((an)-(pan));
else
    TT = an*150+0.3*int+250*((an)-(pan));
end



end

