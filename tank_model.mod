% Two-Agent New Keynesian (TANK) Model without Capital
% This model features two household types: Saver and Hand-to-Mouth
% 
% Variables and Parameters:
% - c_s: consumption of Saver household
% - c_h: consumption of Hand-to-Mouth household
% - w: real wage
% - y: output
% - pi: inflation rate
% - i: nominal interest rate
% - a: preference shock
% - u: unemployment rate / labor supply shock

var c_s c_h w y pi i a u n;
varexo eps_a eps_i eps_u;

parameters beta_s beta_h sigma gamma theta phi_pi phi_y rho_a rho_i rho_u lambda_h;

% Household parameters
beta_s = 0.99;          % Discount factor (Saver)
beta_h = 0.99;          % Discount factor (Hand-to-Mouth)
sigma = 1.0;            % Risk aversion parameter
gamma = 1.0;            % Frisch elasticity of labor supply (inverse)
theta = 0.75;           % Calvo parameter (price stickiness)
lambda_h = 0.25;        % Share of Hand-to-Mouth households

% Policy parameters
phi_pi = 1.5;           % Inflation coefficient in Taylor rule
phi_y = 0.5;            % Output gap coefficient in Taylor rule

% Shock persistence
rho_a = 0.9;            % Preference shock persistence
rho_i = 0.5;            % Monetary policy shock persistence
rho_u = 0.9;            % Labor supply shock persistence

model;

% 1. Saver household Euler equation
% c_s(t) = (beta_s * E[c_s(t+1)]) + (1 - beta_s) * w(t)
c_s = beta_s * c_s(+1) - (1/sigma) * (i - pi(+1) - rho_a * a);

% 2. Hand-to-Mouth household consumption = current income
% c_h(t) = w(t) * n(t)
c_h = w + n;

% 3. Aggregate consumption
% c(t) = lambda_h * c_h(t) + (1 - lambda_h) * c_s(t)
y = lambda_h * c_h + (1 - lambda_h) * c_s;

% 4. Labor supply (from aggregation across households)
% n(t) = -gamma * w(t) + u(t)
n = -gamma * w + u;

% 5. Real wage determination
% w(t) = sigma * c_s(t) + gamma * n(t)
w = sigma * c_s + gamma * n;

% 6. New Keynesian Phillips Curve
% pi(t) = beta_s * E[pi(t+1)] + ((sigma + gamma) / theta) * (y - n)
pi = beta_s * pi(+1) + ((sigma + gamma) / theta) * (y - n);

% 7. Monetary policy (Taylor Rule)
% i(t) = phi_pi * pi(t) + phi_y * y(t) + eps_i(t)
i = phi_pi * pi + phi_y * y + eps_i;

% 8. Preference shock (AR(1) process)
a = rho_a * a(-1) + eps_a;

% 9. Labor supply shock (AR(1) process)
u = rho_u * u(-1) + eps_u;

end;

initval;
c_s = 0;
c_h = 0;
w = 0;
y = 0;
pi = 0;
i = 0;
a = 0;
u = 0;
n = 0;
end;

shocks;
var eps_a = 0.01^2;         % Preference shock variance
var eps_i = 0.0025^2;       % Monetary policy shock variance
var eps_u = 0.01^2;         % Labor supply shock variance
end;

steady_state_model;
c_s = 0;
c_h = 0;
w = 0;
y = 0;
pi = 0;
i = 0;
a = 0;
u = 0;
n = 0;
end;

% Computation and simulation
options_.solve_tol = 1e-12;

% Solve the model
resid;
steady;
check;

% Compute impulse responses and simulations
stoch_simul(order=1, irf=40, periods=1000) c_s c_h w y pi i;
