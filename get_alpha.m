function alpha = get_alpha(min_alpha, episode_number)
%choose decaying alpha in range [min_alpha, 1]
%return  max(self.min_lr,self.initial_lr * (0.85 ** (episode_number//100)))
alpha=max(min_alpha, min(1, 1 - log10((episode_number + 1) / 25)))
