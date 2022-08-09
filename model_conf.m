function models = model_conf()
% Load multiple models
% Output: 
%   models: length equal to number of loaded models
%   models{c}: model number c
%   models{c}{1} = args: stores all model related arguments
%   models{c}{2}: stores python filters in structure format
%   models{c}{3}: store the filters in matlab cell array
%

    %% Begin
    models = cell(0);
    
    %% Testing gradual structures
    models = CNN_models(models);
end

%% Help functions

function [model_sn, model] = model_loading_basic(args)
    model_sn = strcat(args.model_name,'_L',num2str(args.L));
    model_sn = strcat(model_sn, '_C1',num2str(args.C1),'_C2',num2str(args.C2));
    if args.L == 4
        model_sn = strcat(model_sn, '_C3',num2str(args.C3));
    end
    model_sn = strcat(model_sn,'_k', num2str(args.k1),'_k', num2str(args.k2),'_k',num2str(args.k3));
    model_sn = strcat(model_sn, '_i',num2str(args.i, '%0.2d'));
    model_sn = strcat(model_sn, '_l',num2str(args.l, '%0.2d'));
    model_sn = strcat(model_sn, '_u',num2str(args.u, '%0.2d'));
    model = load(strcat(model_sn,'.mat'));
end

function model_mc = model_loading(model_mc)

    % load a pre-trained model
    [model_mc{1}.model_sn, model_mc{2}] = model_loading_basic(model_mc{1});
    
    % extract filters
    model_mc{3} = filters_extract(model_mc);
    
end

%% CNN
function models = CNN_models(models)


            model_temp = cell(3, 1);
%     Args
    model_temp{1} = struct;
    model_temp{1}.model_name = 'CCNN_v3';
    model_temp{1}.L = 3;
    model_temp{1}.C1 = 6;
    model_temp{1}.C2 = 2;
    model_temp{1}.k1 = 11;
    model_temp{1}.k2 = 35;
    model_temp{1}.k3 = 1;
    model_temp{1}.i = 0; 
    model_temp{1}.l = 10; 
    model_temp{1}.u = 10; 
    model_temp = model_loading(model_temp);
    models{end+1} = model_temp;
                model_temp = cell(3, 1);
%     Args
    model_temp{1} = struct;
    model_temp{1}.model_name = 'CNN';
    model_temp{1}.L = 3;
    model_temp{1}.C1 = 6;
    model_temp{1}.C2 = 2;
    model_temp{1}.k1 = 11;
    model_temp{1}.k2 = 35;
    model_temp{1}.k3 = 1;
    model_temp{1}.i = 0; 
    model_temp{1}.l = 10; 
    model_temp{1}.u = 10; 
    model_temp = model_loading(model_temp);
    models{end+1} = model_temp;
    end

