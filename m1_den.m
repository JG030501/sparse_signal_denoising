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
