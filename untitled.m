

u = [1, 0, 3];
v = [-1, 4, 2];
w = [3, 1, -4];

% 1.a
origin = [0,0,0];
figure;hold on;
plot3([origin(1) u(1)],[origin(2) u(2)],[origin(3) u(3)],'r-^', 'LineWidth',3);
plot3([origin(1) v(1)],[origin(2) v(2)],[origin(3) v(3)],'g-^', 'LineWidth',3);
plot3([origin(1) w(1)],[origin(2) w(2)],[origin(3) w(3)],'b-^', 'LineWidth',3);
grid on;
xlabel('X axis'), ylabel('Y axis'), zlabel('Z axis')

%1.b u + v + w
sum = [u(1) + v(1) + w(1), u(2) + v(2) + w(2), u(3) + v(3) +  w(3)];
plot3([0, sum(1)], [0, sum(2)], [0, sum(3)], 'y', 'LineWidth', 3);

%1.c dot product of u v
dp_uv = (u(1) * v(1)) + (u(2) * v(2)) + (u(3) * v(3));
disp("dot product of u, v: " + dp_uv);

%1.d find two different linear combinations of the vectors u, v, and w

% maybe use MATLAB linear systems solver to show c1, c2, and c3 must all be
% zero.
disp("searching for linear combinations");
for x = -1000:1000
    for y = -1000:1000
        for z = -1000:1000
            if (x == 0 && y == 0 && z == 0)
                continue;
            end
            xu = [x * u(1), x * u(2), x * u(3)];
            yv = [y * v(1), y * v(2), y * v(3)];
            zw = [z * w(1), z * w(2), z * w(3)];
            result = [xu(1) + yv(1) + zw(1), xu(2) + yv(2) + zw(2), xu(3) + yv(3) + zw(3)];
            if (result(1) == 0 && result(2) == 0 && result(3) == 0)
                disp("result found");
            end
        end
    end
end

% Vectors u, v, and w are linearly independent hence there is no
%   non-trivial solution.







