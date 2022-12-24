function action=select_action( state, epsilon,TTf)
global Q_table;  % action space (left, right)
%global env;
%implement the epsilon-greedy approach
if rand(1) <= epsilon
   action =TTf; % sample a random action with probability epsilon
else
   action = max(Q_table(state)); % choose greedy action with hightest Q-value
end