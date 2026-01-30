% Figure 12: lambda_lambda の比較分析
% figure11.m と同様に lambda_lambda を図示

%% パラメータ設定
params = struct(...
  'gamma', 2, ...
  'tau', 0.2, ...
  'varphi', 2 ...
);

%% ケース定義
cases = struct(...
  'name', {'benchmark', 'case_B', 'case_C', 'case_D'}, ...
  'alpha', {0.0, 0.0, 0.3, 0.3}, ...
  'Phi', {0.0, 0.2, 0.0, 0.2} ...
);

%% xi の設定
xi_min = -params.gamma * params.varphi / (params.varphi + 1);
xi_max = 5;
xi = linspace(xi_min, xi_max, 500);
xi0 = 0;

%% 全ケース計算
results = compute_all_cases(cases, params, xi, xi0);

%% 結果テーブル表示
display_results_table(cases, results, params);

%% プロット
title_suffix = '';
plot_lambda_lambda(cases, results, xi, xi_min, xi_max, params, title_suffix);

%% ヘルパー関数

function results = compute_all_cases(cases, params, xi, xi0)
  n_cases = numel(cases);
  results = cell(n_cases, 1);
  for i = 1:n_cases
    results{i} = compute_case(cases(i), params, xi, xi0);
  end
end

function result = compute_case(case_params, params, xi, xi0)
  % 基本計算
  [kappa, Xi] = compute_base_values(xi, case_params, params);
  [kappa0, Xi0] = compute_base_values(xi0, case_params, params);
  
  % tilde_alpha
  tilde_alpha = compute_tilde_alpha(case_params.alpha, params.gamma, params.varphi);
  
  % lambda 計算
  lambda_plus = calc_lambda_plus(kappa, Xi, tilde_alpha, params, case_params);
  lambda_star = calc_lambda_star(case_params, params);
  lambda_lambda = calc_lambda_lambda(kappa, Xi, tilde_alpha, params, case_params);
  lambda_xi = calc_lambda_simple(Xi, case_params, params);
  
  % xi=0 での値
  lambda_plus_xi0 = calc_lambda_plus(kappa0, Xi0, tilde_alpha, params, case_params);
  lambda_lambda_xi0 = calc_lambda_lambda(kappa0, Xi0, tilde_alpha, params, case_params);
  
  % 結果構造体
  result = struct(...
    'kappa', kappa, ...
    'Xi', Xi, ...
    'lambda_plus', lambda_plus, ...
    'lambda_star', lambda_star, ...
    'lambda_lambda', lambda_lambda, ...
    'lambda_xi', lambda_xi, ...
    'lambda_plus_xi0', lambda_plus_xi0, ...
    'lambda_lambda_xi0', lambda_lambda_xi0 ...
  );
end

function [kappa, Xi] = compute_base_values(xi, case_params, params)
  kappa = calc_kappa(xi, params, case_params);
  Xi = struct(...
    'Xi1', calc_Xi1(case_params, params), ...
    'Xi2', calc_Xi2(case_params, params), ...
    'Xi3', calc_Xi3(case_params, params) ...
  );
end

function tilde_alpha = compute_tilde_alpha(alpha, gamma, varphi)
  tilde_alpha = (alpha * varphi) / ((1 - alpha) * (gamma + varphi));
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
  common_term = ((1 - alpha) * gamma + varphi) / ((1 - alpha) * (gamma + varphi));
  parenthetical = common_term * (1 - alpha) * (1 - Phi) - Phi / (varphi + gamma);
  Xi2 = (varphi + gamma * (1 - Phi) * (1 - alpha)) * parenthetical;
end

function Xi3 = calc_Xi3(case_params, params)
  alpha = case_params.alpha;
  Phi = case_params.Phi;
  gamma = params.gamma;
  varphi = params.varphi;
  common_term = ((1 - alpha) * gamma + varphi) / ((1 - alpha) * (gamma + varphi));
  parenthetical = common_term * (1 - alpha) * (1 - Phi) - Phi / (varphi + gamma);
  Xi3 = gamma * varphi * parenthetical;
