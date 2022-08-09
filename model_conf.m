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

% 5% Sparsity
    model_temp = cell(3, 1);
%     Args
    model_temp{1} = struct;
    model_temp{1}.model_name = 'CNN';
    model_temp{1}.L = 3;
    model_temp{1}.C1 = 4;
    model_temp{1}.C2 = 4;
    model_temp{1}.k1 = 11;
    model_temp{1}.k2 = 35;
    model_temp{1}.k3 = 1;
    model_temp{1}.i = 0; 
    model_temp = model_loading(model_temp);
    models{end+1} = model_temp;
%     
    % 10% Sparsity
%     model_temp = cell(3, 1);
% %     Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 3;
%     model_temp{1}.C1 = 4;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 1; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;

% %     % 15% Sparsity
%     model_temp = cell(3, 1);
% %     Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 3;
%     model_temp{1}.C1 = 4;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 2; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
% 
% %     % 5%-10% Sparsity
%     model_temp = cell(3, 1);
% %     Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 3;
%     model_temp{1}.C1 = 4;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 3; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
% 
%     % 20% Sparsity
%     model_temp = cell(3, 1);
% %     Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 3;
%     model_temp{1}.C1 = 4;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 4; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;

%     % Ten to Fifteen Percent Sparsity
%     model_temp = cell(3, 1);
% %     Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 3;
%     model_temp{1}.C1 = 4;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 5; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
% 
%     % Five to Fifteen Percent Sparsity
%     model_temp = cell(3, 1);
% %     Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 3;
%     model_temp{1}.C1 = 4;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 6; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
% 
%     % Ten to Twenty Percent Sparsity
%     model_temp = cell(3, 1);
% %     Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 3;
%     model_temp{1}.C1 = 4;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 7; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
% 
% %   Five to Twenty Percent
%     model_temp = cell(3, 1);
% %     Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 3;
%     model_temp{1}.C1 = 4;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 9;
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;

%%Single Sparsity (10%)
% %       7x7x7
%     model_temp = cell(3, 1);
% %     Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 3;
%     model_temp{1}.C1 = 7;
%     model_temp{1}.C2 = 7;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 0;
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
% 
%     % 6x6x6
%     model_temp = cell(3, 1);
% %     Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 3;
%     model_temp{1}.C1 = 6;
%     model_temp{1}.C2 = 6;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 0;
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
% 
%      % 8x8x8
%     model_temp = cell(3, 1);
% %     Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 3;
%     model_temp{1}.C1 = 8;
%     model_temp{1}.C2 = 8;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 0;
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
% 
%     % 5x5x5
%     model_temp = cell(3, 1);
% %     Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 3;
%     model_temp{1}.C1 = 5;
%     model_temp{1}.C2 = 5;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 0;
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
% 
%     % 9x9x9
%     model_temp = cell(3, 1);
% %     Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 3;
%     model_temp{1}.C1 = 9;
%     model_temp{1}.C2 = 9;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 0;
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
% 
%     % 10x10x10
%     model_temp = cell(3, 1);
% %     Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 3;
%     model_temp{1}.C1 = 10;
%     model_temp{1}.C2 = 10;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 0;
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
% % 
%     % 11x11x11
%     model_temp = cell(3, 1);
% %     Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 3;
%     model_temp{1}.C1 = 11;
%     model_temp{1}.C2 = 11;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 0;
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
% 
%     % 12x12x12
%     model_temp = cell(3, 1);
% %     Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 3;
%     model_temp{1}.C1 = 12;
%     model_temp{1}.C2 = 12;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 0;
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;

