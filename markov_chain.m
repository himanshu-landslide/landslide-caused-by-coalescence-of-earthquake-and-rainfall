%% markov chain sequencing %%
transition_probabilities = [0.238 0.721 0.0367 0.004;0.159 0.742 0.088 0.009;0.088 0.5625 0.273 0.0757; 0.0161 0.306 0.387 0.290]; % 4 by 4 matrix %
starting_value = 1; % value either 1 0r 2 %
chain_length = 100;
chain = zeros(1,chain_length);
chain(1)=starting_value;
for i=2:chain_length
        this_step_distribution = transition_probabilities(chain(i-1),:);
        cumulative_distribution = cumsum(this_step_distribution);
r = rand();
chain(i) = find(cumulative_distribution>r,1);
end  
%% transition probability  plot %%
mc = dtmc(transition_probabilities );
figure
graphplot(mc,'ColorNodes',true,'ColorEdges',true)