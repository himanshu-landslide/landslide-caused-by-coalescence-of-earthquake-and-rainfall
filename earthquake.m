%% earthquake induced landslide %%
% landslide modelled as poisson process, for one realisation %
data = xlsread('C:\Users\DLLL\Desktop\matlab_results\multi_2\rainfall.xlsx','Sheet2');
chain = data(1:100,1); % sequence of earthquake events for one realisation %
phi1 = [0 0.0336 0.0420 0.0336]; % arrival rate of different states %
k = 1;
t0 = 0; % initial year %
ti = 0;
for j = 1:length(chain)
a = 10^-6; % transfer function parameters %
b = 350; % transfer function parameters %
r = rand(1); % uniform random variable %
t = round(D(j)); % round to nearest whole number %
if chain(j)== 1
p1 = phi1(1);
elseif chain(j)== 2
p1 = phi1(2);
elseif chain(j)== 3
p1 = phi1(3);
else
p1 = phi1(4);
end
if p1 > r
yt(k,1) = 20; % slope mobility function %
time(k,1) = ti; % times at which landslides occur %
tau(k,1) = ti-t0; % reaccurence interval %
t0 = ti;
k = k+1;
else
end
ti = ti+1; % time %
end