%%Range of Sparsity (5% - 15%)
% %     4x4x4
%     model_temp = cell(3, 1);
% %     Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 3;
%     model_temp{1}.C1 = 4;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 10;
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
% 
%     % 5x5x5
%     model_temp = cell(3, 1);
% %     Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 3;
%     model_temp{1}.C1 = 5;
%     model_temp{1}.C2 = 5;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 1;
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
% 
%     % 6x6x6
%     model_temp = cell(3, 1);
% %     Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 3;
%     model_temp{1}.C1 = 6;
%     model_temp{1}.C2 = 6;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 1;
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
% 
%     % 7x7x7
%     model_temp = cell(3, 1);
% %     Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 3;
%     model_temp{1}.C1 = 7;
%     model_temp{1}.C2 = 7;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 1;
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
% 
%     % 8x8x8
%     model_temp = cell(3, 1);
% %     Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 3;
%     model_temp{1}.C1 = 8;
%     model_temp{1}.C2 = 8;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 1;
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
% 
%     % 9x9x9
%     model_temp = cell(3, 1);
% %     Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 3;
%     model_temp{1}.C1 = 9;
%     model_temp{1}.C2 = 9;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 1;
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
% 
%     % 10x10x10
%     model_temp = cell(3, 1);
% %     Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 3;
%     model_temp{1}.C1 = 10;
%     model_temp{1}.C2 = 10;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 1;
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
% 
%     % 11x11x11
%     model_temp = cell(3, 1);
% %     Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 3;
%     model_temp{1}.C1 = 11;
%     model_temp{1}.C2 = 11;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 1;
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
% 
%     % 12x12x12
%     model_temp = cell(3, 1);
% %     Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 3;
%     model_temp{1}.C1 = 12;
%     model_temp{1}.C2 = 12;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 1;
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;

%%% Increasing number of layers 

%     % 4x4x4
%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 4;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.C3 = 4;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 8; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;

    % 5x5x5
%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 5;
%     model_temp{1}.C2 = 5;
%     model_temp{1}.C3 = 5;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 2; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;

%     6x6x6
%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 6;
%     model_temp{1}.C2 = 6;
%     model_temp{1}.C3 = 6;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 2; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
        
%     7x7x7
%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 7;
%     model_temp{1}.C2 = 7;
%     model_temp{1}.C3 = 7;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 2; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;

%     8x8x8
%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 8;
%     model_temp{1}.C2 = 8;
%     model_temp{1}.C3 = 8;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 2; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;

%     9x9x9
%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 9;
%     model_temp{1}.C2 = 9;
%     model_temp{1}.C3 = 9;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 2; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;

%     10x10x10
%     model_temp = cell(3, 1);
% %     Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 10;
%     model_temp{1}.C2 = 10;
%     model_temp{1}.C3 = 10;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 2; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;

%     11x11x11
%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 11;
%     model_temp{1}.C2 = 11;
%     model_temp{1}.C3 = 11;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 2; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;

%     12x12x12
%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 12;
%     model_temp{1}.C2 = 12;
%     model_temp{1}.C3 = 12;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 2; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;

%%%% 

%     4x4x4
%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 4;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.C3 = 4;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 5; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
   
%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_v1';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 4;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.C3 = 4;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 1; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
% 
%      model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_v1';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 4;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.C3 = 4;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 2; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
% 
%      model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_v1';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 4;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.C3 = 4;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 3; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
% 
%      model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_v1';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 4;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.C3 = 4;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 4; 
%     model_temp = model_loading(model_temp);
% 
%     
%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_v3';
%     model_temp{1}.L = 3;
%     model_temp{1}.C1 = 6;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.C3 = 4;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 1; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
%     
 

%     model_temp = cell(3, 1);
% %     Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_v3';
%     model_temp{1}.L = 3;
%     model_temp{1}.C1 = 6;
%     model_temp{1}.C2 = 2;
%     model_temp{1}.C3 = 2;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 5; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;

%        model_temp = cell(3, 1);
% %     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_v5';
%     model_temp{1}.L = 3;
%     model_temp{1}.C1 = 6;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.C3 = 4;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 0; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
% 
%     model_temp = cell(3, 1);
% %     Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_v6';
%     model_temp{1}.L = 3;
%     model_temp{1}.C1 = 6;
%     model_temp{1}.C2 = 6;
%     model_temp{1}.C3 = 6;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 5; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
% % 
%     model_temp = cell(3, 1);
% %     Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_v3';
%     model_temp{1}.L = 3;
%     model_temp{1}.C1 = 6;
%     model_temp{1}.C2 = 2;
%     model_temp{1}.C3 = 2;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 5; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;

%     model_temp = cell(3, 1);
    % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_v4';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 6;
%     model_temp{1}.C2 = 2;
%     model_temp{1}.C3 = 2;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 5; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;

%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_v4';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 6;
%     model_temp{1}.C2 = 2;
%     model_temp{1}.C3 = 2;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 4; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;

