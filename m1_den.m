clear all
close all

clc
rng(1)

addpath(genpath('pretr_models'))
addpath('utils')

printme_eps = @(filename) print('-depsc', sprintf('figures/%s', filename));

myrmse = @(x, xhat) mean((xhat - x).^2); % RMSE function

figcount = 50;
%% CNN models loading
clc


models = model_conf();
for ii = 1:length(models)
    fig_count = ii;
    model_temp = models{ii};
    filters_plot(model_temp, fig_count);
end


%%
% Testing models: plotting clean, noisy and denoised signals
fun_loop = {};
for j = 1:length(models)
    fun_loop{j} = @(y) den_CNN(models{j}, y, length(models{j}{3}));
end

%% Denoising example
clc
rng(0)

% Signal generation
N = 500;                            % signal length
rho = 0.1;                          % sparsity level
sigma_x = 10.0;                     % Gaussian standard deviation
x = sparse_signal(N, rho, sigma_x);

error_neg = 0;
error_tr = 0;
sigma_w = 0.0;                      % noise standard deviation
y = x + sigma_w * randn(size(x));   % Noisy signal
% y = zeros(size(x));
% y(250) = 1;

% Denoising using CNN
for i = 1:2
    CNN = fun_loop{i};
    x_hat_CNN = CNN(y);
    [negation_error(i), time_reversal_error(i)] = calculate_error(y, CNN); 
end
negation_error = [negation_error(1); negation_error(2)];
time_reversal_error = [time_reversal_error(1); time_reversal_error(2)];

network = ["Constrained CNN";"Unconstrained CNN"]
T = table(network,negation_error,time_reversal_error);

fig = uifigure;
uit = uitable(fig,'Data',T)

%plot clean and noisy signal
figure(10)
clf
subplot(2, 1, 1)
stem(x, 'k.')
title('Clean signal')
subplot(2, 1, 2)
stem(y, 'b.')
title(sprintf('Noisy signal. RSME = %.3f; SNR = %.3f dB', myrmse(x, y), SNR(y, x)))
% print -dpdf figures/Noisy


%plot noisy and denoised signals
figure(11)
clf
subplot(2, 1, 1)
stem(y, 'k.')
title('Noisy signal')
subplot(2, 1, 2)
stem(x_hat_CNN, 'b.')
title(sprintf('CNN Denoised Signal. RSME = %.3f; SNR = %.2f dB',...
        myrmse(x, x_hat_CNN), SNR(x_hat_CNN, x)))


%% Compute rho-SNR curves
clc

L = 1000;          % signal length
sigma_x = 10.0;      % signal std
sigma_w = 0.5;     % signal noise

[rho, SNR_out] = compute_SNR_rho(L, sigma_x, sigma_w, fun_loop);

SNR_y = SNR_out.SNR_y;
SNR_mmse = SNR_out.SNR_x_mmse;

% Plotting SNR vs rho
FontSize = 14;
LineWidth = 1.5;

figure(1)
clf 
x_points_10 = [0.099, 0.099, 0.101, 0.101]; 
y_points = [0, 30, 30, 0];
fill(x_points_10, y_points, [0.9 0.9 1], 'LineStyle','none');

semilogx(rho, SNR_y, 'k--', 'LineWidth', LineWidth);
hold on
semilogx(rho, SNR_mmse, 'r-', 'LineWidth', LineWidth);
SNR_val = 0;
for j = 1:length(models)
    semilogx(rho, SNR_out.SNR_x_hat(1, :), 'LineWidth', LineWidth, 'color', 'green');
    semilogx(rho, SNR_out.SNR_x_hat(2, :), 'LineWidth', LineWidth, 'color', 'yellow');

    SNR_out.SNR_x_hat(j, :)
    max_SNR = max(SNR_out.SNR_x_hat(j, :),SNR_val);
    SNR_val = max_SNR;
end
% semilogx(rho,n max_SNR, 'r-', 'LineWidth', LineWidth);
hold off;
set(gca,'Xscale', 'log')
box off

legend_list = {'Noisy', 'MMSE', 'Constrained CNN','Unconstrained CNN'}
legend(legend_list, 'Interpreter', 'latex', 'FontSize', FontSize, 'Location', 'se');

xlabel('$\rho$', 'Interpreter', 'latex', 'FontSize', FontSize);
ylabel('SNR', 'Interpreter', 'latex', 'FontSize', FontSize);

set(gca, 'xtick', [0.01 0.05 0.1 0.2 0.5 0.8])
xlim([min(rho) max(rho)])
% ylim([0, max(SNR_mmse)])



%% Compute sigma-SNR curves
clc
L = 1000;          % signal length
rho = 0.1;         % signal sparsity level
sigma_x = 5;      % signal std

[sigma_w, SNR_out] = compute_SNR_sigma(L, rho, sigma_x, fun_loop);

SNR_y = SNR_out.SNR_y;
SNR_mmse = SNR_out.SNR_x_mmse;

% Plotting SNR vs sigma 
FontSize = 20;
LineWidth = 2;
figure(2)
clf
x_points = [0.5, 0.5, 1.5, 1.5];
y_points = [0, max(SNR_mmse), max(SNR_mmse), 0];
% fill(x_points, y_points, [0.9 0.9 1], 'LineStyle','none');
hold on;
semilogx(sigma_w, SNR_y, 'k--', 'LineWidth', LineWidth);
semilogx(sigma_w, SNR_mmse, 'r-', 'LineWidth', LineWidth);
for j = 1:length(models)
    semilogx(sigma_w, SNR_out.SNR_x_hat(j, :), 'LineWidth', LineWidth);
end
hold off;
set(gca,'Xscale', 'log')
box off

legend_list = {'Noisy', 'MMSE', 'Constrained CNN', 'Unconstrained CNN'};
legend(legend_list, 'Interpreter', 'latex', 'FontSize', 12);

xlabel('$\sigma_w$', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('SNR', 'Interpreter', 'latex', 'FontSize', 12);

set(gca, 'xtick', [0.1 0.2 0.5 1 1.5 2.0 4])
xlim([min(sigma_w) max(sigma_w)])
ylim([0, max(SNR_mmse)])

