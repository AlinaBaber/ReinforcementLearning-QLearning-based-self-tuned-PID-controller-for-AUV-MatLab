function [rewards]=reward(previous_state,current_state)
path=[ 0 ,0 ,10;
       10 , 10 , 20;
       0 , 20, 20;
       10 , 30,20 ;
       20 , 30, 20 ;
       30 , 20, 20 ;
       20, 10, 20;
       7,10,20
    ];
Error = max(current_state-previous_state);
Errors=[ path(1,1,1)-current_state;
       path(1,1,1)-current_state;
       path(1,1,1)-current_state;
       path(1,1,1)-current_state ;
       path(1,1,1)-current_state ;
       path(1,1,1)-current_state ;
       path(1,1,1)-current_state;
       path(1,1,1)-current_state];

for i=1:8
   
   if Error< 0.5 || Errors(i)< 0.5
    rewards = 1
   else
    rewards =0
   end
end


