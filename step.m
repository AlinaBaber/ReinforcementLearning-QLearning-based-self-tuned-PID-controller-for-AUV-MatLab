function [curr_state,rewards]=step(vel,E,TTf,T,TT,previous_state)
%vel=action(1:9);
%TTf=action(10:14);
k1 = AUV(vel,TTf);
k2 = AUV(vel+0.5.*T.*k1,(TT+TTf)./2);
k3 = AUV(vel+0.5.*T.*k2,(TT+TTf)./2);
k4 = AUV(vel+T.*k3,TTf);
velf = vel+T/6*(k1+2*k2+2*k3+k4);
%J=J'%J^-1==J'
J=[cos(velf(9))*cos(velf(8)),-sin(velf(9))*cos(velf(7))+cos(velf(9))*sin(velf(8))*sin(velf(7)),sin(velf(9))*sin(velf(7))+cos(velf(9))*sin(velf(8))*cos(velf(7));
  sin(velf(9))*cos(velf(8)),cos(velf(9))*cos(velf(7))+sin(velf(9))*sin(velf(8))*sin(velf(7)), -cos(velf(9))*sin(velf(7))+sin(velf(9))*sin(velf(8))*cos(velf(7));
        -sin(velf(8)),            cos(velf(8))*sin(velf(7)),                                        cos(velf(8))*cos(velf(7))                                        ];
EVf = double((J*[velf(1),velf(2),velf(3)]')') ;
E = E+EVf*T;
curr_state=E;
rewards=reward(previous_state,curr_state);