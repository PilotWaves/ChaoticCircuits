tic

set(0,'DefaultAxesFontSize',20)

for mu = [1:0.01:16].^(1/4)
nu = 1/(1+mu);

x = -nu/10;

for i = 1:300

    if x <= nu - 1/2
        y = -1 + nu + mu*(1+x-nu);
    else
        y = -1 + nu + mu*(nu-x);
    end

    x = y;

end

x_bif = [1:10*mu^3]*0;
N = length(x_bif);

for i = 1:N

    if x <= nu - 1/2
        y = -1 + nu + mu*(1+x-nu);
    else
        y = -1 + nu + mu*(nu-x);
    end

    x = y;

    x_bif(i) = x;
end


%       if round(x_bif(N),4) == round(x_bif(N-1),4)
%           Col = [0.4660, 0.6740, 0.1880]; %green
%           plot(mu,x_bif,'.', 'Color', Col, 'MarkerSize', 1)
%           hold on
%       elseif round(x_bif(N),4) == round(x_bif(N-2),4)
%           Col = [0, 0.4470, 0.7410]; %blue
%           plot(mu,x_bif,'.', 'Color', Col, 'MarkerSize', 2)
%           hold on
%       elseif round(x_bif(N),4) == round(x_bif(N-4),4)
%           Col = [0.9290, 0.6940, 0.1250]; %yellow
%           plot(mu,x_bif,'.', 'Color', Col, 'MarkerSize', 4)
%           hold on
%       elseif round(x_bif(N),4) == round(x_bif(N-8),4)
%           Col = [0.4940 0.1840 0.5560]; %purple
%           plot(mu,x_bif,'.', 'Color', Col, 'MarkerSize', 6)
%           hold on
%       elseif round(x_bif(N),4) == round(x_bif(N-3),4)
%           Col = [1, 0, 0]; %red
%           plot(mu,x_bif,'.', 'Color', Col, 'MarkerSize', 10)
%           hold on
%       else
%           %if randi([0, 1]) == 1
%           Col = [0.3, 0.3, 0.3]; %black
%           %else
%           %    Col = [0.3010, 0.7450, 0.9330];
%           %end
%           plot(mu,x_bif,'.', 'Color', Col, 'MarkerSize', 0.5)
%           hold on
%       end

plot(mu, x_bif, '.', 'Color', [0.32, 0.32, 0.32], 'markersize', 0.5)
%xticks([0, 0.2, 0.4, 0.6, 0.8, 1])
%xticklabels({'0', '1/5K', '2/5K', '3/5K', '4/5K', '1/K'})
hold on

end

ylabel('Threshold Voltage')
xlabel('Slope \mu')
axis([1 2 nu-1 nu])
hold off

toc