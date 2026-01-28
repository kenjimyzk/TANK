% parameters
gamma = 1;
tau = 0.2;
tauD = tau;
varphi = 1;

% xi range (adjust as needed; avoid xi = -gamma to prevent division by zero)
xi_min = -gamma * varphi / (varphi + 1);
xi_max = 5;
xi = linspace(xi_min, xi_max, 500);

% lambda formula (xi-dependent)
lambda = (gamma * (1 + tau * varphi) + tau * xi * (varphi + 1)) ./ ...
  ((gamma + xi) * (varphi + 1));

% lambda formula (requested alternative)
lambda_alt = tau + (gamma * (1 - tauD)) ./ ...
  (gamma * (gamma + varphi) + xi * (varphi + 1) + gamma);

% plot
figure;
plot(xi, lambda, '-', 'LineWidth', 1.5);
hold on;
plot(xi, lambda_alt, '--', 'LineWidth', 1.5);
xlabel('\xi');
ylabel('\lambda');
grid on;
xlim([xi_min xi_max]);
ylim([0 1]);
yline(tau, '--', '\lambda=\tau', 'LabelHorizontalAlignment', 'left');
xline(0, '--', '\xi=0', 'LabelHorizontalAlignment', 'left');
legend('benchmark Economy', 'Common-hours Union Economy', 'Location', 'best');
