% parameters
gamma = 1;
tau = 0.2;
varphi = 1;
Phi = 0.2;
alpha = 0.3;

% xi range
xi_min = -gamma * varphi / (varphi + 1);
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

cases = struct( ...
  'name', {'benchmark', 'case_alpha00_phi02', 'case_alpha03_phi00', 'case_alpha03_phi02'}, ...
  'alpha', {alpha2, alpha3, alpha4, alpha}, ...
  'Phi', {Phi2, Phi3, Phi4, Phi});

% lambda formula
lambda = calc_lambda(kappa, gamma, varphi, Phi, alpha, tau);
lambda2 = calc_lambda(kappa2, gamma, varphi, Phi2, alpha2, tau);
lambda3 = calc_lambda(kappa3, gamma, varphi, Phi3, alpha3, tau);
lambda4 = calc_lambda(kappa4, gamma, varphi, Phi4, alpha4, tau);

% plot
figure;
plot(xi, lambda2, '-', 'LineWidth', 1.5);
hold on;
plot(xi, lambda3, '--', 'LineWidth', 1.5);
plot(xi, lambda4, '-.', 'LineWidth', 1.5);
plot(xi, lambda, ':', 'LineWidth', 1.5);
xlabel('\xi');
ylabel('\lambda');
grid on;
xlim([xi_min xi_max]);
ylim([0 1]);
yline(tau, '--', '\lambda=\tau', 'LabelHorizontalAlignment', 'left');
xline(0, '--', '\xi=0', 'LabelHorizontalAlignment', 'left');
legend(make_legend_labels(cases), 'Location', 'best');

function kappa = calc_kappa(xi, varphi, Phi, alpha, gamma)
denom = (1 + varphi) + (1 - Phi) * (1 - alpha) * (gamma - 1);
kappa = xi * (varphi + 1) ./ denom;
end

function lambda = calc_lambda(kappa_s, gamma, varphi, Phi, alpha, tau)
Phi_tilde = Phi * (varphi + 1) ./ (varphi + (1 - Phi) * (1 - alpha) * gamma);

common_term = kappa_s .* (varphi + (1 - Phi) * (1 - alpha) * gamma) + gamma * varphi;

lambda = (gamma + kappa_s .* Phi + tau .* (1 - Phi_tilde) .* common_term) ./ ...
  (gamma + kappa_s .* Phi + (1 - Phi_tilde) .* common_term);
end

function labels = make_legend_labels(cases)
labels = arrayfun(@(c) make_case_label(c), cases, 'UniformOutput', false);
end

function label = make_case_label(case_params)
if strcmp(case_params.name, 'benchmark')
  prefix = 'benchmark';
else
  prefix = 'case';
end
label = sprintf('%s (\\alpha=%.2g,\\Phi=%.2g)', ...
  prefix, case_params.alpha, case_params.Phi);
end
