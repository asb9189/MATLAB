% PART ONE
close all
clc

% 1.a Define and plot vectors u, v, and w
u = [1, 0, 3];
v = [-1, 4, 2];
w = [3, 1, -4];
origin = [0,0,0];

% degree symbol
deg = char(176);

figure;hold on;
title("Plot of u, v, and w");
plot3([origin(1) u(1)],[origin(2) u(2)],[origin(3) u(3)],'r-^', 'LineWidth',3);
plot3([origin(1) v(1)],[origin(2) v(2)],[origin(3) v(3)],'g-^', 'LineWidth',3);
plot3([origin(1) w(1)],[origin(2) w(2)],[origin(3) w(3)],'b-^', 'LineWidth',3);
grid on;
legend("u", "v", "w");
xlabel('X axis'), ylabel('Y axis'), zlabel('Z axis');

%1.b Calculate u + v + w
fprintf('Problem 1b: \n\n');
clear fprintf
disp("Sum of vectors:");
disp(u + v + w);

%1.c Calculate the dot product of u v
fprintf('Problem 1c: \n\n');
clear fprintf
disp("dot product of u, v: \n" + dot(u, v));

%1.d Find two different linear combinations of the vectors u, v, and w
fprintf('Problem 1d: \n\n');
clear fprintf
c1 = 2; c2 = 3; c3 = 4;
linear_combination_1 = (c1 * u) + (c2 * v) + (c3 * w);
disp("Linear Combination 1 with constants c1 = 2, c2 = 3, and c3 = 4");
disp(linear_combination_1);

c1 = 5; c2 = 6; c3 = 7;
linear_combination_2 = (c1 * u) + (c2 * v) + (c3 * w);
disp("Linear Combination 1 with constants c1 = 5, c2 = 6, and c3 = 7");
disp(linear_combination_2);

%1.e Determine which pair of vectors has the smallest distance btwn them
dist_u_to_v = norm(u - v);
dist_u_to_w = norm(u - w);
dist_v_to_w = norm(v - w);
fprintf('Problem 1e: \n\n');
clear fprintf
if dist_u_to_v <= min(dist_u_to_w, dist_v_to_w)
    disp("u, v have the smallest distance between them: " + dist_u_to_v);
elseif dist_u_to_w <= min(dist_u_to_v, dist_v_to_w)
    disp("u, w have the smallest distance between them: " + dist_u_to_w);
else 
    disp("v, w have the smallest distance between them: " + dist_v_to_w);
end

%1.f Determine which pair of vectors has the smallest angle btwn them
ang_u_v = rad2deg(acos((dot(u, v))/(norm(u)*norm(v))));
ang_u_w = rad2deg(acos((dot(u, w))/(norm(u)*norm(w))));
ang_v_w = rad2deg(acos((dot(v, w))/(norm(v)*norm(w))));
fprintf('Problem 1f: \n\n');
clear fprintf
if ang_u_v <= min(ang_u_w, ang_v_w)
    disp("u, v have the smallest angle between them: " + ang_u_v + deg);
elseif ang_u_w <= min(ang_u_v, ang_v_w)
    disp("u, w have the smallest angle between them: " + ang_u_w + deg);
else 
    disp("v, w have the smallest angle between them: " + ang_v_w + deg);
end

%1.g Find the projection of u onto v. Plot the vectors u and v and 
% the projection. Does your computed projection make sense geometrically? 
% Explain.

proj_u_v = (dot(u, v)/dot(v, v)) * v;
disp(proj_u_v);

figure;hold on;
title("Plot of u, v, and the projection of u onto v");
plot3([origin(1) u(1)],[origin(2) u(2)],[origin(3) u(3)],'r-^', 'LineWidth',3);
plot3([origin(1) v(1)],[origin(2) v(2)],[origin(3) v(3)],'g-^', 'LineWidth',3);
plot3([origin(1) proj_u_v(1)],[origin(2) proj_u_v(2)],[origin(3) proj_u_v(3)],'b-^', 'LineWidth',3);
grid on;
legend("u", "v", "proj u onto v");
xlabel('X axis'), ylabel('Y axis'), zlabel('Z axis');
fprintf('Problem 1g: \n\n');
clear fprintf
answer = "Yes, our answer makes sense geometrically as we would expect" + newline + ...
     "proj u onto v to be parrallel with v and with a smaller magnitude." + newline + ...
     "We expect to see projection u onto v appear where a line could be drawn" + newline + ...
     "from u to v creating a 90 degree angle and this appears to be the case" + newline + ...
     "when looking at the plot.";

disp(answer);
disp(newline);

% PART TWO

%2.a
syms x y
e1 = x - y == 3;
e2 = 4*y == 1;
e3 = (3*x) + (2*y) == -4;
sol = solve(e1, e2, e3);

% sol.x and sol.y have no value, hence no solution
fprintf('Problem 2a: \n\n');
clear fprintf
answer = "No, you cannot write w as a linear combination of u, v" + newline + ...
    "as the `solve` command yields no solution for the system";
disp(answer);

