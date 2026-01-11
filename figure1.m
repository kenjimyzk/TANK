% parameters
gamma = 1;
tau = 0.2;
phi = 1;

% xi range (adjust as needed; avoid xi = -gamma to prevent division by zero)
xi_min = -gamma * phi / (phi + 1);
xi_max = 5;
xi = linspace(xi_min, xi_max, 500);

% lambda formula
lambda = (gamma*(1 + tau*phi) + tau*xi*(phi + 1)) ./ ((gamma + xi) * (phi + 1));

% gamma = 2 case
gamma2 = 2;
lambda2 = (gamma2*(1 + tau*phi) + tau*xi*(phi + 1)) ./ ((gamma2 + xi) * (phi + 1));

% phi = 2 case (gamma = 1)
phi2 = 2;
lambda_phi2 = (gamma*(1 + tau*phi2) + tau*xi*(phi2 + 1)) ./ ((gamma + xi) * (phi2 + 1));

% plot
figure;
plot(xi, lambda, '-', 'LineWidth', 1.5);
hold on;
plot(xi, lambda2, '--', 'LineWidth', 1.5);
plot(xi, lambda_phi2, ':', 'LineWidth', 1.5);
xlabel('\xi');
ylabel('\lambda');
grid on;
xlim([xi_min xi_max]);
ylim([0 1]);
yline(tau, '--', '\lambda=\tau', 'LabelHorizontalAlignment', 'left');
xline(0, '--', '\xi=0', 'LabelHorizontalAlignment', 'left');
legend('\gamma=1,\phi=1', '\gamma=2,\phi=1', '\gamma=1,\phi=2', 'Location', 'best');
