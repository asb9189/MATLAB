
%Plots a given set of row vectors {v1, v2, ..., vk} in R^2 on the same plot.  
%Note: First vector is plotted in red, second vector in green, third in
%blue, fourth in cyan, fifth in magenta, sixth in yellow, seventh in black
%and then it cycles back through (if plotting more than 7 different vectors
%at once). 

function PlotVectors(L) 
    clf('reset')
    colors={'r','g','b','c','m','y'};
    hold on
    ax = gca;
    ax.XAxisLocation = 'origin';
    ax.YAxisLocation = 'origin';
    xlabel('x') %Adds axes labels
    ylabel('y')
    %xlim([-5 5]) %Can control the size of the plotting window. Don't
    %worry about this - just use the default window. 
   % ylim([-5 5])
    for k = 1:numel(L) % indices]
        u=L{k};
        if mod(k,7)~=0
            quiver(0,0,u(1),u(2),'linewidth',2,'color',colors{mod(k,7)}, 'AutoScaleFactor',1)
        else
            quiver(0,0,u(1),u(2),'linewidth',2,'color','k', 'AutoScaleFactor',1)
        end
    end
    hold off
end
