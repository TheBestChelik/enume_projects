clf, clc, clearvars, close all

x = logspace(-2, 2, 10000);
y = (log(x)./x.^2 )-(x.^3);

% Maximum error method 1
Ka1 = 4 * abs(log(x) ./ (log(x) - x.^5)) + 2 * abs(x.^5 ./(log(x) - x.^5));
max_abs_error_a1 = abs(y .* Ka1 .* double(eps(single(1))) ./ 2); 
max_rel_error_a1 = abs(max_abs_error_a1 ./ y);

% Real error method 1
v1 = double(single(log(x)));
v2 = double(single(x .^2));
v3 = double(single(v1 ./ v2));
v4 = double(single(x.^3));
ys_a1 = double(single(v3 - v4));
abs_error_a1 = abs(y - ys_a1);
rel_error_a1 = abs(abs_error_a1 ./ y);

% Maximum error method 2
Ka2 = 4 * abs(log(x) ./ (log(x) - x.^5)) + 4 * abs(x.^5 ./(log(x) - x.^5));
max_abs_error_a2 = abs(y .* Ka2 .* double(eps(single(1))) ./ 2); 
max_rel_error_a2 = abs(max_abs_error_a2 ./ y);

% Real error method 2
v1 = double(single(log(x)));
v2 = double(single(x .^5));
v3 = double(single(v1 - v2));
v4 = double(single(x .^2));
ys_a2 = double(single(v3 ./ v4));
abs_error_a2 = abs(y - ys_a2);
rel_error_a2 = abs(abs_error_a2 ./ y);

sgtitle('Task 4') 
% Plot errors
subplot(1,2,1)
hold on;
plot(x, rel_error_a1, 'Color', 'red', 'LineWidth', 1.5);
plot(x, max_rel_error_a1, 'Color', 'blue', 'LineWidth',1.5);
xscale('log')
yscale('log')
legend('real error', 'maximum error'), xlabel('x'), ylabel('σ'), title('A1')
hold off


subplot(1,2,2)
hold on;
plot(x, rel_error_a2, 'Color', 'red', 'LineWidth', 1.5);
plot(x, max_rel_error_a2, 'Color', 'blue', 'LineWidth',1.5);
xscale('log')
yscale('log')
legend('real error', 'maximum error'), xlabel('x'), ylabel('σ'), title('A2')
hold off