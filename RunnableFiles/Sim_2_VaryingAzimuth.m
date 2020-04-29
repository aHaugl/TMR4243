%Runs task 3.4 followed by task 4.3
clc;
tau_1 = [1; 1; 0.5];
tau_2 = [2; 0; 0];
tau_3 = [0.1; 0.1; 0.1];

%% Task 3.4
[u_star, alpha_star] = fcn(tau_1);
[u_cmd , alpha_cmd ] = beta ( u_star , alpha_star );
disp('Tau_ref is:')
tau_1

disp('U commanded and alpha command for task 3.4, case 1are:')
u_cmd
alpha_cmd

disp('Pausing for 5 seconds before running task 3.4, case 2')
pause(5)
[u_star, alpha_star] = fcn(tau_2);
[u_cmd , alpha_cmd ] = beta ( u_star , alpha_star );
disp('Tau_ref is:')
tau_1

disp('U commanded and alpha command for task 3.4 are:')
u_cmd
alpha_cmd


disp('Pausing for 5 seconds before running task 4.3 with tau_ref as user inputs')
pause(5)

tau_2 = [0;0;0];
prompt = ('Select value 1 for tau_ref');
tau_2(1) = input(prompt)
prompt = ('Select value 2 for tau_ref');
tau_2(2) = input(prompt)
prompt = ('Select value 3 for tau_ref');
tau_2(3) = input(prompt)

[u_cmd, alpha_cmd] = fcn(tau_2);
disp('Tau_ref is:')
tau_2
disp('U commanded and alpha command for task 4.3 part 2 is:')
u_cmd
alpha_cmd

function [ u_cmd , alpha_cmd ] = fcn(tau_ref)

k1 = 1.030; k2 = 1.030; k3 = 2.629;
k = [k1;k1;k2;k2;k3];
K = diag(k);    %Thrust coefficient matrix

Lx = -0.4574; Ly = 0.055; L_BT = 0.3875;  %Thruster cooridinates

B_alpha = [ 1, 0, 1, 0, 0 ;
            0, 1, 0, 1, 1 ;
           -Ly, Lx, Ly, Lx, L_BT];
            
u_star = pinv( B_alpha * K ) * tau_ref ;

u_cmd = zeros(3,1);
alpha_cmd = zeros(2,1);

u_cmd(1) = sqrt(u_star(1)^2 + u_star(2)^2) ;
u_cmd(2) = sqrt(u_star(3)^2 + u_star(4)^2) ;
u_cmd(3) = u_star(5) ;

%%Returns values in [-pi/2, pi/2]
% alpha_cmd(1) = atan(u_star(2)/u_star(1));
% alpha_cmd(2) = atan(u_star(4)/u_star(3));

% Returns angles in  [-pi, pi]
alpha_cmd(1) = atan2(u_star(2),u_star(1));
alpha_cmd(2) = atan2(u_star(4),u_star(3));
end


function [ u_cmd , alpha_cmd ] = beta ( u_star , alpha )

for i=1:2
    if u_star(i) < 0
        u_star(i) = abs(u_star(i));
        alpha(i) = alpha(i) - pi;
        if alpha(i) < -pi
            alpha(i) = alpha(i) + 2*pi ;
        end
    end
%     alpha
%Saturate VSP to give maximum 100% thrust    
    if u_star(i) > 1 
        u_star(i) = 1;
    end
end

%Saturate bow thruster to a maximum of 1 (100% thrust)
if(u_star(3) > 1)
    u_star(3) = 1;
elseif u_star(3) <-1
    u_star(3) = -1;
end

u_cmd = u_star;
alpha_cmd = alpha;

end


