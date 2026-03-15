% parameters
gamma = 1.0;
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

% lambda formula
lambda = calc_lambda(kappa, alpha, Phi, gamma, varphi, tau);
lambda2 = calc_lambda(kappa2, alpha2, Phi2, gamma, varphi, tau);
lambda3 = calc_lambda(kappa3, alpha3, Phi3, gamma, varphi, tau);
lambda4 = calc_lambda(kappa4, alpha4, Phi4, gamma, varphi, tau);

% plot
figure;
plot(xi, lambda, '-', 'LineWidth', 1.5);
hold on;
plot(xi, lambda2, '--', 'LineWidth', 1.5);
plot(xi, lambda3, ':', 'LineWidth', 1.5);
plot(xi, lambda4, '-.', 'LineWidth', 1.5);
xlabel('\xi');
ylabel('\lambda');
grid on;
xlim([xi_min xi_max]);
ylim([0 1]);
yline(tau, '--', '\lambda=\tau', 'LabelHorizontalAlignment', 'left');
xline(0, '--', '\xi=0', 'LabelHorizontalAlignment', 'left');
legend('\alpha=0.3,\Phi=0.2', '\alpha=0,\Phi=0', '\alpha=0,\Phi=0.2', '\alpha=0.3,\Phi=0', ...
  'Location', 'best');
saveas(gcf,'figure3.png')

function kappa = calc_kappa(xi, varphi, Phi, alpha, gamma)
denom = (1 + varphi) + (1 - Phi) * (1 - alpha) * (gamma - 1);
kappa = xi * (varphi + 1) ./ denom;
end

function lambda = calc_lambda(kappa_s, alpha, Phi, gamma, varphi, tau)
term = (1 - Phi) .* (gamma * (1 - alpha) + varphi) - Phi;

lambda = (gamma + kappa_s .* Phi + (gamma + kappa_s) .* tau .* term) ./ ...
  (gamma + kappa_s .* Phi + (gamma + kappa_s) .* term);
end
