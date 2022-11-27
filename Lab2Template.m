% Lab Members:
% Aleksei Bingham
% Ryan Borger

% This just closes all previous figures and clears the console.
close all
clc

%Code for pictures. DO NOT CHANGE THIS CODE. 
square=[[0;0],[1;0],[1;1],[0;1],[0;0]];
bug=[[0.0;.22] , [.25;.22] , [.375;.055] , [.50;0.] , [.625;.055],[.75;.22] , ...
    [1.00;.22] , [1.25; .22] , [1.375; .055],[1.50; 0.] , [1.625; .055] , ...
    [1.75; .22] , [2.; .22] , [1.875; .33] , [1.75; .55] , [1.625; .715] , [1.50; .825] , ...
    [1.375; .902], [1.3125; .935] , [1.25; .946] , [1.00;.99] , [.75;.935] , ...
    [.50;.66] , [.375;.66] , [.25;.616] , [.125;.55] , [.0625;.44] , [0.;.22]];
house=[[0;0;0] [1;0;0] [1;0;1]  [1;0;0] [1;1;0] [1;1;1] [1;1;0] [0;1;0] [0;1;1] [0;1;0 ] [0;0;0] [0;0;1]...
    [1;0;1] [1;1;1] [0;1;1] [0;0;1] [1;0;1] [0.5;0.5;1.5] [0.25;0.75;1.25] [0.25;0.75;1.5] [0.2;0.8;1.5]...
    [0.2;0.8;1.2] [0;1;1] [0;0;1] [0.5;0.5;1.5] [1;1;1]];
V0=[0;0;0]; V1=[1;0;0];V2=[1;1;0];V3=[0;1;0];V4=[0;0;1];V5=[1;0;1];V6=[1;1;1];V7=[0;1;1]
cube=[V0, V1, V5, V1, V2, V6, V2, V3, V7, V3, V0, V4, V5, V6, V7, V4];

%You may use the code for this example as a template.
disp('Example: Define and demonstrate a tranformation which rotates points/lines/figures 90 degrees counterclockwise.')
disp(' a. Define the standard matrix of the transformation and demonstrate on a generic vector.')
syms x y
v=[x;y]
%Note, here [0;1] and [-1;0] are the columns of A. 
A=[[0;1],[-1;0]]

%Output is the result of the mapping T: R^2->R^2 which sends v->Av. 
Tv=A*v

disp('b.Demonstrate your transformation by using transform2D(A,square) and transform2D(A,bug) to see the action on these shapes and make sure it is the correct transformation.')
disp(' ')
disp('See figures.')
%Make sure the transform2D.m file is saved in the same folder or your main
%file or this function will not run. For all of the pictures, the original
%image is in red and the transformed image is in blue.
figure(1)
transform2D(A,square) 
figure(2)
transform2D(A,bug)
disp(' ')
disp('c. Determine whether this transformation has an inverse. If so, describe and demonstrate it geometrically.')
disp('If not, explain why not geometrically.')
disp(' ')
disp('Yes, this transformation has an inverse, which would rotate 90 degrees clockwise.');
disp('We see the standard matrix of the inverse transformation below and demonstrate it using transform2Dsquare and transform2Dbug.');
%disp('d. IF the transformation has an inverse, find the standard matrix of the inverse transformation and demonstrate it using transform2D(Ainv,square) and transform2D(Ainv,bug).')
Ainv=A^-1
figure(3)
transform2D(Ainv,square) 
figure(4)
transform2D(Ainv,bug)

%Your code for Part 1 goes here.

% 1. Rotation of 120 degrees clockwise

% Rotation Matrix = [ cos(theta) sin(theta) ]
%                   [-sin(theta) cos(theta) ]
% counterclockwise if θ is positive otherwise clockwise
disp('1.a Define the standard matrix of the transformation and demonstrate on a generic vector.')
rad = deg2rad(-120)
A=[[cos(rad);-sin(rad)],[sin(rad);cos(rad)]]
Tv=A*v

