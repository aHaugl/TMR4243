%Runs task 2.5 followed by task 4.2
clc;
alpha_1 = [pi/2; pi/2];
alpha_2 = [pi; pi];
alpha_3 = [0; 0];
tau_1 = [1; 1; 0.5];
tau_2 = [2; 0; 0];
tau_3 = [1; 1; 0.5];

%% Task 2.5
[u_star, alpha_star] = fcn(tau_1, alpha_1);
[u_cmd , alpha_cmd ] = beta( u_star , alpha_star);
disp('alpha and tau_ref are:')
alpha_1
tau_1
disp('U commanded and alpha command for for task 2.5 part 1 are:')
u_cmd
alpha_cmd

disp('Pausing for 5 seconds before running with the other set of values')
pause(5)

[u_star, alpha_star] = fcn(tau_2, alpha_2);
[u_cmd , alpha_cmd ] = beta( u_star , alpha_star);
disp('alpha and tau_ref are:')
alpha_2
tau_2
disp('U commanded and alpha command for task 2.5 part 2 are:')
u_cmd
alpha_cmd

disp('Pausing for 5 seconds before running with the alpha from task 4.2')
pause(5)

[u_star, alpha_star] = fcn(tau_3, alpha_3);
[u_cmd , alpha_cmd ] = beta( u_star , alpha_star);
disp('alpha and tau_ref are:')
alpha_3
tau_3
disp('U commanded and alpha command for task 4.2 are:')
u_cmd
alpha_cmd

%% Functions
function [u_cmd , alpha_cmd ] = fcn(tau_ref , alpha)

k1 = 1.030; k2 = 1.030; k3 = 2.629;
k = [k1;k2;k3];
K = diag(k);    %Thrust coefficient matrix

Lx = -0.4574; Ly = 0.055; L_BT = 0.3875;  %Thruster cooridinates

B_alpha = [cos(alpha(1))                             , cos(alpha(2))                           ,   0 ; 
           sin(alpha(1))                             , sin(alpha(2))                           ,   1 ;
           - Ly * cos(alpha(1)) + Lx * sin(alpha(1)) , Ly * cos(alpha(2)) + Lx * sin(alpha(2)) , L_BT ];

u_cmd = pinv(B_alpha*K) * tau_ref;
alpha_cmd = alpha;

end


function [ u_cmd , alpha_cmd ] = beta ( u_star , alpha )

for i=1:2
    if u_star(i) < 0
        u_star(i) = abs(u_star(i));
        alpha(i) = alpha(i) - pi;
        if alpha(i) <= -pi
            alpha(i) = alpha(i) + 2*pi ;
        end
    end
    
    if u_star(i) > 1 
        u_star(i) = 1;
    end
end

u_cmd = u_star;
alpha_cmd = alpha;

end


