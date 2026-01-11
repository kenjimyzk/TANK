% parameters
gamma = 1.5;
tau = 0.2;
varphi = 1;
Phi = 0.2;
Phi2 = 0;
alpha_min = 0;
alpha_max = 0.4;
alpha = linspace(alpha_min, alpha_max, 500);

% Xi terms
Xi1 = calc_Xi1(alpha, Phi, gamma, varphi);
Xi2 = calc_Xi2(alpha, Phi, gamma, varphi, tau);
Xi1_2 = calc_Xi1(alpha, Phi2, gamma, varphi);
Xi2_2 = calc_Xi2(alpha, Phi2, gamma, varphi, tau);

% lambda formula
lambda = calc_lambda(Xi1, Xi2, Phi);
lambda2 = calc_lambda(Xi1_2, Xi2_2, Phi2);

% plot
figure;
plot(alpha, lambda, '-', 'LineWidth', 1.5);
hold on;
plot(alpha, lambda2, '--', 'LineWidth', 1.5);
xlabel('\alpha');
ylabel('\lambda');
grid on;
xlim([alpha_min alpha_max]);
ylim([0 0.4]);
yline(tau, '--', '\lambda=\tau', 'LabelHorizontalAlignment', 'left');
legend('\Phi=0.2', '\Phi=0', 'Location', 'best');

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
