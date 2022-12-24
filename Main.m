global buckets;  %discrete values for each feature space dimension
%(position, velocity, angle, angular velocity)
global n_episodes;  % training episodes
global min_alpha;
global initial_lr;  %Learning rate
global min_lr;
global min_epsilon;
global gamma;  % discount factor
global solved_t;  % lower bound before episode ends
global Q_table;  % action space (left, right)
global env;

buckets= buckets_;  %discrete values for each feature space dimension
%(position, velocity, angle, angular velocity)
n_episodes= n_episodes_;  % training episodes
min_alpha=min_alpha_;
initial_lr=initial_lr_;  %Learning rate
min_lr=min_lr_;
min_epsilon = min_epsilon_;
gamma = gamma_;% discount factor
solved_t = solved_t_; % lower bound before episode ends
Q_table = zeros(20,20,3);  % action space (left, right)
env = AUVENV;
run()