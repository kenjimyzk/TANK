% parameters
gamma = 1.0;
gamma2 = 1.5;
tau = 0.2;
varphi = 1;
Phi = 0.2;
Phi2 = 0;
alpha_min = 0;
alpha_max = 0.4;
alpha = linspace(alpha_min, alpha_max, 500);

% lambda formula
lambda = calc_lambda(alpha, Phi, gamma, varphi, tau);
lambda2 = calc_lambda(alpha, Phi2, gamma, varphi, tau);
lambda_g2 = calc_lambda(alpha, Phi, gamma2, varphi, tau);
lambda2_g2 = calc_lambda(alpha, Phi2, gamma2, varphi, tau);

% plot
figure;
plot(alpha, lambda, '-', 'LineWidth', 1.5);
hold on;
plot(alpha, lambda2, '--', 'LineWidth', 1.5);
plot(alpha, lambda_g2, ':', 'LineWidth', 1.5);
plot(alpha, lambda2_g2, '-.', 'LineWidth', 1.5);
xlabel('\alpha');
ylabel('\lambda');
grid on;
xlim([alpha_min alpha_max]);
ylim([0 0.4]);
yline(tau, '--', '\lambda=\tau', 'LabelHorizontalAlignment', 'left');
legend('\Phi=0.2,\gamma=1.0', '\Phi=0,\gamma=1.0', '\Phi=0.2,\gamma=1.5', '\Phi=0,\gamma=1.5', ...
  'Location', 'best');

function lambda = calc_lambda(alpha, Phi, gamma, varphi, tau)
Phi_tilde = Phi .* (varphi + 1) ./ (varphi + (1 - Phi) .* (1 - alpha) .* gamma);

term = varphi + (1 - Phi) .* (1 - alpha) .* gamma;

lambda = (Phi + (1 - Phi_tilde) .* tau .* term) ./ ...
  (Phi + (1 - Phi_tilde) .* term);
end
