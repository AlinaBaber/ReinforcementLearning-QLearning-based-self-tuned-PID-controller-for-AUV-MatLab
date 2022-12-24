function curr_state =discretize_state(state)
global bucket; 
interval = zeros(size(state));
max_range = [30, 30,30] ;  %[4.8,3.4*(10**38),0.42,3.4*(10**38)]
data = [];
for i=1: size(state)
   data(i)=state(i);
   inter = round(floor((data + max_range(i)) / (2 * max_range(i) / bucket(:,i))));
   if inter >= bucket(i)
      interval(i) = bucket(i) - 1;
   elseif inter < 0
      interval(i) = 0;
   else
      interval(i) = inter;
   end
end
curr_state= interval;