function [sigma_w, SNR_out] = compute_SNR_sigma(L, rho, sigma_x, fun_loop)
%
% INPUT
%   N : length of signal
%   rho : sparsity level ( 0 < rho < 1 )
%   sigma_x : signal standard deviation (scalar)
%   varargin : different denoising methods 
% 
% OUTPUT
%   sigma_w : noise standard deviations
%   varargout : SNR of estimated signal using input methods in varargin, and
%   SNR_y that is the SNR of noisy signal
%
% Notes
%  rho = 0.1 means that 10% of the signal is non-zero

%% Set parameters

Nr = 1e3;     % 1e2: Number of realizations

min_sigma_w = 0.05;  % min noise std range
max_sigma_w = 2.0;  % max noise std range
num_sigmas_w = 20;  % 50: number of noise std points in the range

%% Initialization

sigma_w = logspace(log10(min_sigma_w), log10(max_sigma_w), num_sigmas_w);

SNR_y_vals = nan(num_sigmas_w, Nr);
SNR_x_mmse_vals = nan(num_sigmas_w, Nr);

nmethods = length(fun_loop);
SNR_x_hat_vals = nan(nmethods, num_sigmas_w, Nr);

%% Computation

for i = 1:num_sigmas_w
    % loop over noise levels
    fprintf('progress = %0.0f/100 \n', i/num_sigmas_w*100);

    for j = 1:Nr
        % loop over realizations

        x = sparse_signal(L, rho, sigma_x);
        y = x + sigma_w(i) * randn(L, 1);
        
        x_MMSE = MMSE_est(y, rho, sigma_x, sigma_w(i)); % MMSE
        
        SNR_y_vals(i, j) = SNR(y, x);
        SNR_x_mmse_vals(i, j) = SNR(x_MMSE, x);
        
        % signal estimation using denosing methods
        for z = 1:nmethods
            fun_curr = fun_loop{z};
            x_hat = fun_curr(y);
            SNR_x_hat_vals(z, i, j) = SNR(x_hat, x);
        end
        
    end
end


%% Average across realizations
SNR_out = struct;
SNR_out.SNR_y = mean(SNR_y_vals, [2]);
SNR_out.SNR_x_mmse = mean(SNR_x_mmse_vals, [2]);
SNR_out.SNR_x_hat = mean(SNR_x_hat_vals, [3]);


