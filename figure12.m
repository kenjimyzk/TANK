% figure11.m と同様に lambda_lambda を図示

% parameters
params = struct( ...
  'gamma', 2, ...
  'tau', 0.2, ...
  'varphi', 2);

% cases
cases = struct( ...
  'name', {'case_A', 'case_B', 'case_C', 'case_D'}, ...
  'alpha', {0.0, 0.0, 0.3, 0.3}, ...
  'Phi', {0.0, 0.2, 0.0, 0.2});

% xi range
xi_min = -params.gamma * params.varphi / (params.varphi + 1);
xi_max = 5;
xi = linspace(xi_min, xi_max, 500);
xi0 = 0;

% compute all cases
n_cases = numel(cases);
results = repmat(struct( ...
  'kappa', zeros(size(xi)), ...
  'Xi1', 0, ...
  'Xi2', 0, ...
  'Xi3', 0, ...
  'lambda_plus', zeros(size(xi)), ...
  'lambda_star', 0, ...
  'lambda_lambda', zeros(size(xi)), ...
  'lambda_simple', 0, ...
  'lambda_xi', 0, ...
  'lambda_plus_xi0', 0, ...
  'lambda_lambda_xi0', 0), n_cases, 1);

for i = 1:n_cases
  results(i) = calc_case(cases(i), params, xi, xi0);
end

% table (figure11.m style)
case_labels = make_case_labels(cases);
T2 = table( ...
  [results.lambda_star]', ...
  [results.lambda_plus_xi0]', ...
  [results.lambda_lambda_xi0]', ...
  [results.lambda_xi]', ...
  'VariableNames', {'lambda_star', 'lambda_plus_xi0', 'lambda_lambda_xi0', 'lambda_xi'}, ...
  'RowNames', case_labels);
disp(T2);

% plot (lambda_lambda)
styles = {'-', '--', '-.', ':'};
figure;
hold on;
for i = 1:n_cases
  plot(xi, results(i).lambda_lambda, styles{i}, "LineWidth", 1.5);
end
xlabel("\xi");
ylabel("\lambda");
grid on;
xlim([xi_min xi_max]);
ylim([0 1]);
yline(params.tau, "--", "\lambda=\tau", "LabelHorizontalAlignment", "left");
xline(0, "--", "\xi=0", "LabelHorizontalAlignment", "left");
legend(make_legend_labels(cases), "Location", "best");

function out = calc_case(case_params, params, xi, xi0)
  kappa = calc_kappa(xi, params, case_params);
  kappa0 = calc_kappa(xi0, params, case_params);
  Xi1 = calc_Xi1(case_params, params);
  Xi2 = calc_Xi2(case_params, params);
  Xi3 = calc_Xi3(case_params, params);

  lambda_plus = calc_lambda_plus(kappa, Xi1, Xi2, Xi3, params, case_params);
  lambda_star = calc_lambda_star(case_params, params);
  lambda_lambda = calc_lambda_lambda(kappa, Xi1, Xi2, Xi3, params, case_params);
  lambda_xi = calc_lambda_simple(Xi1, Xi2, case_params, params);
  lambda_simple = lambda_xi;

  lambda_plus_xi0 = calc_lambda_plus(kappa0, Xi1, Xi2, Xi3, params, case_params);
  lambda_lambda_xi0 = calc_lambda_lambda(kappa0, Xi1, Xi2, Xi3, params, case_params);

  out = struct( ...
    'kappa', kappa, ...
    'Xi1', Xi1, ...
    'Xi2', Xi2, ...
    'Xi3', Xi3, ...
    'lambda_plus', lambda_plus, ...
    'lambda_star', lambda_star, ...
    'lambda_lambda', lambda_lambda, ...
    'lambda_simple', lambda_simple, ...
    'lambda_xi', lambda_xi, ...
    'lambda_plus_xi0', lambda_plus_xi0, ...
    'lambda_lambda_xi0', lambda_lambda_xi0);
end

function kappa = calc_kappa(xi, params, case_params)
denom = (1 + params.varphi) + (1 - case_params.Phi) * (1 - case_params.alpha) * (params.gamma - 1);
kappa = xi * (params.varphi + 1) ./ denom;
end