disp('1.b Demonstrate your transformation by using transform2D(A,square) and transform2D(A,bug) to see the action on these shapes and make sure it is the correct transformation.')
disp(' ')
disp('See figures.')
figure(5)
transform2D(A, square)
figure(6)
transform2D(A, bug)

disp(' ')
disp('1.c Determine whether this transformation has an inverse. If so, describe and demonstrate it geometrically.')
disp('If not, explain why not geometrically.')
disp(' ')
disp('Yes, this transformation has an inverse, which would rotate 120 degrees counterclockwise.');
Ainv=A^-1
figure(7)
transform2D(Ainv, square)
figure(8)
transform2D(Ainv, bug)

% 2. Projection onto the line y = 2x
disp('2.a Define the standard matrix of the transformation and demonstrate on a generic vector.')
A=[[1/5;2/5],[2/5;4/5]]
Tv=A*v

disp('2.b Demonstrate your transformation by using transform2D(A,square) and transform2D(A,bug) to see the action on these shapes and make sure it is the correct transformation.')
disp(' ')
disp('See figures.')
figure(9)
transform2D(A, square)
figure(10)
transform2D(A, bug)

disp(' ')
disp('2.c Determine whether this transformation has an inverse. If so, describe and demonstrate it geometrically.')
disp('If not, explain why not geometrically.')
disp(' ')
disp('No, this transformation does not have an inverse as there is no mapping from y = 2x  back to the original shape');
disp('For example, if we map the Bug -> y = 2x, we cannot apply the inverse and expect to get from y = 2x -> Bug')
disp('Furthermore, we will not see our shape map to the line x = y/2')
Ainv=A^-1
figure(11)
transform2D(Ainv, square)
figure(12)
transform2D(Ainv, bug)

% 3. Shear to the right
disp('3.a Define the standard matrix of the transformation and demonstrate on a generic vector.')
A=[[1;0],[1;1]]
Tv=A*v

disp('3.b Demonstrate your transformation by using transform2D(A,square) and transform2D(A,bug) to see the action on these shapes and make sure it is the correct transformation.')
disp(' ')
disp('See figures.')
figure(13)
transform2D(A, square)
figure(14)
transform2D(A, bug)

disp(' ')
disp('3.c Determine whether this transformation has an inverse. If so, describe and demonstrate it geometrically.')
disp('If not, explain why not geometrically.')
disp(' ')
disp('Yes, this transformation does have an inverse and will shear the image to the left');
Ainv=A^-1
figure(15)
transform2D(Ainv, square)
figure(16)
transform2D(Ainv, bug)


% 4. Reflect across the y = x line and then 
%   expand the x-dimension by a factor of 3
disp('4.a Define the standard matrix of the transformation and demonstrate on a generic vector.')
% Reflect across the y = x
disp('The following matrix reflects over y = x')
R=[[0;1],[1;0]]

% Stretch x-dir by factor of 3
disp('The following matrix expands the x-comp by a factor of 3')
S=[[3;0],[0;1]]

disp('The following matrix feflects over y = x and then expands the x-comp by a factor of 3')
A = R*S
Tv=A*v

disp('4.b Demonstrate your transformation by using transform2D(A,square) and transform2D(A,bug) to see the action on these shapes and make sure it is the correct transformation.')
disp(' ')
disp('See figures.')
figure(17)
transform2D(A, square)
figure(18)
transform2D(A, bug)

disp(' ')
disp('4.c Determine whether this transformation has an inverse. If so, describe and demonstrate it geometrically.')
disp('If not, explain why not geometrically.')
disp(' ')
disp('Yes, this transformation does have an inverse and will reflect over the line x = y but rather than stretching by 2x it will shrink by 0.5y');
Ainv=A^-1
figure(19)
transform2D(Ainv, square)
figure(20)
transform2D(Ainv, bug)


%Your code for Part 2 goes here. 

% 5. Reflect across the yz-plane.

% Reflection Matrix = [ -1 0 0 ]
%                     [  0 1 0 ]
%                     [  0 0 1 ]
% 

