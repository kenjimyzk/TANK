% figure9.m の lambda_alt のみ図示

% parameters
gamma = 1;
tau = 0.2;
tauD = tau;
varphi = 1;

% cases (benchmark first)
cases = struct( ...
  'name', {'benchmark', 'case_alpha00_phi02', 'case_alpha03_phi00', 'case_alpha03_phi02'}, ...
  'alpha', {0.0, 0.0, 0.3, 0.3}, ...
  'Phi', {0.0, 0.2, 0.0, 0.2});

% xi range (adjust as needed; avoid xi = -gamma to prevent division by zero)
xi_min = -gamma * varphi / (varphi + 1);
xi_max = 5;
xi = linspace(xi_min, xi_max, 500);
xi0 = 0;
xi1 = 1;

% compute all cases
n_cases = numel(cases);
results = repmat(struct( ...
  'common_term_req', 0, ...
  'kappa_xi1', 0, ...
  'lambda_star', 0, ...
  'lambda_plus_xi0', 0, ...
  'lambda_xi', 0, ...
  'lambda_alt', zeros(size(xi))), n_cases, 1);

for i = 1:n_cases
  results(i) = calc_case(cases(i).alpha, cases(i).Phi, gamma, varphi, tauD, xi, xi0, xi1);
end

% benchmark outputs
fprintf('lambda* = %.6f\n', results(1).lambda_star);
fprintf('lambda^+ (xi=0) = %.6f\n', results(1).lambda_plus_xi0);
fprintf('lambda^xi = %.6f\n', results(1).lambda_xi);

T2 = table( ...
  [results.lambda_star]', ...
  [results.lambda_plus_xi0]', ...
  [results.lambda_xi]', ...
  'VariableNames', {'lambda_star', 'lambda_plus_xi0', 'lambda_xi'}, ...
  'RowNames', {cases.name});
disp(T2);

% plot
styles = {'-', '--', '-.', ':'};
figure;
hold on;
for i = 1:n_cases
  plot(xi, results(i).lambda_alt, styles{i}, 'LineWidth', 1.5);
end
xlabel('\xi');
ylabel('\lambda');
grid on;
xlim([xi_min xi_max]);
ylim([0 1]);
yline(tau, '--', '\lambda=\tau', 'LabelHorizontalAlignment', 'left');
xline(0, '--', '\xi=0', 'LabelHorizontalAlignment', 'left');
legend( ...
  sprintf('benchmark (\\alpha=%.2g,\\Phi=%.2g)', cases(1).alpha, cases(1).Phi), ...
  sprintf('case (\\alpha=%.2g,\\Phi=%.2g)', cases(2).alpha, cases(2).Phi), ...
  sprintf('case (\\alpha=%.2g,\\Phi=%.2g)', cases(3).alpha, cases(3).Phi), ...
  sprintf('case (\\alpha=%.2g,\\Phi=%.2g)', cases(4).alpha, cases(4).Phi), ...
  'Location', 'best');

function out = calc_case(alpha, Phi, gamma, varphi, tauD, xi, xi0, xi1)
  common_term_req = ((1 - alpha) * gamma + varphi) * (1 - Phi) - Phi;
  lambda_star = (common_term_req / (gamma + (varphi + alpha) / (1 - alpha))) * tauD;
  kappa_req = (1 / (1 - ((1 - gamma) * (1 - alpha) * (1 - Phi)) / (1 + varphi))) * xi;
  term_req = (gamma + kappa_req .* Phi) ./ (gamma + kappa_req);
  lambda_plus = (tauD * common_term_req + term_req) ./ ...
    ((gamma + (varphi + alpha) / (1 - alpha)) + term_req);
  lambda_xi = (((1 - Phi) * ((1 - alpha) * gamma + varphi)) * tauD + Phi * (1 - tauD)) / ...
    (gamma + (varphi + alpha) / (1 - alpha) + Phi);

  kappa0 = (1 / (1 - ((1 - gamma) * (1 - alpha) * (1 - Phi)) / (1 + varphi))) * xi0;
  term0 = (gamma + kappa0 * Phi) / (gamma + kappa0);
  lambda_plus_xi0 = (tauD * common_term_req + term0) / ...
    ((gamma + (varphi + alpha) / (1 - alpha)) + term0);

  kappa_xi1 = (1 / (1 - ((1 - gamma) * (1 - alpha) * (1 - Phi)) / (1 + varphi))) * xi1;

  kappa = ((varphi + 1) / ((1 + varphi) + (1 - alpha) * (gamma - 1))) * xi;
  common_term = ((1 - alpha) * gamma + varphi) * (1 - Phi) - Phi;
  term = (gamma + kappa .* Phi) ./ (gamma + kappa);
  num_alt = tauD * common_term + term;
  den_alt = (gamma + (varphi + alpha) / (1 - alpha)) + term;
  lambda_alt = num_alt ./ den_alt;

  out = struct( ...
    'common_term_req', common_term_req, ...
    'kappa_xi1', kappa_xi1, ...
    'lambda_star', lambda_star, ...
    'lambda_plus_xi0', lambda_plus_xi0, ...
    'lambda_xi', lambda_xi, ...
    'lambda_alt', lambda_alt);
end
