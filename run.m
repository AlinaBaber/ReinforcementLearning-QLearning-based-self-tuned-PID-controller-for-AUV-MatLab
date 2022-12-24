function run()
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
%runs episodes until mean reward of last 100 consecutive episodes is atleast self.solved_t
env.seed(0)
rand(0)
%counter = 0
scores = [];  % Allocate empty array
maxlen = 1e3; % Max length of buffer/queue
% A loop example for illustration
for i = 1:maxlen
    x = 0;                           % Data to append
    scores = [scores(max(end-n+1+length(x),1):end) x]; % Append to end, remove from front if needed
end

total_epochs = 0;
total_penalties = 0;

for episode=1:n_episodes
    done = 0;
    alpha = get_alpha(min_alpha, episode_number);
    epsilon = get_epsilon(min_epsilon, episode_number);
    epochs=0;
    penalties=0;
    episode_reward = 0;
    obs = env.reset();
    curr_state = discretize_state(obs);
    %curr_state = obs
    while done==0
    env.render();
    action = select_action(curr_state, epsilon);
    obs, reward, done, info = env.step(action);        
    new_state = discretize_state(obs);
    update_table(curr_state, action, reward, new_state, alpha);
    curr_state = new_state;
    episode_reward=episode_reward+ reward;
    if reward == -10
       penalties=penalties + 1;
    end
    epochs=epochs+ 1;
    total_penalties=total_penalties+ penalties;
    total_epochs=total_epochs+ epochs;
    end
    scores.append(episode_reward);
    mean_reward = mean(scores);
    if mean_reward > solved_t && (episode + 1) >= 100
    episode=episode + 1;
    episode_remaining=episode + 1 - 100;
    elseif (episode + 1) % 50 == 0 and (episode + 1) >= 100:
    episode=episode + 1;
    else
    episode=episode + 1;
    end
end
Average_timesteps_per_episode=total_epochs / episode;
Average_penalties_per_episode=total_penalties / episode;