%% rainfall intensity and duration values %%
D = 10;
j = 1;
while D < 100
I = 43.5*D^(-0.368); % threshold in mm/day %
tr = (((I/240).*((D*24)+0.75).^0.94)/7.206).^(1/0.156); % return period in years %
k = D-10;
u = k+1;
if D>10
t = linspace(10,D,150); % in days %
else
t = linspace(10,D,u); % in days %
end
i = ((7.206*tr^0.156)./((t*24)+0.75).^0.94)*240; % intensity in mm/day %
for l = 1:length(t)
    if i(l)> I || i(l)==I
        r(j)= i(l); % rainfall intensity in mm/day %
        y(j) = t(l); % rainfall duration in days %
        j = j+1;
    else
    end
end
D = D+1;
end
%% landslide modelled as poisson process %%
data = xlsread('C:\Users\DLLL\Desktop\matlab_results\multi_2\rainfall.xlsx','Sheet1');
I = data(1:13347,4); % rainfall intensity in mm/day %
D = data(1:13347,5); % rainfall duration in days %
tr = (((I/240).*((D*24)+0.75).^0.94)/7.206).^(1/0.156); % return period in years %
k = 1;
t0 = 0; % initial year %
ti = 0;
for j = 1:length(tr)
lambda = 1/(tr(j));
a = 1; % transfer function parameters %
b = 15; % transfer function parameters %
r = rand(1); % uniform random variable %
t = round(D(j)); % round to nearest whole number %
if lambda > r
for i = 1:t
rain(i,1) = I(j);
end
dr = 1:t; % duration of rainfall %
g = gampdf(dr,a,b); % transfer fuction %
w = conv(rain,g);
h = w(1:t);
yt(k,1) = max(h); % slope mobility function %
time(k,1) = ti; % times at which landslides occur %
tau(k,1) = ti-t0; % reaccurence interval %
t0 = ti;
k = k+1;
else
end
ti = ti+1; % time %
end
%% slope mobility function %%
ti = 1:13347;
mf = data(1:9,10); % mobility function values %
rtime = data(1:9,8); % times of landslide occurences %
for i = 1:length(ti)
    ri = find(rtime==i);
    if i == rtime(ri)
        ytf(i,1) = mf(ri);
    else
        ytf(i,1) = 0;
    end
end
rt = ytf(1:3500); % yt %
t = ti(1:3500);
for i = 1:length(t)
yc(i) = 12.84; % critical threshold of mobility function %
end



    
