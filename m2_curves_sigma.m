% % clear all
% close all

clc
rng(1)

addpath(genpath('comparing4'))
addpath('utils')

printme_eps = @(filename) print('-depsc', sprintf('figures/%s', filename));

figcount = 600;
%% CNN models loading
clc

models = model_conf();
for ii = 1:length(models)
    fig_count = ii;
    model_temp = models{ii};
    filters_plot(model_temp, fig_count);
end

% Testing models
fun_loop = {};
for j = 1:length(models)
    fun_loop{j} = @(y) den_CNN(models{j}, y);
end


%% Compute sigma-SNR curves
clc
L = 1000;          % signal length
rho = 0.1;         % signal sparsity level
sigma_x = 5;      % signal std

[sigma_w, SNR_out] = compute_SNR_sigma(L, rho, sigma_x, fun_loop);

SNR_y = SNR_out.SNR_y;
SNR_mmse = SNR_out.SNR_x_mmse;

% Plotting
FontSize = 20;
LineWidth = 2;
figure(figcount)
clf
x_points = [0.5, 0.5, 1.5, 1.5];
y_points = [0, max(SNR_mmse), max(SNR_mmse), 0];
fill(x_points, y_points, [0.9 0.9 1], 'LineStyle','none');
hold on;
semilogx(sigma_w, SNR_y, 'k--', 'LineWidth', LineWidth);
semilogx(sigma_w, SNR_mmse, 'r-', 'LineWidth', LineWidth);
for j = 1:length(models)
    semilogx(sigma_w, SNR_out.SNR_x_hat(j, :), 'o-');
end

% for j = 1:length(models)
%     semilogx(sigma_w, SNR_out.SNR_x_hat(j, :), 'o-');
%     
% 
%     SNR_out.SNR_x_hat(j, :);
%     max_SNR = max(SNR_out.SNR_x_hat(j, :),SNR_val);
%     SNR_val = max_SNR;
% end


hold off;
set(gca,'Xscale', 'log')
box off

legend_list = {'', 'Noisy', 'MMSE', '1','2','3','4','5','6'};
legend(legend_list, 'Interpreter', 'latex', 'FontSize', FontSize);

xlabel('$\sigma_w$ (noise level)', 'Interpreter', 'latex', 'FontSize', FontSize);
ylabel('SNR', 'Interpreter', 'latex', 'FontSize', FontSize);

set(gca, 'xtick', [0.1 0.2 0.5 1 1.5 2.0 4])
xlim([min(sigma_w) max(sigma_w)])
ylim([0, max(SNR_mmse)])

