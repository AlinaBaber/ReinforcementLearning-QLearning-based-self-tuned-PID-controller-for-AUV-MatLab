scores = [];  % Allocate empty array
maxlen = 100; % Max length of buffer/queue
% A loop example for illustration
for i = 1:1e3
    x = 0;                           % Data to append
    scores = [scores(max(end-n+1+length(x),1):end) x]; % Append to end, remove from front if needed
end