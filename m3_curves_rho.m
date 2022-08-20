% % clear all
% close all

clc
rng(1)

addpath(genpath('comparing4'))
addpath('utils')

printme_eps = @(filename) print('-depsc', sprintf('figures/%s', filename));

figcount = 200;



%% CNN models loading

%%title
clc

models = model_conf();
for ii = 1:length(models)
    fig_count = ii;
    model_temp = models{ii};
    filters_plot(model_temp, fig_count);
    %filters_freq_plot(model_temp, fig_count);
end

% Testing models
fun_loop = {};
for j = 1:length(models)
    fun_loop{j} = @(y) den_CNN(models{j}, y);
end

%% Compute rho-SNR curves
clc
cmap = {[0.851 0.851 0.851];[0.498 1 1];[0.298 0.8 1];[0 0.6196 1];[0 0 0.9529];[0.09804 1 0.09804];[0.09804 0.6 0.09804];[1 0.749 1];[1 0.4 1];[0.8 0.09804 1];[1 1 0];[1 0.651 0];[0.9529 0.298 0];[0.8 0 0]};

L = 1000;          % signal length
sigma_x = 10.0;      % signal std
sigma_w = 0.5;     % signal noise

[rho, SNR_out] = compute_SNR_rho(L, sigma_x, sigma_w, fun_loop);

SNR_y = SNR_out.SNR_y;
SNR_mmse = SNR_out.SNR_x_mmse;

% Plotting
FontSize = 10;
LineWidth = 1.5;

figure(figcount)
clf
% x_points_5 = [0.049, 0.049, 0.051, 0.051]; 
x_points_10 = [0.099, 0.099, 0.101, 0.101]; 

y_points = [0, 30, 30, 0];
% fill(x_points_5, y_points, [0.9 0.9 1], 'LineStyle','none');
fill(x_points_10, y_points, [0.9 0.9 1], 'LineStyle','none');

% line(x_points_5,y_points,[1, 0.9 0.9 1]);
% line(x_points_10,y_points,[0.9 0.9 1]);

C = max(SNR_y,SNR_mmse);
hold on;
semilogx(rho, SNR_y, 'k--', 'LineWidth', LineWidth);
semilogx(rho, SNR_mmse, 'r-', 'LineWidth', LineWidth);
SNR_val= 0;
% for j = 1:length(models)
%     semilogx(rho, SNR_out.SNR_x_hat(j, :), 'LineWidth', LineWidth,'Color', cmap{j});
%     max_SNR = max(SNR_out.SNR_x_hat(j,:),SNR_val);
%     SNR_val = max_SNR;
%     
% end

for j = 1:length(models)
    semilogx(rho, SNR_out.SNR_x_hat(j, :), 'o-');
    

    SNR_out.SNR_x_hat(j, :);
    max_SNR = max(SNR_out.SNR_x_hat(j, :),SNR_val);
    SNR_val = max_SNR;
end

hold off;
set(gca,'Xscale', 'log')
box off
%legend_list = {'', 'Noisy', 'MMSE', '4x4 2 hidden layers 120 epochs unconstrained' , '4x4 1 hidden unconstrained','c0', 'c1', 'c2', 'c3', 'c4', 'c0 10' '1' '2' '3' '4'};
legend_list = {'', 'Noisy', 'MMSE','1', '2', '3', '4', '5','6','7','8','9','10'};
legend(legend_list, 'Interpreter', 'latex', 'FontSize', 14, 'Location', 'se');

xlabel('$\rho$ (sparsity level)', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('SNR', 'Interpreter', 'latex', 'FontSize', 14);

set(gca, 'xtick', [0.01 0.05 0.1 0.2 0.5 0.8])
xlim([min(rho) max(rho)])
% ylim([0, max(SNR_mmse)])
% ylim1 = ylim;


%
function y = TRv(x)

    y = x(end:-1:1);

end
