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

% Xi terms
Xi1 = calc_Xi1(alpha, Phi, gamma, varphi);
Xi2 = calc_Xi2(alpha, Phi, gamma, varphi);
Xi1_2 = calc_Xi1(alpha2, Phi2, gamma, varphi);
Xi2_2 = calc_Xi2(alpha2, Phi2, gamma, varphi);
Xi1_g2 = calc_Xi1(alpha, Phi, gamma2, varphi);
Xi2_g2 = calc_Xi2(alpha, Phi, gamma2, varphi);
Xi1_2_g2 = calc_Xi1(alpha2, Phi2, gamma2, varphi);
Xi2_2_g2 = calc_Xi2(alpha2, Phi2, gamma2, varphi);

% lambda formula
lambda = calc_lambda(Xi1, Xi2, Phi, tau);
lambda2 = calc_lambda(Xi1_2, Xi2_2, Phi2, tau);
lambda_g2 = calc_lambda(Xi1_g2, Xi2_g2, Phi, tau);
lambda2_g2 = calc_lambda(Xi1_2_g2, Xi2_2_g2, Phi2, tau);

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

function Xi1 = calc_Xi1(alpha, Phi, gamma, varphi)
Xi1 = ((1 - alpha) * gamma + varphi) ./ ((1 - alpha) * (gamma + varphi)) .* ...
  ((1 + varphi) + (1 - Phi) * (1 - alpha) * (gamma - 1));
end

function Xi2 = calc_Xi2(alpha, Phi, gamma, varphi)
Xi2 = (varphi + gamma * (1 - Phi) * (1 - alpha)) .* ...
  (((((1 - alpha) * gamma + varphi) ./ ((1 - alpha) * (gamma + varphi))) * (1 - alpha) * (1 - Phi)) ...
  - Phi / (varphi + gamma));
end

function lambda = calc_lambda(Xi1, Xi2, Phi, tau)
lambda = (Phi + tau .* Xi2) ./ Xi1;
end
