% figure2.m / figure3.m の alpha=0 の2ケースを1枚で比較

% parameters
gamma = 1.0;
tau = 0.2;
varphi = 1;
alpha = 0;

% Phi cases (alpha = 0)
Phi_a = 0;
Phi_b = 0.2;

% xi ranges
xi_min_full = -gamma * varphi / (varphi + 1);
xi_max_full = 5;
xi_full = linspace(xi_min_full, xi_max_full, 500);

xi_min_alt = 0;
xi_max_alt = 5;
xi_alt = linspace(xi_min_alt, xi_max_alt, 500);

% figure2.m formula (full)
kappa_full_a = calc_kappa(xi_full, varphi, Phi_a, alpha, gamma);
kappa_full_b = calc_kappa(xi_full, varphi, Phi_b, alpha, gamma);

Xi1_a = calc_Xi1(alpha, Phi_a, gamma, varphi);
Xi2_a = calc_Xi2(alpha, Phi_a, gamma, varphi);
Xi3_a = calc_Xi3(alpha, Phi_a, gamma, varphi);

Xi1_b = calc_Xi1(alpha, Phi_b, gamma, varphi);
Xi2_b = calc_Xi2(alpha, Phi_b, gamma, varphi);
Xi3_b = calc_Xi3(alpha, Phi_b, gamma, varphi);

lambda_full_a = calc_lambda_full(kappa_full_a, Xi1_a, Xi2_a, Xi3_a, gamma, varphi, Phi_a, tau);
lambda_full_b = calc_lambda_full(kappa_full_b, Xi1_b, Xi2_b, Xi3_b, gamma, varphi, Phi_b, tau);

% figure3.m formula (alt)
kappa_alt_a = calc_kappa(xi_alt, varphi, Phi_a, alpha, gamma);
kappa_alt_b = calc_kappa(xi_alt, varphi, Phi_b, alpha, gamma);

lambda_alt_a = calc_lambda_alt(kappa_alt_a, Xi1_a, Xi2_a, Xi3_a, gamma, varphi, Phi_a, tau);
lambda_alt_b = calc_lambda_alt(kappa_alt_b, Xi1_b, Xi2_b, Xi3_b, gamma, varphi, Phi_b, tau);

% plot (single axes)
figure;
plot(xi_full, lambda_full_a, "--", "LineWidth", 1.5);
hold on;
plot(xi_full, lambda_full_b, ":", "LineWidth", 1.5);
plot(xi_alt, lambda_alt_a, "--", "LineWidth", 1.5);
plot(xi_alt, lambda_alt_b, ":", "LineWidth", 1.5);
xlabel("\xi");
ylabel("\lambda");
grid on;
xlim([xi_min_full xi_max_full]);
ylim([0 1]);
yline(tau, "--", "\lambda=\tau", "LabelHorizontalAlignment", "left");
xline(0, "--", "\xi=0", "LabelHorizontalAlignment", "left");
legend( ...
  "\alpha=0,\Phi=0 (fig2)", ...
  "\alpha=0,\Phi=0.2 (fig2)", ...
  "\alpha=0,\Phi=0 (fig3)", ...
  "\alpha=0,\Phi=0.2 (fig3)", ...
  "Location", "best");

function kappa = calc_kappa(xi, varphi, Phi, alpha, gamma)
denom = (1 + varphi) + (1 - Phi) * (1 - alpha) * (gamma - 1);
kappa = xi * (varphi + 1) ./ denom;
end

function Xi1 = calc_Xi1(alpha, Phi, gamma, varphi)
Xi1 = ((1 - alpha) * gamma + varphi) ./ ((1 - alpha) * (gamma + varphi)) .* ...
  ((1 + varphi) + (1 - Phi) * (1 - alpha) * (gamma - 1));
end

function Xi2 = calc_Xi2(alpha, Phi, gamma, varphi)
Xi2 = (varphi + gamma * (1 - Phi) * (1 - alpha)) .* ...
  (((((1 - alpha) * gamma + varphi) ./ ((1 - alpha) * (gamma + varphi))) * (1 - alpha) * (1 - Phi)) ...
  - Phi / (varphi + gamma));
end

function Xi3 = calc_Xi3(alpha, Phi, gamma, varphi)
Xi3 = gamma * varphi * ...
  (((((1 - alpha) * gamma + varphi) ./ ((1 - alpha) * (gamma + varphi))) * (1 - alpha) * (1 - Phi)) ...
  - Phi / (varphi + gamma));
end

function lambda = calc_lambda_full(kappa, Xi1, Xi2, Xi3, gamma, varphi, Phi, tau)
lambda = (gamma + kappa .* Phi + tau .* (kappa .* Xi2 + Xi3)) ./ ...
  (gamma * (1 + varphi) - kappa .* Phi + kappa .* Xi1);
end

function lambda = calc_lambda_alt(kappa, Xi1, Xi2, Xi3, gamma, varphi, Phi, tau)
lambda = (tau .* (kappa .* Xi2 + Xi3)) ./ ...
  (gamma * varphi - kappa .* Phi + kappa .* Xi1);
end
