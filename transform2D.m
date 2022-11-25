
function transform2D(A, image)
    clf('reset');
    x=[];
    y=[];
    Tx=[];
    Ty=[];
    %Convert set of points to ordered list of x-coordinates and
    %y-coordinates
    for i=1:length(image) 
        x=[x,image(1,i)];
        y=[y,image(2,i)];
    end
    %Plot original image in red.
    plot(x,y,'r-', 'Linewidth',3)
    hold on
    %Transform image and convert to ordered list of x-coordinates and
    %y-coordinates
    Tv=A*image;
    for i=1:length(image) 
        Tx=[Tx,Tv(1,i)];
        Ty=[Ty,Tv(2,i)];
    end
    %Plot transformed image in blue. 
    plot(Tx,Ty,'b-','Linewidth',3)
    xlabel('x')
    ylabel('y')
    xlim([-2.5 2.5]);
    ylim([-2.5 2.5]);
    axis equal;
    set(gca, 'XAxisLocation', 'origin', 'YAxisLocation', 'origin')
    hold off
 