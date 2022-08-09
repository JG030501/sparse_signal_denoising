function filters_plot_2(model_mc, fig_count)
    %% Parameters
    args = model_mc{1};
    h = model_mc{3};
    
    LineWidth = 0.5; FontSize = 10; MarkerSize = 1.0;
    ylim_minmax = [-0.5, 1.5];
    colors = ['r', 'b', 'k'];
    
    k_extra = 1;
    
    %% plotting
    
    if args.L == 3
    
        fig_r = max([args.C1, args.C2]);
        fig_c = 2 + args.C1;
        
        plt_eps_n = 0.1;
        plt_eps_p = 0.1;

        figure(fig_count)
        clf
        tiledlayout(fig_r, fig_c, 'TileSpacing', 'Compact', 'Padding', 'Compact');
        for i=1:args.C1
            nexttile(i + (i-1)*(fig_c-1));
            h_temp = h{1, 1}{i,1};
            K = (length(h_temp) - 1)/2; xK = -K:K;
            stem(xK, h_temp, colors(1), 'LineWidth', LineWidth, 'MarkerSize', MarkerSize);
            if K ~= 0
                xlim([-K-k_extra, K+k_extra])
            end
            ylim([min(h_temp)-plt_eps_n, max(h_temp)+plt_eps_p])
            title(strcat('$h^{(1)}_{', num2str(i), '1}$'),'Interpreter','latex','FontSize',FontSize);
        end
        
        plt_eps_n = 0.0;
        plt_eps_p = 0.0;

        for i=1:args.C1
            for j=1:args.C2
                nexttile(i+1 + (j-1)*fig_c);
                h_temp = h{1, 2}{j,i};
                K = (length(h_temp) - 1)/2; xK = -K:K;
                stem(xK, h_temp,  colors(2), 'LineWidth', LineWidth, 'MarkerSize', MarkerSize);
                if K ~= 0
                    xlim([-K-k_extra, K+k_extra])
                end
                ylim([min(h_temp)-plt_eps_n, max(h_temp)+plt_eps_p])
                title(strcat('$h^{(2)}_{', num2str(j), num2str(i), '}$'),'Interpreter','latex','FontSize',FontSize);
            end
        end
        
        plt_eps_n = 0.1;
        plt_eps_p = 0.1;

        for j=1:args.C2
            nexttile(j*fig_c);
            h_temp = h{1, 3}{1,j};
            K = (length(h_temp) - 1)/2; xK = -K:K;
            stem(xK, h_temp,  colors(3), 'LineWidth', LineWidth, 'MarkerSize', MarkerSize);
            if K ~= 0
                xlim([-K-k_extra, K+k_extra])
            end
            ylim([min(h_temp)-plt_eps_n, max(h_temp)+plt_eps_p])
                
            title(strcat('$h^{(3)}_{1', num2str(j), '}$'),'Interpreter','latex','FontSize',FontSize);
        end
        
        
%         sgtitle(strrep(model_mc{1}.model_sn,'_','-'),'FontSize',FontSize);
        
    elseif args.L == 4
        fig_r = max([args.C1, args.C2, args.C3]);
        fig_c = 2 + args.C1 + args.C2;

        plt_eps_n = 0.1;
        plt_eps_p = 0.1;

        figure(fig_count)
        clf
        tiledlayout(fig_r, fig_c, 'TileSpacing', 'Compact', 'Padding', 'Compact');
        for i=1:args.C1
            nexttile(i + (i-1)*(fig_c-1));
            h_temp = h{1, 1}{i,1};
            K = (length(h_temp) - 1)/2; xK = -K:K;
            stem(xK, h_temp,  colors(3), 'LineWidth', LineWidth, 'MarkerSize', MarkerSize);
            if K ~= 0
                xlim([-K-k_extra, K+k_extra])
            end
            ylim([-0.5 1.5])
            ylim([min(h_temp)-plt_eps_n, max(h_temp)+plt_eps_p])
            title(strcat('$h^{(1)}_{', num2str(i), '1}$'),'Interpreter','latex','FontSize',FontSize);
        end
        
        for i=1:args.C1
            for j=1:args.C2
                nexttile(i+1 + (j-1)*fig_c);
                h_temp = h{1, 2}{j, i};
                K = (length(h_temp) - 1)/2; xK = -K:K;
                stem(xK, h_temp,  colors(2), 'LineWidth', LineWidth, 'MarkerSize', MarkerSize);
                if K ~= 0
                    xlim([-K, K])
                end
                ylim([-0.5 1.5])
                ylim([min(h_temp)-0.1, max(h_temp)+0.1])
                title(strcat('$h^{(',num2str(2),')}_{', num2str(j), num2str(i), '}$'),'Interpreter','latex','FontSize',FontSize);
            end
        end
        
        for i=1:args.C2
            for j=1:args.C3
                nexttile(i+1 + args.C1 + (j-1)*fig_c);
                h_temp = h{1, 3}{j, i};
                K = (length(h_temp) - 1)/2; xK = -K:K;
                stem(xK, h_temp,  colors(1), 'LineWidth', LineWidth, 'MarkerSize', MarkerSize);
                if K ~= 0
                    xlim([-K, K])
                end
                ylim([-0.5 1.5])

                ylim([min(h_temp)-plt_eps_n, max(h_temp)+plt_eps_p])
                title(strcat('$h^{(',num2str(3),')}_{', num2str(j), num2str(i), '}$'),'Interpreter','latex','FontSize',FontSize);
            end
        end

        for j=1:args.C3
            nexttile(j*fig_c);  
%             subplot(fig_r, fig_c, j*fig_c);
            h_temp = h{1, args.L}{1, j};
            K = (length(h_temp) - 1)/2; xK = -K:K;
            stem(xK, h_temp,  colors(3), 'LineWidth', LineWidth, 'MarkerSize', MarkerSize);
            if K ~= 0
                xlim([-K-k_extra, K+k_extra])
            end
            ylim([min(h_temp)-0.1, max(h_temp)+0.1])
            title(strcat('$h^{(', num2str(args.L), ')}_{1', num2str(j), '}$'),'Interpreter','latex','FontSize',FontSize);
        end
        
    end
    
%     savefig(strcat('plots/', model_mc.model_sn, '.fig'))
    
    
end