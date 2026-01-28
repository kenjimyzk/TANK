% figure2.m の2ケースのみ: (Phi=0, alpha=0) と (Phi=0.2, alpha=0.3)

% parameters
gamma = 1;
tau = 0.2;
varphi = 1;

% case A: Phi=0, alpha=0
alpha_a = 0;
Phi_a = 0;

% case B: Phi=0.2, alpha=0.3
alpha_b = 0.;
Phi_b = 0.2;

% xi range
xi_min = -gamma * varphi / (varphi + 1);
xi_max = 5;
xi = linspace(xi_min, xi_max, 500);

% kappa as a function of xi
kappa_a = calc_kappa(xi, varphi, Phi_a, alpha_a, gamma);
kappa_b = calc_kappa(xi, varphi, Phi_b, alpha_b, gamma);

% Xi terms
Xi1_a = calc_Xi1(alpha_a, Phi_a, gamma, varphi);
Xi2_a = calc_Xi2(alpha_a, Phi_a, gamma, varphi);
Xi3_a = calc_Xi3(alpha_a, Phi_a, gamma, varphi);

Xi1_b = calc_Xi1(alpha_b, Phi_b, gamma, varphi);
Xi2_b = calc_Xi2(alpha_b, Phi_b, gamma, varphi);
Xi3_b = calc_Xi3(alpha_b, Phi_b, gamma, varphi);

% lambda formula (figure2.m)
lambda_a = calc_lambda(kappa_a, Xi1_a, Xi2_a, Xi3_a, gamma, varphi, Phi_a, alpha_a, tau);
lambda_b = calc_lambda(kappa_b, Xi1_b, Xi2_b, Xi3_b, gamma, varphi, Phi_b, alpha_b, tau);

lambda_c_b = calc_lambda_const(alpha_b, Phi_b, gamma, varphi, tau);

lambda_alt_b = calc_lambda_alt(kappa_b, Xi1_b, Xi2_b, Xi3_b, gamma, varphi, Phi_b, alpha_b, tau);

lambda_s_b = calc_lambda_simple(Xi1_b, Xi2_b, Phi_b, tau);

% plot
figure;
plot(xi, lambda_a, "--", "LineWidth", 1.5);
hold on;
plot(xi, lambda_b, "-", "LineWidth", 1.5);
plot(xi, lambda_c_b * ones(size(xi)), "-.", "LineWidth", 1.5);
plot(xi, lambda_alt_b, "-", "LineWidth", 1.5);
plot(xi, lambda_s_b * ones(size(xi)), "-.", "LineWidth", 1.5);
xlabel("\xi");
ylabel("\lambda");
grid on;
xlim([xi_min xi_max]);
ylim([0 1]);
yline(tau, "--", "\lambda=\tau", "LabelHorizontalAlignment", "left");
xline(0, "--", "\xi=0", "LabelHorizontalAlignment", "left");
legend( ...
  "\alpha=0,\Phi=0", ...
  "\alpha=0.3,\Phi=0.2", ...
  "\alpha=0.3,\Phi=0.2 (const)", ...
  "\alpha=0.3,\Phi=0.2 (alt)", ...
  "\alpha=0.3,\Phi=0.2 (simple)", ...
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

function lambda = calc_lambda(kappa, Xi1, Xi2, Xi3, gamma, varphi, Phi, alpha, tau)
tilde_alpha = (alpha * varphi) / ((1 - alpha) * (gamma + varphi));
lambda = (gamma + kappa .* Phi + tau .* (kappa .* Xi2 + Xi3)) ./ ...
  (gamma * (1 + tilde_alpha) * (1 + varphi)+ kappa .* Xi1);
end

function lambda = calc_lambda_const(alpha, Phi, gamma, varphi, tau)
num = ((1 - alpha) * gamma + varphi) * (1 - Phi) - Phi;
den = (1 + varphi) + (1 - alpha) * (gamma - 1);
lambda = tau * (1 - alpha) * (num / den);
end

function lambda = calc_lambda_alt(kappa, Xi1, Xi2, Xi3, gamma, varphi, Phi, alpha, tau)
tilde_alpha = (alpha * varphi) / ((1 - alpha) * (gamma + varphi));
lambda = (tau .* (kappa .* Xi2 + Xi3));
%  ./ ...
%   (gamma * varphi * (1 + (1 + varphi) * tilde_alpha) - kappa .* Phi + kappa .* Xi1);
end

function lambda = calc_lambda_simple(Xi1, Xi2, Phi, tau)
lambda = (Phi + tau * Xi2) / Xi1;
end
