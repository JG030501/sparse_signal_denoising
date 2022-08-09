function x_MMSE = MMSE_est(y, rho, sigma_x, sigma_w)
    
    sigma_w_2 = sigma_w.^2;
    sigma_x_2 = sigma_x.^2;

    mu_bar = sigma_x_2 / (sigma_w_2 + sigma_x_2) * y;

    C_int = n_pdf(y, 0, sqrt(sigma_w_2 + sigma_x_2)); 
    C = (1 - rho) ./ (rho * C_int);

    x_MMSE = mu_bar ./ (C .* n_pdf(y, 0, sigma_w) + 1);

end


function y = n_pdf(x, mu, sigma)
    y = exp(-0.5 * ((x - mu)./sigma).^2) ./ (sqrt(2*pi) .* sigma);
end

function y = n_cdf(x, mu, sigma)
    y = 0.5 * erfc(-(x - mu)./(sqrt(2) * sigma));
end
