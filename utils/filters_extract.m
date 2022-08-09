function hf = filters_extract(model_mc)
    %% Parameters
%     args = model_mc.args;
%     model = model_mc.model;
    
    args = model_mc{1};
    model = model_mc{2};
    
    %% Extraction
    % h_l_ij: l-th layer, i-th output channel, j-th input channel 
    
    hf = cell(1, args.L);
    
    h_temp = model.fl;
    for i=1:args.C1
        hf{1, 1}{i,1} = double(squeeze(h_temp(i, 1, :)));
    end

    % For depth 4 as a special case
    if args.L == 4
        for d = 0:args.L-2-1
            h_temp = model.(strcat('hl_', num2str(d+1)));
            if d == 0
                for j=1:args.C2
                    for i=1:args.C1
                        hf{1, d+2}{j,i} = double(squeeze(h_temp(j, i, :)));
                    end
                end
            elseif d == 1
                for j=1:args.C3
                    for i=1:args.C2
                        hf{1, d+2}{j,i} = double(squeeze(h_temp(j, i, :)));
                    end
                end
            end
        end
    else
        for d = 0:args.L-2-1
            h_temp = model.(strcat('hl_', num2str(d+1)));
            for j=1:args.C2
                for i=1:args.C1
                    hf{1, d+2}{j,i} = double(squeeze(h_temp(j, i, :)));
                end
            end
        end
    end
    
    if args.L == 4
        h_temp = model.ll;
        for j=1:args.C3
            hf{1, args.L}{1, j} = double(squeeze(h_temp(1, j, :)));
        end
    else
        h_temp = model.ll;
        for j=1:args.C2
            hf{1, args.L}{1, j} = double(squeeze(h_temp(1, j, :)));
        end
    end

end