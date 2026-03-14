clear all

dynare TANKC_model1.mod -DFLAG=0

dynare TANKC_model2.mod -DFLAG=0 -DLUMPSUM=0
%y00  = oo_.irfs.c_S_eps_m-oo_.irfs.c_H_eps_m;
y00  = oo_.irfs.c_eps_m;

dynare TANKC_model2.mod -DFLAG=0 -DLUMPSUM=1
%y01  = oo_.irfs.c_S_eps_m-oo_.irfs.c_H_eps_m;
y01  = oo_.irfs.c_eps_m;

dynare TANKC_model1.mod -DFLAG=1

dynare TANKC_model2.mod -DFLAG=1 -DLUMPSUM=0
%y10  = oo_.irfs.c_S_eps_m-oo_.irfs.c_H_eps_m;
y10  = oo_.irfs.c_eps_m;
dynare TANKC_model2.mod -DFLAG=1 -DLUMPSUM=1
%y11  = oo_.irfs.c_S_eps_m-oo_.irfs.c_H_eps_m;
y11  = oo_.irfs.c_eps_m;

% 比較用の簡単な差分チェック
t=1:20;

close all
% figure;
% plot(t,y00, t,y01, 'LineWidth', 2)
% legend('LUMPSUM=0','LUMPSUM=1')
% title('Base model')
% xlabel('period')
% ylabel('deviation')

% figure;
% plot(t,y10, t,y11, 'LineWidth', 2)
% legend('LUMPSUM=0','LUMPSUM=1')
% title('Labor Union model')
% xlabel('period')
% ylabel('deviation')

figure;
plot(t,y00, t,y01, t,y10, 'LineWidth', 2)
legend('Base model','Lumpsum Transfer model','Labor Union model')
title('model comparison')
xlabel('period')
ylabel('deviation')