%2.b
fprintf('Problem 2b: \n\n');
clear fprintf
answer = "Yes the vectors u, v, and w are linearly independent, because there is a unique" + newline + ...
    "solution when solving the system of equations that results in zero, meaning each scalar is zero.";
disp(answer);

%2.c
clear fprintf
syms x y z
e1 = x - y + (3*z) == 0;
e2 = (4*y) + z == 0;
e3 = (3*x) + (2*y) - (4*z) == 0;
figure;
f=@(x,y,z) x - y + (3*z) == 0;
fimplicit3(f);
f1=@(x,y,z) (4*y) + z == 0;
fimplicit3(f1);
f2=@(x,y,z) (3*x) + (2*y) - (4*z) == 0;
fimplicit3(f2);
sol1 = solve(e1, e2, e3);
X0=sol1.x;
Y0=sol1.y;
Z0=sol1.z;
fprintf('Problem 2c: \n\n');
clear fprintf
fprintf('The solution to the system of equations %s, %s, and %s is x=%d, y=%d, and z=%d \n\n',e1,e2,e3,X,Y,Z); 
fprintf('The geometry is consistent with a linearly independence because the only intersection of the');
fprintf(' equations e1, e2, and e3 are at the origin, 0 \n\n');
clear fprintf

%2.d
fprintf('Problem 2d: \n\n');
clear fprintf
A = [1 0 3; -1 4 2; 3 1 -4]
fprintf('The rank of matrix A...')
rank(A)
answer = 'Yes the vectors [1 0 3], [-1 4 2], [3 1 -4] span R3 because the rank of the matrix is 3';
disp(answer);

%2.e
fprintf('Problem 2e: \n\n');
clear fprintf
answer = "Yes I think the answer in d makes sense based off of the original plot of the vectors" + newline + ...
    "because none of the vectors are parallel.";
disp(answer);

% PART THREE

%3.a
fprintf('Problem 3a: \n\n');
clear fprintf
B1 = [3 -2; -1 5; 1 4];
B2 = [5 7 11]';
Aaug = [B1 B2]
fprintf('Row reducing the augmented matrix..')
C = rref(Aaug)

answer = "Yes, you can write w as a linear combination of u, v" + newline + ...
    "as the rref of the augmented matrix returns a unique solution for the" + newline + ...
    "scalars a=3, and b=2, which will give you the vector w";
disp(answer);

%3.b
fprintf('Problem 3b: \n\n');
clear fprintf
D = [3 -2 5; -1 5 7; 1 4 11];
D2 = [0 0 0]';
Aaug2 = [D D2]
rref(Aaug2)
answer = "No, these three vectors are not linearly independent. The RREF results" + newline + ...
    "in an infinite solution where 0=0 as displayed in row 3";
disp(answer);

%3.c
figure;
f3=@(x,y,z) 3*x - 2*y + 5*z == 0;
fimplicit3(f3)
f4=@(x,y,z) -1*x + 5*y + 7*z == 0;
fimplicit3(f4)
f5=@(x,y,z) 1*x + 4*y + 11*z == 0;
fimplicit3(f5)

%3.d
fprintf('Problem 3d: \n\n');
clear fprintf
E = [3 -2 5; -1 5 7; 1 4 11]
fprintf('The rank of the matrix is...');
rank(E)

answer = "No, these vectors do not span R3 because the rank of the matrix is 2" + newline + ...
    "and in order to span all of R3, the rank must be 3";
disp(answer);
clear fprintf

%3.e
u1 = [3, -1, 1];
v1 = [-2, 5, 4];
w1 = [5, 7, 11];
figure;hold on;
title("Plot of u1, v1, and w1");
plot3([origin(1) u1(1)],[origin(2) u1(2)],[origin(3) u1(3)],'r-^', 'LineWidth',3);
plot3([origin(1) v1(1)],[origin(2) v1(2)],[origin(3) v1(3)],'g-^', 'LineWidth',3);
plot3([origin(1) w1(1)],[origin(2) w1(2)],[origin(3) w1(3)],'b-^', 'LineWidth',3);
grid on;
legend("u1", "v1", "w1");
xlabel('X axis'), ylabel('Y axis'), zlabel('Z axis');
fprintf('Problem 3e: \n\n');
clear fprintf
answer = "No I do not think the answer to do makes sense visually because I would expect" + newline + ...
    "to see two vectors on the same line, or a scalar of one another on the graph.";
disp(answer);

%4
%Part Four
fprintf('Problem 4: \n\n');
answer = "Yes I see connections between linear combination, independence and span." + newline + ...
    "The first relation is that linearly indepndent vectors always fill the span. This is because" + newline + ...
    "their reduced rref always returns an identity matrix. An identity matrixs rank is always equal" + newline + ...
    "to the number of rows, which means it will always fill the span. The opposite can be said about" + newline + ...
    "linearly dependent vectors. Their rank will always be less than the number or rows because the" + newline + ...
    "last row usually reduces to all zeros. Also the connection between linear combination and LI vs LD" + newline + ...
    "is that linearly independent vectors cannot be written as a linear combination. However" + newline + ...
    "linearly dependent vectors can be written as a linear combination.";
disp(answer)


