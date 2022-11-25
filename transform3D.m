
function transform3D(A, image)
    clf('reset');
    x=[];
    y=[];
    z=[];
    Tx=[];
    Ty=[];
    Tz=[];
    %Convert set of points to ordered list of x-coordinates and
    %y-coordinates
    for i=1:length(image) 
        x=[x,image(1,i)];
        y=[y,image(2,i)];
        z=[z,image(3,i)];
    end
    %Plot original image in red.
    plot3(x,y,z,'r-', 'Linewidth',3)
    hold on
    %Transform image and convert to ordered list of x-coordinates and
    %y-coordinates
    Tv=A*image;
    for i=1:length(image) 
        Tx=[Tx,Tv(1,i)];
        Ty=[Ty,Tv(2,i)];
        Tz=[Tz,Tv(3,i)];
    end
    %Plot transformed image in blue. 
    plot3(Tx,Ty,Tz,'b-','Linewidth',3)
    xlabel('x')
    ylabel('y')
    zlabel('z')
    xlim([-4 4]);
    ylim([-4 4]);
    zlim([-4 4]);
    axis equal;
    hold off
 