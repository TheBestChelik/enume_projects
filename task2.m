clc, clearvars, close all

epsilon  = double(eps("single")/2);
x = logspace(-2, 2, 1000);
y_double = (log(x) ./ x.^2 )-(x.^3);

% Calculation maximum possible absolute and relative errors
Tx = (1 - 2*log(x) - 3*x.^5) ./ (log(x) - x.^5);
max_delta = abs(y_double .* Tx .* epsilon); 
max_sigma = abs(max_delta ./ y_double) ;

% Calculate true error, due to uncertainty  of x
y_single = (log(double(single(x)))./double(single(x)).^2 )-(double(single(x)).^3);
delta = abs(y_double - y_single);
sigma = abs(delta ./ y_double);


% Plot the results
figure(1)
hold on
plot(x, sigma, 'Color', 'red', 'LineWidth', 1.5);
plot(x, max_sigma, 'Color', 'blue', 'LineWidth',1.5);
xscale('log')
yscale('log')
legend('|σ(ỹ)|', 'max(|σ(ỹ)|)'), xlabel('x'), ylabel('σ'), title('Task 2')
hold off