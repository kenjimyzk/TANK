% Figure 7: 複数ケースの lambda 比較
% (Phi=0, alpha=0) と (Phi=0.2, alpha=0.3) の比較

%% パラメータ設定
params = struct( ...
  'gamma', 1.5, ...
  'tau', 0.2, ...
  'varphi', 1 ...
);

%% ケース定義
cases = {
  struct('alpha', 0, 'Phi', 0, 'style', '--', 'label', '\alpha=0,\Phi=0')
  struct('alpha', 0.3, 'Phi', 0.2, 'style', '-', 'label', '\alpha=0.3,\Phi=0.2')
};

%% xi の範囲
xi_min = -params.gamma * params.varphi / (params.varphi + 1);
xi_max = 5;
xi = linspace(xi_min, xi_max, 500);

%% 計算とプロット
figure;
hold on;

for i = 1:length(cases)
  c = cases{i};
  [lambda, lambda_const, lambda_alt, lambda_simple] = compute_lambda_case(c, params, xi);
  
  % メイン lambda
  plot(xi, lambda, c.style, 'LineWidth', 1.5, 'DisplayName', c.label);
  
  % ケース2の追加計算結果
  if i == 2
    plot(xi, lambda_const * ones(size(xi)), '-.', 'LineWidth', 1.5, ...
      'DisplayName', sprintf('%s (const)', c.label));
    plot(xi, lambda_alt, '-', 'LineWidth', 1.5, 'LineStyle', ':', ...
      'DisplayName', sprintf('%s (alt)', c.label));
    plot(xi, lambda_simple * ones(size(xi)), '-.', 'LineWidth', 1.5, ...
      'LineStyle', '-.', 'Color', [0.5 0.5 0.5], ...
      'DisplayName', sprintf('%s (simple)', c.label));
  end
end

%% グラフ装飾
xlabel('\xi');
ylabel('\lambda');
grid on;
xlim([xi_min xi_max]);
ylim([0 1]);
yline(params.tau, '--', '\lambda=\tau', 'LabelHorizontalAlignment', 'left');
xline(0, '--', '\xi=0', 'LabelHorizontalAlignment', 'left');
legend('Location', 'best');
hold off;

%% ヘルパー関数
function [lambda, lambda_const, lambda_alt, lambda_simple] = compute_lambda_case(c, p, xi)
  % kappa 計算
  kappa = calc_kappa(xi, p.varphi, c.Phi, c.alpha, p.gamma);
  
  % Xi 項計算
  Xi1 = calc_Xi1(c.alpha, c.Phi, p.gamma, p.varphi);
  Xi2 = calc_Xi2(c.alpha, c.Phi, p.gamma, p.varphi);
  Xi3 = calc_Xi3(c.alpha, c.Phi, p.gamma, p.varphi);
  
  % lambda 計算
  lambda = calc_lambda(kappa, Xi1, Xi2, Xi3, p.gamma, p.varphi, c.Phi, c.alpha, p.tau);
  lambda_const = calc_lambda_const(c.alpha, c.Phi, p.gamma, p.varphi, p.tau);
  lambda_alt = calc_lambda_alt(kappa, Xi1, Xi2, Xi3, p.gamma, p.varphi, c.Phi, c.alpha, p.tau);
  lambda_simple = calc_lambda_simple(Xi1, Xi2, c.Phi, p.tau);
end

function kappa = calc_kappa(xi, varphi, Phi, alpha, gamma)
  denom = (1 + varphi) + (1 - Phi) * (1 - alpha) * (gamma - 1);
  kappa = xi * (varphi + 1) ./ denom;
end

function Xi1 = calc_Xi1(alpha, Phi, gamma, varphi)
  Xi1 = ((1 - alpha) * gamma + varphi) ./ ((1 - alpha) * (gamma + varphi)) .* ...
    ((1 + varphi) + (1 - Phi) * (1 - alpha) * (gamma - 1));
end

function Xi2 = calc_Xi2(alpha, Phi, gamma, varphi)
  common_term = ((1 - alpha) * gamma + varphi) ./ ((1 - alpha) * (gamma + varphi));
  Xi2 = (varphi + gamma * (1 - Phi) * (1 - alpha)) .* ...
    ((common_term * (1 - alpha) * (1 - Phi)) - Phi / (varphi + gamma));
end

function Xi3 = calc_Xi3(alpha, Phi, gamma, varphi)
  common_term = ((1 - alpha) * gamma + varphi) ./ ((1 - alpha) * (gamma + varphi));
  Xi3 = gamma * varphi * ...
    ((common_term * (1 - alpha) * (1 - Phi)) - Phi / (varphi + gamma));
end

function lambda = calc_lambda(kappa, Xi1, Xi2, Xi3, gamma, varphi, Phi, alpha, tau)
  tilde_alpha = (alpha * varphi) / ((1 - alpha) * (gamma + varphi));
  lambda = (gamma + kappa .* Phi + tau .* (kappa .* Xi2 + Xi3)) ./ ...
    (gamma * (1 + tilde_alpha) * (1 + varphi) + kappa .* Xi1);
end

function lambda = calc_lambda_const(alpha, Phi, gamma, varphi, tau)
  num = ((1 - alpha) * gamma + varphi) * (1 - Phi) - Phi;
  den = (1 + varphi) + (1 - alpha) * (gamma - 1);
  lambda = tau * (1 - alpha) * (num / den);
end

function lambda = calc_lambda_alt(kappa, Xi1, Xi2, Xi3, gamma, varphi, Phi, alpha, tau)
  tilde_alpha = (alpha * varphi) / ((1 - alpha) * (gamma + varphi));
  lambda = (tau .* (kappa .* Xi2 + Xi3)) ./ ...
    (gamma * varphi * (1 + (1 + varphi) * tilde_alpha) - kappa .* Phi + kappa .* Xi1);
end

function lambda = calc_lambda_simple(Xi1, Xi2, Phi, tau)
  lambda = (Phi + tau * Xi2) / Xi1;
end
