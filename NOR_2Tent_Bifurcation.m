tic

set(0,'DefaultAxesFontSize',20)

for mu = [1:0.005:3.5]
nu = 2*mu/(1+mu^2);


x = nu/10;

for i = 1:500

if x <= -nu
    y = (1+mu)*x/(1-mu) + (nu + mu*nu)/(1-mu) - mu*nu;
elseif x > -nu && x < nu
    y = mu*x;
else
    y = (1+mu)*x/(1-mu) - (nu + mu*nu)/(1-mu) + mu*nu;
end

x = y;

end

x_bif = [1:100]*0;
N = length(x_bif);

for i = 1:N

if x <= -nu
    y = (1+mu)*x/(1-mu) + (nu + mu*nu)/(1-mu) - mu*nu;
elseif x > -nu && x < nu
    y = mu*x;
else
    y = (1+mu)*x/(1-mu) - (nu + mu*nu)/(1-mu) + mu*nu;
end

    x = y;

    x_bif(i) = x;
end


      if round(x_bif(N),4) == round(x_bif(N-1),4)
          Col = [0.4660, 0.6740, 0.1880]; %green
          plot(mu,x_bif,'.', 'Color', Col, 'MarkerSize', 1)
          hold on
      elseif round(x_bif(N),4) == round(x_bif(N-2),4)
          Col = [0, 0.4470, 0.7410]; %blue
          plot(mu,x_bif,'.', 'Color', Col, 'MarkerSize', 2)
          hold on
      elseif round(x_bif(N),4) == round(x_bif(N-4),4)
          Col = [0.9290, 0.6940, 0.1250]; %yellow
          plot(mu,x_bif,'.', 'Color', Col, 'MarkerSize', 4)
          hold on
      elseif round(x_bif(N),4) == round(x_bif(N-8),4)
          Col = [0.4940 0.1840 0.5560]; %purple
          plot(mu,x_bif,'.', 'Color', Col, 'MarkerSize', 6)
          hold on
      elseif round(x_bif(N),4) == round(x_bif(N-3),4)
          Col = [1, 0, 0]; %red
          plot(mu,x_bif,'.', 'Color', Col, 'MarkerSize', 10)
          hold on
      else
          %if randi([0, 1]) == 1
          Col = [0.3, 0.3, 0.3]; %black
          %else
          %    Col = [0.3010, 0.7450, 0.9330];
          %end
          plot(mu,x_bif,'.', 'Color', Col, 'MarkerSize', 0.5)
          hold on
      end



% plot(mu, x_bif, '.', 'Color', [0.32, 0.32, 0.32], 'markersize', 0.5)
% hold on

end

ylabel('Threshold Voltage')
xlabel('Slope \mu')
axis([1 3.5 -mu*nu mu*nu])
hold off

toc