% parameters
gamma = 1;
tau = 0.2;
varphi = 1;
alpha = 0.;
Phi = 0.;

% xi range (adjust as needed; avoid xi = -gamma to prevent division by zero)
xi_min = -gamma * varphi / (varphi + 1);
xi_max = 5;
xi = linspace(xi_min, xi_max, 500);

% Xi terms (expanded with Phi)
Xi1 = ((1 - alpha) * gamma + varphi) / ((1 - alpha) * (gamma + varphi)) * ...
  ((1 + varphi) + (1 - Phi) * (1 - alpha) * (gamma - 1));
common_term = ((1 - alpha) * gamma + varphi) * (1 - Phi) - Phi;
Xi2 = (varphi + gamma * (1 - Phi) * (1 - alpha)) / (gamma + varphi) * common_term;
Xi3 = (gamma * varphi) / (gamma + varphi) * common_term;

% kappa as a function of xi (as specified)
kappa = ((varphi + 1) / ((1 + varphi) + (1 - alpha) * (gamma - 1))) * xi;

% lambda formula (as specified)
tilde_alpha = (alpha * varphi) / ((1 - alpha) * (gamma + varphi));

lambda = (gamma + tau * (kappa .* Xi2 + Xi3)) ./ ...
  (gamma * (1 + tilde_alpha) * (1 + varphi) + kappa .* Xi1);

% lambda formula (requested alternative)
term = (gamma + kappa .* Phi) ./ (gamma + kappa);
num_alt = tau * common_term + term;
den_alt = (gamma + (varphi + alpha) / (1 - alpha)) + term;
lambda_alt = num_alt ./ den_alt;

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
