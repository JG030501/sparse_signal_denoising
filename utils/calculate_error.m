function [error_neg,error_tr] = calculate_error(y, CNN)
    
    error_neg = norm(CNN(-y) - (-CNN(y)));
    error_tr = norm(CNN(TRv(y)) - (TRv(CNN(y))));


end