function Xi1 = calc_Xi1(case_params, params)
alpha = case_params.alpha;
Phi = case_params.Phi;
gamma = params.gamma;
varphi = params.varphi;
Xi1 = ((1 - alpha) * gamma + varphi) ./ ((1 - alpha) * (gamma + varphi)) .* ...
  ((1 + varphi) + (1 - Phi) * (1 - alpha) * (gamma - 1));
end

function Xi2 = calc_Xi2(case_params, params)
alpha = case_params.alpha;
Phi = case_params.Phi;
gamma = params.gamma;
varphi = params.varphi;
Xi2 = (varphi + gamma * (1 - Phi) * (1 - alpha)) .* ...
  (((((1 - alpha) * gamma + varphi) ./ ((1 - alpha) * (gamma + varphi))) * (1 - alpha) * (1 - Phi)) ...
  - Phi / (varphi + gamma));
end

function Xi3 = calc_Xi3(case_params, params)
alpha = case_params.alpha;
Phi = case_params.Phi;
gamma = params.gamma;
varphi = params.varphi;
Xi3 = gamma * varphi * ...
  (((((1 - alpha) * gamma + varphi) ./ ((1 - alpha) * (gamma + varphi))) * (1 - alpha) * (1 - Phi)) ...
  - Phi / (varphi + gamma));
end

function lambda_plus = calc_lambda_plus(kappa, Xi1, Xi2, Xi3, params, case_params)
alpha = case_params.alpha;
Phi = case_params.Phi;
gamma = params.gamma;
varphi = params.varphi;
tau = params.tau;
tilde_alpha = (alpha * varphi) / ((1 - alpha) * (gamma + varphi));
num = gamma + kappa .* Phi + tau .* (kappa .* Xi2 + Xi3);
den = gamma * (1 + tilde_alpha) * (1 + varphi) + kappa .* Xi1;
lambda_plus = num ./ den;
zero_mask = den == 0;
if any(zero_mask, 'all')
  lambda_plus(zero_mask) = lambda_plus_limit(params, case_params);
end
end

function lambda_star = calc_lambda_star(case_params, params)
alpha = case_params.alpha;
Phi = case_params.Phi;
gamma = params.gamma;
varphi = params.varphi;
tau = params.tau;
num = ((1 - alpha) * gamma + varphi) * (1 - Phi) - Phi;
den = (1 + varphi) + (1 - alpha) * (gamma - 1);
lambda_star = tau * (1 - alpha) * (num / den);
end

function lambda_lambda = calc_lambda_lambda(kappa, Xi1, Xi2, Xi3, params, case_params)
alpha = case_params.alpha;
Phi = case_params.Phi;
gamma = params.gamma;
varphi = params.varphi;
tau = params.tau;
tilde_alpha = (alpha * varphi) / ((1 - alpha) * (gamma + varphi));
num = tau .* (kappa .* Xi2 + Xi3);
den = gamma * varphi * (1 + (1 + varphi) * tilde_alpha) - kappa .* Phi + kappa .* Xi1;
lambda_lambda = num ./ den;
zero_mask = den == 0;
if any(zero_mask, 'all')
  lambda_lambda(zero_mask) = lambda_lambda_limit(params, case_params);
end
end

function lambda = calc_lambda_simple(Xi1, Xi2, case_params, params)
lambda = (case_params.Phi + params.tau * Xi2) / Xi1;
end

function labels = make_case_labels(cases)
labels = arrayfun(@(c) sprintf('\\alpha=%.2g,\\Phi=%.2g', c.alpha, c.Phi), ...
  cases, 'UniformOutput', false);
end

function labels = make_legend_labels(cases)
labels = arrayfun(@(c) make_legend_label(c), cases, 'UniformOutput', false);
end

function label = make_legend_label(case_params)
prefix = 'case';
if isfield(case_params, 'name') && strcmp(case_params.name, 'case_A')
  prefix = 'benchmark';
end
label = sprintf('%s (\\alpha=%.2g,\\Phi=%.2g)', ...
  prefix, case_params.alpha, case_params.Phi);
end

function val = lambda_plus_limit(params, case_params)
Xi1 = calc_Xi1(case_params, params);
Xi2 = calc_Xi2(case_params, params);
val = calc_lambda_simple(Xi1, Xi2, case_params, params);
end

function val = lambda_lambda_limit(params, case_params)
Xi1 = calc_Xi1(case_params, params);
Xi2 = calc_Xi2(case_params, params);
den = Xi1 - case_params.Phi;
val = params.tau * Xi2 / den;
if den == 0
  val = 0;
end
end
