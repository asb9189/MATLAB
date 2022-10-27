
%Plots a given set of row vectors {v1, v2, ..., vk} in R^3 on the same plot.  
%Note: First vector is plotted in red, second vector in green, third in
%blue, fourth in cyan, fifth in magenta, sixth in yellow, seventh in black
%and then it cycles back through (if plotting more than 7 different vectors
%at once). 
%Click on Tools - Rotate3D to view plot from a different angle. 
function PlotVectors3(L) 
    clf('reset')
    colors={'r','g','b','c','m','y'};
    hold on
    xlabel('x') %Adds axes labels
    ylabel('y')
    zlabel('z')
    %xlim([-10 10]) %Can control the size of the plotting window. Don't
    %worry about this - just use the default window. 
    %ylim([-10 10])
    %zlim([-10 10])
    for k = 1:numel(L) % indices]
        u=L{k};
        if mod(k,7)~=0
            quiver3(0,0,0,u(1),u(2),u(3),'linewidth',2,'color',colors{mod(k,7)}, 'AutoScaleFactor',1)
        else
            quiver3(0,0,0,u(1),u(2),u(3),'linewidth',2,'color','k','AutoScaleFactor',1)
        end
    end
    hold off
    view(3)
end
