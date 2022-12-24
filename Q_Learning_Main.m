
global bucket;
bucket =[zeros(1,9),zeros(1,5)];
global n_episodes;
n_episodes=6000;
global target_state
target_state=[7,10,20];
global min_epsilon;
min_epsilon=0.1;
global min_alpha;
min_alpha=0.1;
global gamma;
gamma=0.99;
global state
state=[0,0,10]
global Q_table;
global reward;
total=[bucket,state]
Q_table=zeros(6000,18)
global action;
action =zeros(1,14);

%runs episodes until mean reward of last 100 consecutive episodes is atleast self.solved_t
%env.seed(0)
rand(0)
%counter = 0

maxlen = 1e3; % Max length of buffer/queue
scores = zeros(1,maxlen);  % Allocate empty array
% A loop example for illustration


total_epochs = 0;
total_penalties = 0;
for episode_number=1:n_episodes
    done = 0;
    alpha = get_alpha(min_alpha, episode_number);
    epsilon = get_epsilon(min_epsilon, episode_number);
    epochs=0;
    penalties=0;
    episode_reward = 0;
    %obs = env.reset();
    curr_state =discretize_state(state);
    %curr_state = obs
    action =[vel,TTf];
    while done==0
    previous_state = curr_state;
    action = select_action(curr_state, epsilon,action);
    obs, reward = step(vel,TTf,T,TT,previous_state);        
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
 