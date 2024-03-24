clf, clc, clearvars, close all
x = logspace(-2, 2, 1000);

Tx = abs((1 - 2*log(x) - 3*x.^5) ./ (log(x) - x.^5));
Ka1 = 4 * abs(log(x) ./ (log(x) - x.^5)) + 2 * abs(x.^5 ./(log(x) - x.^5));
Ka2 = 4 * abs(log(x) ./ (log(x) - x.^5)) + 4 * abs(x.^5 ./(log(x) - x.^5));


hold on;
plot(x, Tx, 'Color', 'red', 'LineWidth', 1.5);
plot(x, Ka1, 'Color', 'blue', 'LineWidth',1.5);
plot(x, Ka2, 'Color', 'green', 'LineWidth',1.5);
xscale('log')
yscale('log')
legend('Tx', 'Ka1', 'Ka2'), xlabel('x'), ylabel('σ'), title('Task 5')