% Define the range of x values
x = logspace(-2, 2, 1000);


y = (log(x)./x.^2 )-(x.^3);

Tx = abs((1 - 2*log(x) - 3*x.^5) ./ (log(x) - x.^5));
max_abs_error = y .* Tx .* eps(single(1)) / 2; 
max_rel_error = abs(max_abs_error ./ y) ;


ys = (log(double(single(x)))./double(single(x)).^2 )-(double(single(x)).^3);
abs_error = abs(y - ys);
rel_error = abs(abs_error ./ y);


% Plot the function
loglog(x, rel_error, 'r');
hold on;
loglog(x, max_rel_error, 'b');
xlabel('x');
ylabel('y');
title('HUI');
grid on;