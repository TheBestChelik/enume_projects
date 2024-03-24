x = logspace(-2, 2, 1000);
y = (log(x)./x.^2 )-(x.^3);

% Maximum error
Tx = (1 - 2*log(x) - 3*x.^5) ./ (log(x) - x.^5);
max_abs_error = abs(y .* Tx .* double(eps(single(1))) / 2); 
max_rel_error = abs(max_abs_error ./ y) ;

% Real error
ys = (log(double(single(x)))./double(single(x)).^2 )-(double(single(x)).^3);
abs_error = abs(y - ys);
rel_error = abs(abs_error ./ y);


% Plot errors
plot(x, rel_error, 'Color', 'red', 'LineWidth', 1.5);
hold on;
plot(x, max_rel_error, 'Color', 'blue', 'LineWidth',1.5);
xscale('log')
yscale('log')
legend('real error', 'maximum error'), xlabel('x'), ylabel('σ'), title('Task 2')