%MATLAB Introduction Exercises
%Erin Bela
%October 27, 2022


%% Problem 1 
%Plotting a set of vectors in R^2. 
c=[1 -1]; %Vectors are defined as row vectors. 
d=[-2 3];

%Make sure the code for PlotVectors.m is saved in the same folder as this file or
%this part will not run. 
PlotVectors({c,d}) 
disp('Problem 1:') %Just prints the problem number. 
%Use display or print statements for any written explanations. Any final
%answers to each of the parts should also output when I click run on your
%code. 
fprintf('Figure 1 shows the vectors c and d plotted on the same set of axes in R^2.\n\n')

%% Problem 2
e1=[1 0 0];
e2=[0 1 0];
e3=[0 0 1]; 
%Make sure the code for PlotVectors3.m is saved in the same folder as this file or
%this part will not run. 
figure(2)
PlotVectors3({e1,e2,e3})
disp('Problem 2:')
fprintf('Figure 2 shows the vectors e1,e2, and e3 plotted in the same set of axes in R^3.\n\n')

%% Problem 3
disp('Problem 3: Checking answers from Examples 2 and 3') 
A=[3 0; -1 5] %Normally you wouldn't need to print these out. I am just trying to make it clear which matrices are which.
B=[4 -2 1; 0 2 3]
AB=A*B
%This is just catching the incorrect dimension error so the program can
%continue running. You shouldn't need this type of thing for the lab. 
try
    BA=B*A
catch MExc
    disp('BA is not possible because the number of columns of B (3) is not equal to the number of rows of A (2). ')
    disp('MATLAB throws the following error:')
    disp(MExc.message(1:100))
    disp(MExc.message(102:length(MExc.message)))
end
C=[4 2 1; 0 2 3]
D=[1 2; 3 4; 5 6]
CD=C*D
DC=D*C
M=[0 -3; -2 1]
e2=[0;1]
Me2=M*e2
try
    DCA=D*C*A
catch MExc
    disp('DCA is not possible because the number of columns of B (3) is not equal to the number of rows of A (2). ')
    disp('MATLAB throws the following error:')
    disp(MExc.message(1:100))
    disp(MExc.message(102:length(MExc.message)))
    fprintf('\n')
end

disp('Problem 3: Checking answers for Example 4')
syms x y z %Define your symbolic variables!
disp('We can write the given system as Ax=b, where:')
A=[1 3 -2; 2 -4 1; -3 1 4]
X=[x;y;z] %Need to use a different variable than x for the vector of variables. 
b=[0;3;-5]
disp('To check the answer, have MATLAB compute A*x=b.')
system=A*X==b

disp('Problem 3: Checking answers for Example 5')
A=[0 -1; 1 0] %Note that this does override our previous matrix A!
A3=A^3

%% Problem 4
syms x y
eqn1=3*x-2*y==4;
eqn2=x+5*y==7;
sol=solve(eqn1,eqn2);
X=sol.x;
Y=sol.y;
disp('Problem 4:')
% %d is referring to a decimal variable, %s is a string. This code inserts the variables (in the order they are listed)
% into the text.  \n just means new line. You can just stick to display
% statements if it is easier. 
fprintf('The solution to the system of equations %s and %s is x=%d and y=%d.\n\n',eqn1,eqn2,X,Y) 


%% Problem 5
%Note you do can use plot instead of fimplicit. 
figure(3)
hold on %allows you to plot multiple functions in the same plotting window
f=@(x,y) 3*x-2*y-4;
fimplicit(f,'r','LineWidth',1)
g=@(x,y) x+5*y-7;
fimplicit(g,'b','LineWidth',1)
hold off
disp('Problem 5:')
fprintf('Figure 3 shows a graph of the equations %s and %s. From the graph we can\n',eqn1,eqn2)
fprintf('verify that the two lines intersect at the point (%d,%d).\n\n', X,Y)

%% Problem 6
figure(4)
X=linspace(0, 2*pi);%It is important to differentiate between the symbol x and the plotting range linspace(a,b),
%which is an array of evenly chosen points in the interval [a,b]. 
plot(X,sin(X))
xlabel('x')
ylabel('y')
xlim([0 2*pi])
ylim([-1.5 1.5])
disp('Problem 6:')
fprintf('Figure 4 shows the graph of y=sin(x) from 0 to 2 pi.\n\n') 

%% Problem 7
figure(5)
f=@(x,y,z) 3*x-5*y+2*z-10;
fimplicit3(f)
xlabel('x')
ylabel('y')
xlabel('x')
zlabel('z')
disp('Problem 7:')
fprintf('Figure 5 shows the graph of the plane 3x-5y+2z=10.\n') 