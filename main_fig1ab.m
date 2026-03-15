% main_GRAPH_all.m
% Unified plotting for graph 1a (xi on x-axis) and 1b (lambda on x-axis).
% Set GRAPH_MODE = '1a' or '1b' before running, or call as script and it will default to '1a'.

% Determine GRAPH mode: use workspace `GRAPH_MODE` if provided and valid,
% otherwise default to '1b' (lambda on x-axis).
if exist('GRAPH_MODE','var') && ischar(GRAPH_MODE)
  mode = GRAPH_MODE;
else
  mode = '1b';
end
fprintf('main_GRAPH_all: GRAPH_MODE = %s\n', mode);

% common parameters
gamma = 1;
tau = 0.2;
varphi = 1;
Phi = 0.2;
alpha = 0.3;

switch mode
  case '1a'
    % xi varying (main_GRAPH4)
    lambda = 0.3;
    xi_min = -gamma * varphi / (varphi + 1);
    xi_max = 0.9;
    xi = linspace(xi_min, xi_max, 500);

    kappa = calc_kappa(xi, varphi, Phi, alpha, gamma);
    kappa2 = calc_kappa(xi, varphi, 0, 0, gamma);
    kappa3 = calc_kappa(xi, varphi, 0.2, 0, gamma);
    kappa4 = calc_kappa(xi, varphi, 0, 0.3, gamma);

    EIS = calc_EIS(kappa, gamma, varphi, Phi, alpha, tau, lambda);
    EIS2 = calc_EIS(kappa2, gamma, varphi, 0, 0, tau, lambda);
    EIS3 = calc_EIS(kappa3, gamma, varphi, 0.2, 0, tau, lambda);
    EIS4 = calc_EIS(kappa4, gamma, varphi, 0, 0.3, tau, lambda);

    figure;
    plot(xi, EIS2, '-', 'LineWidth', 1.5); hold on;
    plot(xi, EIS3, '--', 'LineWidth', 1.5);
    plot(xi, EIS4, ':', 'LineWidth', 1.5);
    plot(xi, EIS, '-.', 'LineWidth', 1.5);
    xlabel('\xi');
    ylabel('GE-EIS');
    grid on;
    xlim([xi_min xi_max]);
    ylim([0.5 2]);
    yline(tau, '--', 'GE-EIS=\tau', 'LabelHorizontalAlignment', 'left');
    xline(0, '--', '\xi=0', 'LabelHorizontalAlignment', 'left');
    legend('\alpha=0,\Phi=0', '\alpha=0.3,\Phi=0', '\alpha=0,\Phi=0.2', '\alpha=0.3,\Phi=0.2', 'Location', 'best');
    saveas(gcf,'figure1a.png')

  case '1b'
    % lambda varying (main_GRAPH5)
    xi = 0.5;
    lambda_min = 0;
    lambda_max = 0.45;
    lambda = linspace(lambda_min, lambda_max, 500);

    kappa = calc_kappa(xi, varphi, Phi, alpha, gamma);
    kappa2 = calc_kappa(xi, varphi, 0, 0, gamma);
    kappa3 = calc_kappa(xi, varphi, 0.2, 0, gamma);
    kappa4 = calc_kappa(xi, varphi, 0, 0.3, gamma);

    EIS = calc_EIS(kappa, gamma, varphi, Phi, alpha, tau, lambda);
    EIS2 = calc_EIS(kappa2, gamma, varphi, 0, 0, tau, lambda);
    EIS3 = calc_EIS(kappa3, gamma, varphi, 0.2, 0, tau, lambda);
    EIS4 = calc_EIS(kappa4, gamma, varphi, 0, 0.3, tau, lambda);

    figure;
    plot(lambda, EIS2, '-', 'LineWidth', 1.5); hold on;
    plot(lambda, EIS3, '--', 'LineWidth', 1.5);
    plot(lambda, EIS4, ':', 'LineWidth', 1.5);
    plot(lambda, EIS, '-.', 'LineWidth', 1.5);
    xlabel('\lambda');
    ylabel('GE-EIS');
    grid on;
    xlim([lambda_min lambda_max]);
    ylim([0.5 2]);
    yline(tau, '--', 'GE-EIS=\tau', 'LabelHorizontalAlignment', 'left');
    xline(0, '--', '\lambda=0', 'LabelHorizontalAlignment', 'left');
    legend('\alpha=0,\Phi=0', '\alpha=0.3,\Phi=0', '\alpha=0,\Phi=0.2', '\alpha=0.3,\Phi=0.2', 'Location', 'best');
    saveas(gcf,'figure1b.png')

  otherwise
    error('Unknown GRAPH_MODE. Use ''1a'' or ''1b''.')
end

% Helper functions
function kappa = calc_kappa(xi, varphi, Phi, alpha, gamma)
denom = (1 + varphi) + (1 - Phi) * (1 - alpha) * (gamma - 1);
kappa = xi * (varphi + 1) ./ denom;
end

function EIS = calc_EIS(kappa_s, gamma, varphi, Phi, alpha, tau, lambda)
common_term1 = (1-Phi) * ((1-alpha) * gamma + varphi) - Phi;
common_term2 = common_term1/((1-Phi)*(1-alpha) * gamma + varphi);

GAMMA = gamma - gamma * varphi * common_term2 *(lambda-tau)./(1-lambda) ...
  + kappa_s * (Phi - common_term1 * (lambda -tau)./(1-lambda));

EIS = 1./GAMMA;
end
