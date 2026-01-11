% parameters
gamma =10;
tau = 0.2;
varphi = 1;
Phi_min = 0;
Phi_max = 0.5;
Phi = linspace(Phi_min, Phi_max, 500);
alpha = 0.3;

% Xi terms
Xi1 = calc_Xi1(alpha, Phi, gamma, varphi);

% plot
figure;
plot(Phi, Xi1, '-', 'LineWidth', 1.5);
xlabel('\Phi');
ylabel('\Xi_1');
grid on;
xlim([Phi_min Phi_max]);

function Xi1 = calc_Xi1(alpha, Phi, gamma, varphi)
   Xi1 = ((1 - alpha) * gamma + varphi) ./ ((1 - alpha) * (gamma + varphi)) .* ...
     ((1 + varphi) + (1 - Phi) * (1 - alpha) * (gamma - 1));

end