end

function lambda_plus = calc_lambda_plus(kappa, Xi, tilde_alpha, params, case_params)
  gamma = params.gamma;
  varphi = params.varphi;
  tau = params.tau;
  Phi = case_params.Phi;
  
  num = gamma + kappa .* Phi + tau .* (kappa .* Xi.Xi2 + Xi.Xi3);
  den = gamma * (1 + tilde_alpha) * (1 + varphi) + kappa .* Xi.Xi1;
  lambda_plus = safe_divide(num, den, @() calc_lambda_simple(Xi, case_params, params));
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

function lambda_lambda = calc_lambda_lambda(kappa, Xi, tilde_alpha, params, case_params)
  gamma = params.gamma;
  varphi = params.varphi;
  tau = params.tau;
  Phi = case_params.Phi;
  
  num = tau .* (kappa .* Xi.Xi2 + Xi.Xi3);
  den = gamma * varphi * (1 + (1 + varphi) * tilde_alpha) - kappa .* Phi + kappa .* Xi.Xi1;
  lambda_lambda = safe_divide(num, den, @() lambda_lambda_limit(Xi, case_params, params));
end

function lambda = calc_lambda_simple(Xi, case_params, params)
  lambda = (case_params.Phi + params.tau * Xi.Xi2) / Xi.Xi1;
end

function result = safe_divide(num, den, limit_func)
  result = num ./ den;
  zero_mask = den == 0;
  if any(zero_mask, 'all')
    result(zero_mask) = limit_func();
  end
end

function val = lambda_lambda_limit(Xi, case_params, params)
  den = Xi.Xi1 - case_params.Phi;
  if den == 0
    val = 0;
  else
    val = params.tau * Xi.Xi2 / den;
  end
end

function display_results_table(cases, results, ~)
  case_labels = arrayfun(@(c) sprintf('\\alpha=%.2g,\\Phi=%.2g', c.alpha, c.Phi), ...
    cases, 'UniformOutput', false);
  
  T2 = table(...
    cellfun(@(r) r.lambda_star, results)', ...
    cellfun(@(r) r.lambda_plus_xi0, results)', ...
    cellfun(@(r) r.lambda_lambda_xi0, results)', ...
    cellfun(@(r) r.lambda_xi, results)', ...
    'VariableNames', {'lambda_star', 'lambda_plus_xi0', 'lambda_lambda_xi0', 'lambda_xi'}, ...
    'RowNames', case_labels);
  disp(T2);
end

function plot_lambda_lambda(cases, results, xi, xi_min, xi_max, params, ~)
  styles = {'-', '--', '-.', ':'};
  colors = get_case_colors();
  
  figure;
  hold on;
  
  for i = 1:numel(cases)
    plot(xi, results{i}.lambda_lambda, styles{i}, 'LineWidth', 1.5, ...
      'Color', colors(i, :), ...
      'DisplayName', make_legend_label(cases(i)));
  end
  
  xlabel('\xi');
  ylabel('\lambda');
  grid on;
  xlim([xi_min xi_max]);
  ylim([0 1]);
  yline(params.tau, '--', '\lambda=\tau', 'LabelHorizontalAlignment', 'left');
  xline(0, '--', '\xi=0', 'LabelHorizontalAlignment', 'left');
  legend('Location', 'best');
  hold off;
end

function label = make_legend_label(case_params)
  prefix = 'case';
  if strcmp(case_params.name, 'benchmark')
    prefix = 'benchmark';
  end
  label = sprintf('%s (\\alpha=%.2g,\\Phi=%.2g)', prefix, case_params.alpha, case_params.Phi);
end

function colors = get_case_colors()
  colors = [0 0.4470 0.7410;    % 青 (benchmark)
            0.8500 0.3250 0.0980; % オレンジ (case B)
            0.9290 0.6940 0.1250; % 黄色 (case C)
            0.4940 0.1840 0.5560]; % 紫 (case D)
end
