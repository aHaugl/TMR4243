% clear;
% clear all;
sim_time = 250;

%Ellips = 0,  straight = 1
% pathparameter = 0;
pathparameter = 1;

LossOfSignalTrue=0;
LossOfSignalFalse=1;
RegainOfSignalTrue=1;
RegainOfSignalFalse=0;
LossOfSignalTime = 10;
RegainOfSignalTime = 30;


M = [ 16    0      0 ;
           0    24   0.53 ; 
           0    0.53 2.8] ; 
     
M_1 = inv(M) ; 

D = [ 0.66  0    0   ; 
           0    1.3 2.8  ; 
           0     0   1.9] ; 

%% Observer gains       
L1 = 10*diag([1 1 1]); 
       
L2 = 20*M*diag([1 1 1]);


L3 = 0.1*L2;
Observergains = [L1, L2, L3];
%% Path planner
U_ref = 0.3;

%Straight line: Path is a straight line from start_pos through end_pos and
%continuing on that line.
start_pos = [0; 0; 0 ];
% end_pos = [20; 0 ; 0]; %North
end_pos = [20; 20 ; 0]; %North-East
% end_pos = [0; 20 ; 0]; %East
% end_pos = [-20; 20 ; 0]; %South-East
% end_pos = [-20; 0 ; 0]; %South
% end_pos = [-20; -20 ; 0]; %South-West
% end_pos = [0; -20 ; 0]; %West
% end_pos = [20; -20 ; 0]; %North-West

%Elliptical
rx = 10;
ry = 20;
Cx = start_pos(1)-rx; %center of elipsoid
Cy = start_pos(2); 

% Radius [radius north, radius east]
Radius = [rx; ry];
Center = [Cx; Cy];

%% DP Controller gains
mu = 0.09;

%Proportional gain on position(eta-eta_d)
    K_p = 0.08*[1.1  0    0;
           0    1.3  0;
           0    0    1.4];
%Derivative gain on velocity(eta-eta_d)
    K_v = 1*[10   0       0;
                 0    10      0;
                 0    0      15];
%Integral gain on velocity(?)
    K_i = 3*[1   0     0;
           0    1      0;
           0    0      2];
       
path_planner_data = [start_pos; end_pos; Radius; Center];
% controller_matrixes = [K_p, K_v, K_i, M, D];
Controller_Data = struct('K_p', K_p, 'K_v', K_v, 'K_i', K_i, 'M', M,...
    'D', D, 'U_ref', U_ref, 'mu', mu);

if not(pathparameter)  %Straight line path:
    disp('Elliptical path:')  
    disp('Ellipsoid radius')
    disp([rx, ry])
    disp('Center of ellipse')
    disp([Cx,Cy]) 


else %Straight line path
    disp('Straight line path:') 
    disp('Starting position') 
    disp(start_pos)
    disp('Ending ending position')
    disp(end_pos)
end

disp('File has been initialized')
   
