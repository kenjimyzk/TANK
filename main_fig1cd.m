% main_GRAPH_all.m
% Unified plotting for graph 1a (xi on x-axis) and 1b (lambda on x-axis).
% Set GRAPH_MODE = '1a' or '1b' before running, or call as script and it will default to '1a'.

if ~exist('GRAPH_MODE','var')
  GRAPH_MODE = '1c'; % default: xi on x-axis (same as main_GRAPH4)
else
  mode = '1d';
end
fprintf('main_GRAPH_all: GRAPH_MODE = %s\n', mode);

% common parameters
gamma = 1;
tau = 0.2;
varphi = 1;
Phi = 0.2;
alpha = 0.3;



switch GRAPH_MODE
  case '1c'
    % xi varying (main_GRAPH4)
    lambda = 0.4;
    xi_min = -gamma * varphi / (varphi + 1);
    xi_max = 0.45;
    xi = linspace(xi_min, xi_max, 500);

    CS2C = calc_CS2C(lambda, Phi, alpha, tau);
    CS2C2 = calc_CS2C(lambda, 0, 0, tau);
    CS2C3 = calc_CS2C(lambda, 0.2, 0, tau);
    CS2C4 = calc_CS2C(lambda, 0, 0.3, tau);

    kappa = calc_kappa(xi, varphi, Phi, alpha, gamma, CS2C);
    kappa2 = calc_kappa(xi, varphi, 0, 0, gamma, CS2C2);
    kappa3 = calc_kappa(xi, varphi, 0.2, 0, gamma, CS2C3);
    kappa4 = calc_kappa(xi, varphi, 0, 0.3, gamma, CS2C4);

    EIS = calc_EIS(kappa, gamma, varphi, Phi, alpha, tau, lambda, CS2C);
    EIS2 = calc_EIS(kappa2, gamma, varphi, 0, 0, tau, lambda, CS2C2);
    EIS3 = calc_EIS(kappa3, gamma, varphi, 0.2, 0, tau, lambda, CS2C3);
    EIS4 = calc_EIS(kappa4, gamma, varphi, 0, 0.3, tau, lambda, CS2C4);

    figure;
    plot(xi, EIS2, '-', 'LineWidth', 1.5); hold on;
    plot(xi, EIS3, '--', 'LineWidth', 1.5);
    plot(xi, EIS4, ':', 'LineWidth', 1.5);
    plot(xi, EIS, '-.', 'LineWidth', 1.5);
    xlabel('\xi');
    ylabel('GE-EIS');
    grid on;
    xlim([xi_min xi_max]);
    ylim([1 3]);
    yline(tau, '--', 'GE-EIS=\tau', 'LabelHorizontalAlignment', 'left');
    xline(0, '--', '\xi=0', 'LabelHorizontalAlignment', 'left');
    legend('\alpha=0,\Phi=0', '\alpha=0.3,\Phi=0', '\alpha=0,\Phi=0.2', '\alpha=0.3,\Phi=0.2', 'Location', 'best');
    saveas(gcf,'figure1c.png')

  case '1d'
    % lambda varying (main_GRAPH5)
    xi = 0.5;
    lambda_min = 0;
    lambda_max = 0.4;
    lambda = linspace(lambda_min, lambda_max, 500);

    CS2C = calc_CS2C(lambda, Phi, alpha, tau);
    CS2C2 = calc_CS2C(lambda, 0, 0, tau);
    CS2C3 = calc_CS2C(lambda, 0.2, 0, tau);
    CS2C4 = calc_CS2C(lambda, 0, 0.3, tau);

    kappa = calc_kappa(xi, varphi, Phi, alpha, gamma, CS2C);
    kappa2 = calc_kappa(xi, varphi, 0, 0, gamma, CS2C2);
    kappa3 = calc_kappa(xi, varphi, 0.2, 0, gamma, CS2C3);
    kappa4 = calc_kappa(xi, varphi, 0, 0.3, gamma, CS2C4);

    EIS = calc_EIS(kappa, gamma, varphi, Phi, alpha, tau, lambda, CS2C);
    EIS2 = calc_EIS(kappa2, gamma, varphi, 0, 0, tau, lambda, CS2C2);
    EIS3 = calc_EIS(kappa3, gamma, varphi, 0.2, 0, tau, lambda, CS2C3);
    EIS4 = calc_EIS(kappa4, gamma, varphi, 0, 0.3, tau, lambda, CS2C4);

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
    saveas(gcf,'figure1d.png')

  otherwise
    error('Unknown GRAPH_MODE. Use ''1a'' or ''1b''.')
end

% Helper functions

function CS2C = calc_CS2C(lambda, Phi, alpha, tau)
  CS2C = 1-tau - (lambda - tau) * (1 - alpha) * (1 - Phi);
  CS2C = CS2C ./ (1 - lambda);
end

function kappa = calc_kappa(xi, varphi, Phi, alpha, gamma, CS2C)
  denom = (1 + varphi) + (1 - Phi) .* (1 - alpha) .* (gamma - 1) ./ CS2C;
  kappa = xi .* (varphi + 1) ./ denom;
end


function EIS = calc_EIS(kappa_s, gamma, varphi, Phi, alpha, tau, lambda, CS2C)
common_term1 = (1-Phi) * ((1-alpha) * gamma + varphi) - Phi;

GAMMA = gamma   + kappa_s *Phi ...
    - (kappa_s + gamma) * varphi * common_term1 .*(lambda-tau)./(1-lambda);
EIS = CS2C./GAMMA;
end
