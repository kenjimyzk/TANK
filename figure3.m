% parameters
gamma = 1;
tau = 0.2;
varphi = 1;
Phi = 0.2;
alpha = 0.3;

% xi range
xi_min = 0;
xi_max = 5;
xi = linspace(xi_min, xi_max, 500);

% kappa as a function of xi
kappa = calc_kappa(xi, varphi, Phi, alpha, gamma);

% alpha = 0, Phi = 0 case
alpha2 = 0;
Phi2 = 0;
kappa2 = calc_kappa(xi, varphi, Phi2, alpha2, gamma);

% alpha = 0, Phi = 0.2 case
alpha3 = 0;
Phi3 = 0.2;
kappa3 = calc_kappa(xi, varphi, Phi3, alpha3, gamma);

% alpha = 0.3, Phi = 0 case
alpha4 = 0.3;
Phi4 = 0;
kappa4 = calc_kappa(xi, varphi, Phi4, alpha4, gamma);

% Xi terms
Xi1 = calc_Xi1(alpha, Phi, gamma, varphi);
Xi2 = calc_Xi2(alpha, Phi, gamma, varphi, tau);
Xi3 = calc_Xi3(alpha, Phi, gamma, varphi, tau);

Xi1_2 = calc_Xi1(alpha2, Phi2, gamma, varphi);
Xi2_2 = calc_Xi2(alpha2, Phi2, gamma, varphi, tau);
Xi3_2 = calc_Xi3(alpha2, Phi2, gamma, varphi, tau);

Xi1_3 = calc_Xi1(alpha3, Phi3, gamma, varphi);
Xi2_3 = calc_Xi2(alpha3, Phi3, gamma, varphi, tau);
Xi3_3 = calc_Xi3(alpha3, Phi3, gamma, varphi, tau);

Xi1_4 = calc_Xi1(alpha4, Phi4, gamma, varphi);
Xi2_4 = calc_Xi2(alpha4, Phi4, gamma, varphi, tau);
Xi3_4 = calc_Xi3(alpha4, Phi4, gamma, varphi, tau);

% lambda formula
lambda = calc_lambda(kappa, Xi1, Xi2, Xi3, gamma, varphi, Phi);
lambda2 = calc_lambda(kappa2, Xi1_2, Xi2_2, Xi3_2, gamma, varphi, Phi2);
lambda3 = calc_lambda(kappa3, Xi1_3, Xi2_3, Xi3_3, gamma, varphi, Phi3);
lambda4 = calc_lambda(kappa4, Xi1_4, Xi2_4, Xi3_4, gamma, varphi, Phi4);

% plot
figure;
plot(xi, lambda, '-', 'LineWidth', 1.5);
hold on;
plot(xi, lambda2, '--', 'LineWidth', 1.5);
plot(xi, lambda3, ':', 'LineWidth', 1.5);
plot(xi, lambda4, '-.', 'LineWidth', 1.5);
xlabel('\xi');
ylabel('\lambda');
grid on;
xlim([xi_min xi_max]);
ylim([0 0.3]);
yline(tau, '--', '\lambda=\tau', 'LabelHorizontalAlignment', 'left');
xline(0, '--', '\xi=0', 'LabelHorizontalAlignment', 'left');
legend('\alpha=0.3,\Phi=0.2', '\alpha=0,\Phi=0', '\alpha=0,\Phi=0.2', '\alpha=0.3,\Phi=0', ...
  'Location', 'best');

function kappa = calc_kappa(xi, varphi, Phi, alpha, gamma)
denom = (1 + varphi) + (1 - Phi) * (1 - alpha) * (gamma - 1);
kappa = xi * (varphi + 1) ./ denom;
end

function Xi1 = calc_Xi1(alpha, Phi, gamma, varphi)
Xi1 = ((1 - alpha) * gamma + varphi) ./ ((1 - alpha) * (gamma + varphi)) .* ...
  ((1 + varphi) + (1 - Phi) * (1 - alpha) * (gamma - 1));
end

function Xi2 = calc_Xi2(alpha, Phi, gamma, varphi, tau)
Xi2 = (varphi + gamma * (1 - Phi) * (1 - alpha)) .* ...
  ((((1 - alpha) * gamma + varphi) ./ (gamma + varphi)) * (1 - Phi) + Phi / (varphi + gamma)) * tau;
end

function Xi3 = calc_Xi3(alpha, Phi, gamma, varphi, tau)
Xi3 = gamma * varphi * ((1 - alpha) * gamma + varphi) ./ ((1 - alpha) * (gamma + varphi)) * tau + ...
  (gamma * varphi / (varphi + gamma)) * tau * Phi;
end

function lambda = calc_lambda(kappa, Xi1, Xi2, Xi3, gamma, varphi, Phi)
lambda = (kappa .* Xi2 + Xi3) ./ (gamma * varphi - kappa .* Phi + kappa .* Xi1);
end
