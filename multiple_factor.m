%% landslide induced by multiple factors %%
% landslide modelled as poisson process, for one realisation %
data = xlsread('C:\Users\DLLL\Desktop\matlab_results\multi_2\rainfall.xlsx','Sheet1');
I = data(1:13347,4); % rainfall intensity in mm/day %
D = data(1:13347,5); % rainfall duration in days %
tr = (((I/240).*((D*24)+0.75).^0.94)/7.206).^(1/0.156); % return period in years %
k = 1;
t0 = 0; % initial year %
ti = 0;
data1 = xlsread('C:\Users\DLLL\Desktop\matlab_results\multi_2\rainfall.xlsx','Sheet2');
chain = data1(1:100,1); % sequence of earthquake events for one realisation %
phi1 = [0 0.0336 0.0420 0.0336]; % arrival rate of different states %
for j = 1:length(tr)
lambda = 1/(tr(j));
a = 1; % transfer function parameters %
b = 15; % transfer function parameters %
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
if lambda > r && p1 > r
pr = lambda; % prob that triggering rainfall will occur %
per = 1/24.33; % prob that rainfall and earthquake occurs with 15 days in a year %
cp = per/pr; % conditional prob %
if cp > r
yt(k,1) = 20; % slope mobility function %
time(k,1) = ti; % times at which landslides occur %
tau(k,1) = ti-t0; % reaccurence interval %
t0 = ti;
k = k+1;
else
end
else
end
ti = ti+1; % time %
end