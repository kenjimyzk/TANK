% parameters
gamma = 1.5;
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
Xi2 = calc_Xi2(alpha, Phi, gamma, varphi, tau);
Xi1_2 = calc_Xi1(alpha2, Phi2, gamma, varphi);
Xi2_2 = calc_Xi2(alpha2, Phi2, gamma, varphi, tau);
Xi2_tau0 = calc_Xi2(alpha, Phi, gamma, varphi, 0);
Xi2_2_tau0 = calc_Xi2(alpha2, Phi2, gamma, varphi, 0);

% lambda formula
lambda = calc_lambda(Xi1, Xi2, Phi);
lambda2 = calc_lambda(Xi1_2, Xi2_2, Phi2);
lambda_tau0 = calc_lambda(Xi1, Xi2_tau0, Phi);
lambda2_tau0 = calc_lambda(Xi1_2, Xi2_2_tau0, Phi2);

% plot
figure;
plot(Phi, lambda, '-', 'LineWidth', 1.5);
hold on;
plot(Phi, lambda2, '--', 'LineWidth', 1.5);
plot(Phi, lambda_tau0, ':', 'LineWidth', 1.5);
plot(Phi, lambda2_tau0, '-.', 'LineWidth', 1.5);
xlabel('\Phi');
ylabel('\lambda');
grid on;
xlim([Phi_min Phi_max]);
ylim([0 0.4]);
yline(tau, '--', '\lambda=\tau', 'LabelHorizontalAlignment', 'left');
legend('\alpha=0.3,\tau=0.2', '\alpha=0,\tau=0.2', '\alpha=0.3,\tau=0', '\alpha=0,\tau=0', ...
  'Location', 'best');

function Xi1 = calc_Xi1(alpha, Phi, gamma, varphi)
Xi1 = ((1 - alpha) * gamma + varphi) ./ ((1 - alpha) * (gamma + varphi)) .* ...
  ((1 + varphi) + (1 - Phi) * (1 - alpha) * (gamma - 1));
end

function Xi2 = calc_Xi2(alpha, Phi, gamma, varphi, tau)
Xi2 = (varphi + gamma * (1 - Phi) * (1 - alpha)) .* ...
  ((((1 - alpha) * gamma + varphi) ./ (gamma + varphi)) * (1 - Phi) + Phi / (varphi + gamma)) * tau;
end

function lambda = calc_lambda(Xi1, Xi2, Phi)
lambda = (Phi + Xi2) ./ Xi1;
end
