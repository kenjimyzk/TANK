% parameters
gamma = 1.0;
gamma2 = 1.5;
tau = 0.2;
varphi = 1;
Phi_min = 0;
Phi_max = 0.5;
Phi = linspace(Phi_min, Phi_max, 500);
alpha = 0.3;

% alpha = 0 case
alpha2 = 0;
Phi2 = Phi;

% lambda formula
lambda = calc_lambda(alpha, Phi, gamma, varphi, tau);
lambda2 = calc_lambda(alpha2, Phi2, gamma, varphi, tau);
lambda_g2 = calc_lambda(alpha, Phi, gamma2, varphi, tau);
lambda2_g2 = calc_lambda(alpha2, Phi2, gamma2, varphi, tau);

% plot
figure;
plot(Phi, lambda, '-', 'LineWidth', 1.5);
hold on;
plot(Phi, lambda2, '--', 'LineWidth', 1.5);
plot(Phi, lambda_g2, ':', 'LineWidth', 1.5);
plot(Phi, lambda2_g2, '-.', 'LineWidth', 1.5);
xlabel('\Phi');
ylabel('\lambda');
grid on;
xlim([Phi_min Phi_max]);
ylim([0 0.4]);
yline(tau, '--', '\lambda=\tau', 'LabelHorizontalAlignment', 'left');
legend('\alpha=0.3,\gamma=1.0', '\alpha=0,\gamma=1.0', '\alpha=0.3,\gamma=1.5', '\alpha=0,\gamma=1.5', ...
  'Location', 'best');

function lambda = calc_lambda(alpha, Phi, gamma, varphi, tau)
Phi_tilde = Phi .* (varphi + 1) ./ (varphi + (1 - Phi) .* (1 - alpha) .* gamma);

term = varphi + (1 - Phi) .* (1 - alpha) .* gamma;

lambda = (Phi + (1 - Phi_tilde) .* tau .* term) ./ ...
  (Phi + (1 - Phi_tilde) .* term);
end