%Reflect across the yz-plane
disp('5.a Define the standard matrix of the transformation and demonstrate on a generic vector.')
syms z
w=[x;y;z] %So as not to overwrite the 2x2 vector v above.
M=[[-1;0;0], [0;1;0], [0;0;1]]
Sw=M*w

disp('5.b Demonstrate your transformation by using transform3D(M,cube) and transform3D(M,house) to see the action on these shapes and make sure it is the correct transformation.')
disp(' ')
disp('See figures.')
figure(21)
transform3D(M, cube)
figure(22)
transform3D(M, house)

disp(' ')
disp('5.c Determine whether this transformation has an inverse. If so, describe and demonstrate it geometrically.')
disp('If not, explain why not geometrically.')
disp(' ')
disp('Yes, this transformation has an inverse. Graphically it is the same because the inverse is the same as the original matrix.');
Minv=M^-1
figure(23)
transform3D(Minv, cube)
figure(24)
transform3D(Minv, house)

%Double its length (x-direction) and triple its height (z-direction)
disp('6.a Define the standard matrix of the transformation and demonstrate on a generic vector.')
M=[[2;0;0], [0;0;0], [0;0;3]]
Sw=M*w

disp('6.b Demonstrate your transformation by using transform3D(M,cube) and transform3D(M,house) to see the action on these shapes and make sure it is the correct transformation.')
disp(' ')
disp('See figures.')
figure(25)
transform3D(M, cube)
figure(26)
transform3D(M, house)

disp(' ')
disp('6.c Determine whether this transformation has an inverse. If so, describe and demonstrate it geometrically.')
disp('If not, explain why not geometrically.')
disp(' ')
disp('No, this transformation does not have an inverse. Graphically the inverse does not exist because the y axis was not scaled.');
Minv=M^-1
figure(27)
transform3D(Minv, cube)
figure(28)
transform3D(Minv, house)

%Project onto the yz-plane
disp('7.a Define the standard matrix of the transformation and demonstrate on a generic vector.')
M=[[0;0;0], [0;1;0], [0;0;1]]
Sw=M*w

disp('7.b Demonstrate your transformation by using transform3D(M,cube) and transform3D(M,house) to see the action on these shapes and make sure it is the correct transformation.')
disp(' ')
disp('See figures.')
figure(29)
transform3D(M, cube)
figure(30)
transform3D(M, house)

disp(' ')
disp('7.c Determine whether this transformation has an inverse. If so, describe and demonstrate it geometrically.')
disp('If not, explain why not geometrically.')
disp(' ')
disp('No, this transformation does not have an inverse. Graphically the inverse does not exist because the x axis was never projected onto.');
Minv=M^-1
figure(31)
transform3D(Minv, cube)
figure(32)
transform3D(Minv, house)

% 8. Rotation of 45 degrees clockwise around positive z

% Rotation Matrix = [ cos(theta) -sin(theta) 0 ]
%                   [ sin(theta)  cos(theta) 0 ]
%                   [    0           0       1 ]
% counterclockwise if θ is positive otherwise clockwise
%Rotate 45 degrees clockwise around the positive z-axis
disp('8.a Define the standard matrix of the transformation and demonstrate on a generic vector.')
rad1 = deg2rad(45)
M=[[cos(rad1);sin(rad1);0],[-sin(rad1);cos(rad1);0], [0;0;1]]
Sw=M*w

disp('8.b Demonstrate your transformation by using transform3D(M,cube) and transform3D(M,house) to see the action on these shapes and make sure it is the correct transformation.')
disp(' ')
disp('See figures.')
figure(33)
transform3D(M, cube)
figure(34)
transform3D(M, house)

disp(' ')
disp('8.c Determine whether this transformation has an inverse. If so, describe and demonstrate it geometrically.')
disp('If not, explain why not geometrically.')
disp(' ')
disp('Yes, this transformation does have an inverse. Graphically the inverse seems to rotate 45 degrees clockwise');
Minv=M^-1
figure(35)
transform3D(Minv, cube)
figure(36)
transform3D(Minv, house)
