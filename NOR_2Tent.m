tic

mu = 3.2;
nu = 2*mu/(1+mu^2);

x1 = [-nu*mu:.01:-nu];
x2 = [-nu:.01:nu];
x3 = [nu:.01:nu*mu];

y1 = (1+mu)*x1/(1-mu) + (nu + mu*nu)/(1-mu) - mu*nu;
y2 = mu*x2;
y3 = (1+mu)*x3/(1-mu) - (nu + mu*nu)/(1-mu) + mu*nu;

x = [x1 x2 x3];

set(0,'DefaultAxesFontSize',20)

tiledlayout(3,1);

nexttile([2,1]);

plot(x,x, 'Color', [0.8500 0.3250 0.0980], 'linewidth', 4)
hold on
plot(x1,y1, x2,y2, x3,y3, 'Color', [0 0.4470 0.7410], 'linewidth',4);
xlabel('Voltage in');
ylabel('Voltage out');
hold on


x_ts = [1:100]*0;
y_ts = x_ts;

x = 0.1;

if x <= -nu
    y = (1+mu)*x/(1-mu) + (nu + mu*nu)/(1-mu) - mu*nu;
elseif x > -nu && x < nu
    y = mu*x;
else
    y = (1+mu)*x/(1-mu) - (nu + mu*nu)/(1-mu) + mu*nu;
end


x_ts(1) = 0;
y_ts(1) = x;
x_ts(2) = 1;
y_ts(2) = y;

for i = 2:length(x_ts)-1

    plot([x,y], [y,y], 'Color', [0.15,0.15,0.15], 'linewidth', 0.5)
    hold on

    x = y;

    if x <= -nu
        y = (1+mu)*x/(1-mu) + (nu + mu*nu)/(1-mu) - mu*nu;
    elseif x > -nu && x < nu
        y = mu*x;
    else
        y = (1+mu)*x/(1-mu) - (nu + mu*nu)/(1-mu) + mu*nu;
    end

    x_ts(i+1) = i;
    y_ts(i+1) = y;

    plot([x,x], [x,y], 'Color', [0.15,0.15,0.15], 'linewidth', 0.5)
    hold on

end

xlabel('x_n')
ylabel('x_{n+1}')
hold off

nexttile([1,1]);
plot(x_ts,y_ts,'linewidth',2)
xlabel('n')
ylabel('x_n')

toc