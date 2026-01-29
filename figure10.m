% figure9.m の lambda_plus のみ図示

% parameters
params = struct( ...
  'gamma', 1, ...
  'tau', 0.2, ...
  'tauD', 0.2, ...
  'varphi', 1);

% cases (benchmark first)
cases = struct( ...
  'name', {'benchmark', 'case_alpha00_phi02', 'case_alpha03_phi00', 'case_alpha03_phi02'}, ...
  'alpha', {0.0, 0.0, 0.3, 0.3}, ...
  'Phi', {0.0, 0.2, 0.0, 0.2});

% xi range (adjust as needed; avoid xi = -gamma to prevent division by zero)
xi_min = -params.gamma * params.varphi / (params.varphi + 1);
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
  'lambda_plus', zeros(size(xi))), n_cases, 1);

for i = 1:n_cases
  results(i) = calc_case(cases(i), params, xi, xi0, xi1);
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
  'RowNames', make_case_labels(cases));
disp(T2);

% plot
styles = {'-', '--', '-.', ':'};
figure;
hold on;
for i = 1:n_cases
  plot(xi, results(i).lambda_plus, styles{i}, 'LineWidth', 1.5);
end
xlabel('\xi');
ylabel('\lambda');
grid on;
xlim([xi_min xi_max]);
ylim([0 1]);
yline(params.tau, '--', '\lambda=\tau', 'LabelHorizontalAlignment', 'left');
xline(0, '--', '\xi=0', 'LabelHorizontalAlignment', 'left');
legend(make_legend_labels(cases), 'Location', 'best');

function out = calc_case(case_params, params, xi, xi0, xi1)
  common_term = calc_common_term(case_params, params);
  denom_term = calc_denom_term(case_params, params);

  kappa_req = calc_kappa_req(xi, params, case_params);
  lambda_plus = (params.tauD * common_term .* (params.gamma + kappa_req) + ...
    params.gamma + kappa_req .* case_params.Phi) ./ ...
    (denom_term .* (params.gamma + kappa_req) + params.gamma + kappa_req .* case_params.Phi);
  lambda_star = (common_term / denom_term) * params.tauD;
  lambda_xi = calc_lambda_xi(case_params, params);

  kappa0 = calc_kappa_alt(xi0, params, case_params);
  lambda_plus_xi0 = (params.tauD * common_term * (params.gamma + kappa0) + ...
    params.gamma + kappa0 * case_params.Phi) / ...
    (denom_term * (params.gamma + kappa0) + params.gamma + kappa0 * case_params.Phi);

  kappa_xi1 = calc_kappa_req(xi1, params, case_params);

  out = struct( ...
    'common_term_req', common_term, ...
    'kappa_xi1', kappa_xi1, ...
    'lambda_star', lambda_star, ...
    'lambda_plus_xi0', lambda_plus_xi0, ...
    'lambda_xi', lambda_xi, ...
    'lambda_plus', lambda_plus);
end

function common_term = calc_common_term(case_params, params)
common_term = ((1 - case_params.alpha) * params.gamma + params.varphi) * (1 - case_params.Phi) ...
  - case_params.Phi;
end

function denom_term = calc_denom_term(case_params, params)
denom_term = params.gamma + (params.varphi + case_params.alpha) / (1 - case_params.alpha);
end

function kappa = calc_kappa_req(xi, params, case_params)
den = 1 - ((1 - params.gamma) * (1 - case_params.alpha) * (1 - case_params.Phi)) / (1 + params.varphi);
kappa = xi / den;
end

function kappa = calc_kappa_alt(xi, params, case_params)
den = (1 + params.varphi) + (1 - case_params.alpha) * (params.gamma - 1);
kappa = ((params.varphi + 1) / den) * xi;
end

function lambda_xi = calc_lambda_xi(case_params, params)
lambda_xi = (((1 - case_params.Phi) * ((1 - case_params.alpha) * params.gamma + params.varphi)) ...
  * params.tauD + case_params.Phi * (1 - params.tauD)) / ...
  (params.gamma + (params.varphi + case_params.alpha) / (1 - case_params.alpha) + case_params.Phi);
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

function labels = make_case_labels(cases)
labels = arrayfun(@(c) sprintf('\\alpha=%.2g,\\Phi=%.2g', c.alpha, c.Phi), ...
  cases, 'UniformOutput', false);
end
