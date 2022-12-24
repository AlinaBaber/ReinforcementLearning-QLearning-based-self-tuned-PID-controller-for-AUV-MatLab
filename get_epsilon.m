function epsilon=get_epsilon(min_epsilon, episode_number)
%choose decaying epsilon in range [min_epsilon, 1]
epsilon=max(min_epsilon, min(1, 1 - log10((episode_number + 1) / 25)))