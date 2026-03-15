clear all

dynare TANKC_model1.mod -DFLAG=0 -DALPHA=0 -DPHI=0
dynare TANKC_model2.mod -DFLAG=0 -DLUMPSUM=0
g00  = oo_.irfs.c_S_eps_m-oo_.irfs.c_H_eps_m;
y00  = oo_.irfs.c_eps_m;

dynare TANKC_model1.mod -DFLAG=0 -DALPHA=1 -DPHI=0
dynare TANKC_model2.mod -DFLAG=0 -DLUMPSUM=0
g10  = oo_.irfs.c_S_eps_m-oo_.irfs.c_H_eps_m;
y10  = oo_.irfs.c_eps_m;

dynare TANKC_model1.mod -DFLAG=0 -DALPHA=0 -DPHI=1
dynare TANKC_model2.mod -DFLAG=0 -DLUMPSUM=0
g01  = oo_.irfs.c_S_eps_m-oo_.irfs.c_H_eps_m;
y01  = oo_.irfs.c_eps_m;

dynare TANKC_model1.mod -DFLAG=0 -DALPHA=1 -DPHI=1
dynare TANKC_model2.mod -DFLAG=0 -DLUMPSUM=0
g11  = oo_.irfs.c_S_eps_m-oo_.irfs.c_H_eps_m;
y11  = oo_.irfs.c_eps_m;


% 比較用の簡単な差分チェック
t=1:20;

close all

figure;
plot(t,y00, '-', 'LineWidth', 2); hold on;
plot(t,y01, '--', 'LineWidth', 2);
plot(t,y10, ':', 'LineWidth', 2);
plot(t,y11, '-.', 'LineWidth', 2);
xlabel('period')
ylabel('deviation')
grid on;
xlim([1 20]);
legend('\alpha=0.0, \Phi=0.0','\alpha=0.3, \Phi=0.0','\alpha=0.0, \Phi=0.2','\alpha=0.3, \Phi=0.2')
title('IRF (consumption)')
saveas(gcf,'figure7.png')

figure;
plot(t,g00, '-', 'LineWidth', 2); hold on;
plot(t,g01, '--', 'LineWidth', 2);
plot(t,g10, ':', 'LineWidth', 2);
plot(t,g11, '-.', 'LineWidth', 2);
xlabel('period')
ylabel('deviation')
grid on;
xlim([1 20]);
legend('\alpha=0.0, \Phi=0.0','\alpha=0.3, \Phi=0.0','\alpha=0.0, \Phi=0.2','\alpha=0.3, \Phi=0.2','Location','southeast')
title('IRF (consumption gap)')
saveas(gcf,'figure8.png')
