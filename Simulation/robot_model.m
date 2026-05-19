M = 0.5;    % cart/chassis mass (kg)
m = 0.2;    % pendulum/body mass (kg)
b = 0.1;    % friction coefficient
l = 0.15;   % length to center of mass (m)
I = 0.006;  % moment of inertia (kg.m^2)
g = 9.81;   % gravity
p = I*(M+m) + M*m*l^2;
A = [0,           1,              0,         0;
     0, -(I+m*l^2)*b/p,  (m^2*g*l^2)/p,    0;
     0,           0,              0,         1;
     0,    -(m*l*b)/p,  m*g*l*(M+m)/p,      0];

% B matrix
B = [         0;
     (I+m*l^2)/p;
              0;
         m*l/p];

% C matrix - outputs: position and angle
C = [1, 0, 0, 0;
     0, 0, 1, 0];

D = [0; 0];

% Create state space system
sys = ss(A, B, C, D);
disp('System created successfully!')

% Check controllability
Co = ctrb(sys);
disp('Rank of controllability matrix:')
disp(rank(Co))
disp('System is controllable? (should be 4):')
disp(rank(Co) == size(A,1))

% Open loop poles
disp('Open loop eigenvalues:')
disp(eig(A))
%% Visualize Open Loop Response (robot falling over)
t = 0:0.01:2;

% Initial condition - slight push (0.1 rad tilt)
x0 = [0; 0; 0.1; 0];

% Simulate open loop (no control)
[y, t_out, x_out] = initial(sys, x0, t);

figure(1)
subplot(2,1,1)
plot(t_out, x_out(:,1), 'b', 'LineWidth', 2)
xlabel('Time (s)')
ylabel('Position x (m)')
title('Cart Position — No Control')
grid on

subplot(2,1,2)
plot(t_out, x_out(:,3), 'r', 'LineWidth', 2)
xlabel('Time (s)')
ylabel('Angle θ (rad)')
title('Pendulum Angle — Robot Falls Over!')
grid on

%% Pole Zero Map
figure(2)
pzmap(sys)
title('Pole-Zero Map — Notice Unstable Pole on Right')
grid on

%% Step Response (just to understand system behavior)
figure(3)
step(sys, 3)
title('Step Response')
grid on
%% 


