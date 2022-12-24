,%% AUV Solving Using Q-learning Algorithm

%% Let's create a AUV
% * Size of AUV denoted by n
%%
n = 600;
%% 
% * Randomly Generating Path/Links
AUV = -50*ones(n,n);
for i=1:(n-3)*n
    AUV(randi([1,n]),randi([1,n]))=1;
end
%% 
% * Starting Node
AUV(1,1) = 1;
%% 
% * Goal
AUV(n,n) = 10;
%% 
% _For a stored solvable AUV uncomment following:_
% load('AUV12x12.mat');
%% 
% Display AUV in matrix form is:
disp(AUV)
%% Visualizing the AUV
% * Check for atleast one path between Start & Goal
% * Dimension of AUV 12x12 i.e., n=12
% * Starting Position is (1,1)
% * Goal is to reach (12,12)
%%
n=length(AUV);
figure
imagesc(AUV)
colormap(winter)
for i=1:n
    for j=1:n
        if AUV(i,j)==min(AUV)
            text(j,i,'X','HorizontalAlignment','center')
        end
    end
end
text(1,1,'START','HorizontalAlignment','center')
text(n,n,'GOAL','HorizontalAlignment','center')
axis off
Goal=n*n;
fprintf('Goal State is: %d',Goal)
%% Creating Reward Matrix for the AUV
% Possible actions are:
% 
% * Up      :  (i-n)
% * Down :  (i+n)
% * Left    :  (i-1)
% * Right  :  (i+1)
% * Diagonally SE  :  (i+n+1)
% * Diagonally SW :  (i+n-1)
% * Diagonally NE  :  (i-n+1)
% * Diagonally NW :  (i-n-1)
% 
% Reward  is - $\infty$ (i.e. No reward) for any other actions. Thus any 
% other action other then above action will not occur.
%%
reward=zeros(n*n);
for i=1:Goal
    reward(i,:)=reshape(AUV',1,Goal);
end
for i=1:Goal
    for j=1:Goal
        if j~=i-n  && j~=i+n  && j~=i-1 && j~=i+1 && j~=i+n+1 && j~=i+n-1 && j~=i-n+1 && j~=i-n-1
            reward(i,j)=-Inf;
        end    
    end
end
for i=1:n:Goal
    for j=1:i+n
        if j==i+n-1 || j==i-1 || j==i-n-1
            reward(i,j)=-Inf;
            reward(j,i)=-Inf;
        end
    end
end
%% Q-Learning algorithm
% 
% 
% FIGURE 4: Q-learning: An off-policy TD control algorithm <http://web.stanford.edu/class/psych209/Readings/SuttonBartoIPRLBook2ndEd.pdf 
% (Refer to Reinforcement Learning: An Introduction)>
% 
% In this chunk we,
% 
% # Initialize the Q-matrix.
% # Set the goal state to be 'n*n'. 
% # Set Discount factor $\gamma =0\ldotp 9$ <https://ipfs.io/ipfs/QmXoypizjW3WknFiJnKLwHCnL72vedxjQkDDP1mXWo6uco/wiki/Q-Learning.html 
% (Influence of variables on the algorithm)>
% # Learning rate, $\alpha =0\ldotp 2$ (Selected after several runs)
% # Set maximum number of iterations
%%
q = randn(size(reward));
gamma = 0.9;
alpha = 0.2;
maxItr = 50;
%% 
% * cs $\Rightarrow$ current state
% * ns $\Rightarrow$ next state
% 
% _Repeat until Convergence OR Maximum Iterations_
for i=1:maxItr
    
    % Starting from start position    
    cs=1;
    
    % Repeat until Goal state is reached
    while(1)
        
    % possible actions for the chosen state
    n_actions = find(reward(cs,:)>0);
    % choose an action at random and set it as the next state
    ns = n_actions(randi([1 length(n_actions)],1,1));
       
            % find all the possible actions for the selected state
            n_actions = find(reward(ns,:)>=0);
            
            % find the maximum q-value i.e, next state with best action
            max_q = 0;
            for j=1:length(n_actions)
                max_q = max(max_q,q(ns,n_actions(j)));
            end
            
            % Update q-values as per Bellman's equation
            q(cs,ns)=reward(cs,ns)+gamma*max_q;
            
            % Check whether the episode has completed i.e Goal has been reached
            if(cs == Goal)
                break;
            end
            
            % Set current state as next state
            cs=ns;
    end
end
%% Solving the AUV
% * Starting from the first postion
%%
start = 1;
move = 0;
path = start;
%% 
% * Iterating until Goal-State is reached
while(move~=Goal)
    [~,move]=max(q(start,:));
    
    % Deleting chances of getting stuck in small loops  (upto order of 4)  
    if ismember(move,path)
        [~,x]=sort(q(start,:),'descend');
        move=x(2); 
        if ismember(move,path)
            [~,x]=sort(q(start,:),'descend');
            move=x(3);
            if ismember(move,path)
                [~,x]=sort(q(start,:),'descend');
                move=x(4);
                if ismember(move,path)
                    [~,x]=sort(q(start,:),'descend');
                    move=x(5);
                end
            end
        end
    end
    
    % Appending next action/move to the path
    path=[path,move];
    start=move;
end
%% Solution of AUV 
% i.e, Optimal Path between START to GOAL
%%
fprintf('Final path: %s',num2str(path))
fprintf('Total steps: %d',length(path))
% reproducing path to matrix path
pmat=zeros(n,n);
[q, r]=quorem(sym(path),sym(n));
q=double(q);r=double(r);
q(r~=0)=q(r~=0)+1;r(r==0)=n;
for i=1:length(q)
    pmat(q(i),r(i))=50;
end  
%% Final Plot of the AUV
%%
figure
imagesc(pmat)
colormap(white)
for i=1:n
    for j=1:n
        if AUV(i,j)==min(AUV)
            text(j,i,'X','HorizontalAlignment','center')
        end
        if pmat(i,j)==50
            text(j,i,'\bullet','Color','red','FontSize',28)
        end
    end
end
text(1,1,'START','HorizontalAlignment','right')
text(n,n,'GOAL','HorizontalAlignment','right')
hold on
imagesc(AUV,'AlphaData',0.2)

colormap(winter)
hold off
axis off

%% Thus, we solved the AUV and optimal path has been shown.
figure
plot(pmat)
hold on
%colormap(white)
for i=1:n
    for j=1:n
        if AUV(i,j)==min(AUV)
            plot(j,i,'-','HorizontalAlignment','center')
        end
        if pmat(i,j)==50
            text(j,i,'-','Color','red','FontSize',28)
        end
    end
end
%text(1,1,'START','HorizontalAlignment','right')
%text(n,n,'GOAL','HorizontalAlignment','right')
hold on
plot(AUV,'AlphaData',0.2)

%colormap(winter)
hold off
axis off