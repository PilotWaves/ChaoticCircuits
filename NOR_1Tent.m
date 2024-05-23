tic

mu = 2;
nu = 1/(1+mu);

x1 = [nu-1:.01:nu-1/2];
x2 = [nu-1/2:.01:nu];

y1 = -1 + nu + mu*(1+x1-nu);
y2 = -1 + nu + mu*(nu-x2);

x = [x1 x2];

set(0,'DefaultAxesFontSize',20)
tiledlayout(3,1);

nexttile([2,1]);

plot(x,x, 'Color', [0.8500 0.3250 0.0980], 'linewidth', 4);
hold on
plot(x1,y1, x2,y2, 'Color', [0 0.4470 0.7410], 'linewidth',4);
xlabel('Voltage in');
ylabel('Voltage out')
hold on


x_ts = [1:100]*0;
y_ts = x_ts;

x = -0.1*exp(1);

    if x <= nu - 1/2
        y = -1 + nu + mu*(1+x-nu);
    else
        y = -1 + nu + mu*(nu-x);
    end


x_ts(1) = 0;
y_ts(1) = x;
x_ts(2) = 1;
y_ts(2) = y;


for i = 2:length(x_ts)-1

    plot([x,y], [y,y], 'Color', [0.15,0.15,0.15])
    hold on

    x = y;

    if x <= nu - 1/2
        y = -1 + nu + mu*(1+x-nu);
    else
        y = -1 + nu + mu*(nu-x);
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