%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_L4_v1';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 2;
%     model_temp{1}.C2 = 6;
%     model_temp{1}.C3 = 2;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 35;
%     model_temp{1}.i = 0; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
% 
%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_L4_v1';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 2;
%     model_temp{1}.C2 = 6;
%     model_temp{1}.C3 = 2;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 35;
%     model_temp{1}.i = 1; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
% 
%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_L4_v1';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 2;
%     model_temp{1}.C2 = 6;
%     model_temp{1}.C3 = 2;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 35;
%     model_temp{1}.i = 3; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;

%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_L4_v1';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 2;
%     model_temp{1}.C2 = 2;
%     model_temp{1}.C3 = 2;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 35;
%     model_temp{1}.i = 2; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;


%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_L4_v3';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 2;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.C3 = 2;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 35;
%     model_temp{1}.i = 0; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp
%     model_temp = cell(3, 1);
% 
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_L4_v3';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 2;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.C3 = 2;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 35;
%     model_temp{1}.i = 1; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp

%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_L4_v3';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 2;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.C3 = 2;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 35;
%     model_temp{1}.i = 2; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp
% 
    model_temp = cell(3, 1);
    % Args
    model_temp{1} = struct;
    model_temp{1}.model_name = 'CCNN_L4_v3';
    model_temp{1}.L = 4;
    model_temp{1}.C1 = 2;
    model_temp{1}.C2 = 4;
    model_temp{1}.C3 = 2;
    model_temp{1}.k1 = 11;
    model_temp{1}.k2 = 35;
    model_temp{1}.k3 = 35;
    model_temp{1}.i = 3; 
    model_temp = model_loading(model_temp);
    models{end+1} = model_temp
% 
%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_L4_v3';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 2;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.C3 = 2;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 35;
%     model_temp{1}.i = 4; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp
    
%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_L4_v4';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 6;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.C3 = 4;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 35;
%     model_temp{1}.i = 0; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp

    model_temp = cell(3, 1);
     % Args
    model_temp{1} = struct;
    model_temp{1}.model_name = 'CCNN_L4_v4';
    model_temp{1}.L = 4;
    model_temp{1}.C1 = 6;
    model_temp{1}.C2 = 4;
    model_temp{1}.C3 = 2;
    model_temp{1}.k1 = 11;
    model_temp{1}.k2 = 35;
    model_temp{1}.k3 = 35;
    model_temp{1}.i = 0; 
    model_temp = model_loading(model_temp);
    models{end+1} = model_temp

%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_L4_v4';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 6;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.C3 = 2;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 35;
%     model_temp{1}.i = 1; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp
% 
    model_temp = cell(3, 1);
    % Args
    model_temp{1} = struct;
    model_temp{1}.model_name = 'CNN_2';
    model_temp{1}.L = 4;
    model_temp{1}.C1 = 6;
    model_temp{1}.C2 = 4;
    model_temp{1}.C3 = 2;
    model_temp{1}.k1 = 11;
    model_temp{1}.k2 = 35;
    model_temp{1}.k3 = 35;
    model_temp{1}.i = 0; 
    model_temp = model_loading(model_temp);
    models{end+1} = model_temp

%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN_2';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 6;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.C3 = 2;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 1; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp

%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_L4_v5';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 6;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.C3 = 4;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 35;
%     model_temp{1}.i = 0; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp
% 
%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN_2';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 6;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.C3 = 4;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 35;
%     model_temp{1}.i = 0; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp
% 
%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_L4_v5';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 6;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.C3 = 4;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 35;
%     model_temp{1}.i = 1; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp
% 
%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN_2';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 6;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.C3 = 4;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 1; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp

%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_L4_v5';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 6;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.C3 = 4;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 35;
%     model_temp{1}.i = 2; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp
% 
%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN_2';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 6;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.C3 = 4;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 2; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp

    model_temp = cell(3, 1);
    % Args
    model_temp{1} = struct;
    model_temp{1}.model_name = 'CCNN_L4_v5';
    model_temp{1}.L = 4;
    model_temp{1}.C1 = 6;
    model_temp{1}.C2 = 4;
    model_temp{1}.C3 = 4;
    model_temp{1}.k1 = 11;
    model_temp{1}.k2 = 35;
    model_temp{1}.k3 = 35;
    model_temp{1}.i = 3; 
    model_temp = model_loading(model_temp);
    models{end+1} = model_temp

    model_temp = cell(3, 1);
    % Args
    model_temp{1} = struct;
    model_temp{1}.model_name = 'CNN_2';
    model_temp{1}.L = 4;
    model_temp{1}.C1 = 6;
    model_temp{1}.C2 = 4;
    model_temp{1}.C3 = 4;
    model_temp{1}.k1 = 11;
    model_temp{1}.k2 = 35;
    model_temp{1}.k3 = 1;
    model_temp{1}.i = 3; 
    model_temp = model_loading(model_temp);
    models{end+1} = model_temp

