function [rho, SNR_out] = compute_SNR_rho(L, sigma_x, sigma_w, fun_loop)
%
% INPUT
%   N : length of signal
%   rho : sparsity level ( 0 < rho < 1 )
%   sigma_x : signal standard deviation (scalar)
%   varargin : different denoising methods 
% 
% OUTPUT
%   rho : sparsity level
%   varargout : SNR of estimated signal using input methods in varargin, and
%   SNR_y that is the SNR of noisy signal
%
% Notes
%  rho = 0.1 means that 10% of the signal is non-zero

%% Set parameters

Nr = 1e3;     % Number of realizations: 1e3

min_rho = 0.01;  % min rho std range
max_rho = 0.5;  % max rho std range
num_rho = 100;  % number of rho std points in the range: 100

%% Initialization

rho = linspace(min_rho, max_rho, num_rho);

SNR_y_vals = nan(num_rho, Nr);
SNR_x_mmse_vals = nan(num_rho, Nr);

nmethods = length(fun_loop);
SNR_x_hat_vals = nan(nmethods, num_rho, Nr);

%% Computation

for i = 1:num_rho
    % loop over rho levels
    fprintf('progress = %0.0f/100 \n', i/num_rho*100);

    for j = 1:Nr
        % loop over realizations

        x = sparse_signal(L, rho(i), sigma_x);
        y = x + sigma_w * randn(L, 1);
        
        x_MMSE = MMSE_est(y, rho(i), sigma_x, sigma_w); % MMSE
        
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