%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_L4_v5';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 6;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.C3 = 4;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 4; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp
% 
%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN_2';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 6;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.C3 = 4;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 4; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp

%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_L4_v5';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 6;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.C3 = 4;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 35;
%     model_temp{1}.i = 22; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp

%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN_2';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 6;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.C3 = 4;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 14; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp

%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_v6';
%     model_temp{1}.L = 3;
%     model_temp{1}.C1 = 6;
%     model_temp{1}.C2 = 6;
%     model_temp{1}.C3 = 1;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 3; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp
% 
%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 3;
%     model_temp{1}.C1 = 6;
%     model_temp{1}.C2 = 6;
%     model_temp{1}.C3 = 1;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 2; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp


% 
%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_L4_v1';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 2;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.C3 = 2;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 35;
%     model_temp{1}.i = 4; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
% % 
%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_L4_v1';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 2;
%     model_temp{1}.C2 = 6;
%     model_temp{1}.C3 = 2;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 35;
%     model_temp{1}.i = 4; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;

%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_v7';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 2;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.C3 = 2;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 1; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;

%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_v7';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 2;
%     model_temp{1}.C2 = 2;
%     model_temp{1}.C3 = 2;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 2; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
% 
%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_v7';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 2;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.C3 = 2;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 3; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;

%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_v7';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 2;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.C3 = 2;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 4; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;



%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_v4';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 6;
%     model_temp{1}.C2 = 2;
%     model_temp{1}.C3 = 2;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 0; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
% 
%         model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_v4';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 6;
%     model_temp{1}.C2 = 2;
%     model_temp{1}.C3 = 2;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 1; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
% 
%         model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_v4';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 6;
%     model_temp{1}.C2 = 2;
%     model_temp{1}.C3 = 2;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 2; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
% 
%         model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_v4';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 6;
%     model_temp{1}.C2 = 2;
%     model_temp{1}.C3 = 2;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 3; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;


%      model_temp = cell(3, 1);
    % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 3;
%     model_temp{1}.C1 = 6;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.C3 = 4;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 5; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
% 
%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 3;
%     model_temp{1}.C1 = 6;
%     model_temp{1}.C2 = 2;
%     model_temp{1}.C3 = 2;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 0; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
% 
%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 3;
%     model_temp{1}.C1 = 6;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.C3 = 4;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 0; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;

   
% 
%      model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_v5';
%     model_temp{1}.L = 3;
%     model_temp{1}.C1 = 6;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.C3 = 4;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 3; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;

%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_v5';
%     model_temp{1}.L = 3;
%     model_temp{1}.C1 = 6;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.C3 = 4;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 4; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;

   

%      model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CCNN_v2';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 6;
%     model_temp{1}.C2 = 2;
%     model_temp{1}.C3 = 2;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 1; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;



%     model_temp = cell(3, 1);
% %     Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 4;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.C3 = 4;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 5; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
% 
%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 4;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.C3 = 4;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 6; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
% 
%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 4;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.C3 = 4;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 7; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;
% 
%     model_temp = cell(3, 1);
%     % Args
%     model_temp{1} = struct;
%     model_temp{1}.model_name = 'CNN';
%     model_temp{1}.L = 4;
%     model_temp{1}.C1 = 4;
%     model_temp{1}.C2 = 4;
%     model_temp{1}.C3 = 4;
%     model_temp{1}.k1 = 11;
%     model_temp{1}.k2 = 35;
%     model_temp{1}.k3 = 1;
%     model_temp{1}.i = 8; 
%     model_temp = model_loading(model_temp);
%     models{end+1} = model_temp;

   end

   %%Key:
   % i = 0 is single sparsity level (10%)
   % i = 1 is range sparsity (5% - 15%) for L = 3
   % i = 2 is range sparsity (5% - 15%) for L = 4
   % i = 4 -- L = 4, range = 5% - 15% for L = 4
