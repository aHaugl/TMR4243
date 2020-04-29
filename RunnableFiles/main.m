clear all; 
% close all; 
clc
addpath('Runnable_files')
Selection = 0;

while Selection < 14
Selection=menu('Choose simulation from 1 to 13 or 14 to exit simulation',...
    '[1] Simulation 1 - Case A - Fixed thrust allocation (task 2.5 and 4.2)',...
    '[2] Simulation 2 - Case A - Varying thruster allocation (task 3.4 and 4.3)',...
    '[3] Simulation 3 - Case B - Observer performance with bias, no signal noise',...
    '[4] Simulation 4 - Case B - Observer performance with bias, noise gain = 0.1, 1 and 10',...
    '[5] Simulation 5 - Case B - Dead reckoning mode with loss of signal for 1, 10 and 30 seconds',...
    '[6] Simulation 6 - Case B - Dead reckoning mode with loss of signal for user defined simtime and loss of signal',...
    '[7] Simulation 7 - Case C - Straight line maneuvering simulation without integral action',...
    '[8] Simulation 8 - Case C - Straight line maneuvering simulation with integral action',...
    '[9] Simulation 9 - Case C - Ellipsoidal maneuvering simulation without integral action',...
    '[10] Simulation 10 - Case C - Ellipsoidal maneuvering simulation with integral action',...
    '[11] Simulation 11 - Additional simulation 1',...
    '[12] Simulation 12 - Additional simulation 2',...
    '[13] Simulation 13 - Additional simulation 3',...
    '[14] exit simulation');

switch Selection
    case 1 % Case A - Fixed thrust allocation'
        clear
        Selection = 1;
        

        disp('Running simulation 1.');
        disp('Running task 2.4');
        Sim_1_FixedAzimuth
        disp('Simulation 1 is complete. Results are in the command window');
        
    case 2 %Case A - Varying thruster allocation'
        clear
        Selection = 2;

        disp('Running simulation 1.');
        disp('Running task 2.4');
        Sim_2_VaryingAzimuth
        disp('Simulation 2 is complete. Results are in the command window');
        
    case 3 %Case B - Observer performance with bias, no signal noise'
        clear
        Selection = 3;
        Sim_3_4_and_5_init
        pause(1)
        disp('Running simulation 3 - Observer performance with bias, no signal noise, with 50 second simulation time');
        sim('Sim_3_observer_performance_no_noise')
        disp('Simulation complete, running plotting functions')
        pause(1)
        Sim_3_plot
        disp('Plotting complete')
        
    case 4 %Case B - Observer performance with bias, varying noise gain = 0.1'
        clear
        Selection = 4;
        disp('The noise is added after the millimeter pose, but before the observer')
        Sim_3_4_and_5_init %It uses the same file, but with an added white noise on measurement

        mu = 0.1;
        disp('Running simulation 4 - Observer performance with bias and varying signal noise, with 50 second simulation time');
        pause(1)
        
        disp('Running simulation with noise gain mu = 0.1')
        sim('Sim_4_observer_performance_varying_noise')
        disp('Simulation complete, running plotting functions')
        pause(1)
        Sim_4_plot1
        pause(1)
        
        mu = 1;
        disp('Running simulation with noise gain mu = 1')
        sim('Sim_4_observer_performance_varying_noise')
        disp('Simulation complete, running plotting functions')
        pause(1)
        Sim_4_plot2
        pause(1)
        
        mu = 10;
        disp('Running simulation with noise gain mu = 10')
        sim('Sim_4_observer_performance_varying_noise')
        disp('Simulation complete, running plotting functions')
        pause(1)
        Sim_4_plot3
        disp('Plotting functions for simulation 4 are complete.');
   
    case 5 %5 - Case B - Dead reckoning mode with Dead signal for 10 and 30 seconds'
        clear
        Selection = 5;
        Sim_3_4_and_5_init
       

        disp('Running simulation 5 - Observer performance with simulated signal loss for 1, 10 and 30 seconds, with 50 second simulation time');
        pause(1)
        LossOfSignalTime = 10;
        RegainOfSignalTime = 11;

        disp('Running simulation with signal loss for 1 seconds')
        sim('Sim_5_dead_signal')
        disp('Simulation complete, running plotting functions')
        pause(1)
        Sim_5_plot1
        disp('Plotting function for simulation 5.1 are complete')
        pause(1)
        
        LossOfSignalTime = 10;
        RegainOfSignalTime = 20;
        disp('Running simulation with signal loss for 10 seconds')
        sim('Sim_5_dead_signal')
        disp('Simulation complete, running plotting functions')
        pause(1)
        Sim_5_plot2
        disp('Plotting function for simulation 5.2 are complete')
        pause(1)
        
        LossOfSignalTime = 10;
        RegainOfSignalTime = 40;
        disp('Running simulation with signal loss for 30 seconds')
        sim('Sim_5_dead_signal')
        disp('Simulation complete, running plotting functions')
        pause(1)
        Sim_5_plot3
        disp('Plotting function for simulation 5.3 are complete')
        pause(1)
        
        
    case 6  %6 - Case B - Dead reckoning mode with user defined inputs'
        clear
        Selection = 6;
        Sim_3_4_and_5_init
        prompt = ('Select simulation time: ');
        sim_time = input(prompt)
        prompt = ('Select time for loss of signal: ');
        LossOfSignalTime = input(prompt)
        prompt = ('Select time for regain of signal: ');
        RegainOfSignalTime = input(prompt)
        
        disp('Running simulation 6 with signal loss and user input')
        sim('Sim_5_dead_signal')
        disp('Simulation complete, running plotting functions')
        pause(1)
        Sim_5_plot4
        disp('Plotting functions for simulation 6 are complete')
        
    case 7 % 7 - Case C - Straight line maneuvering simulation without integral action'
        clear
        Selection = 7;
        Sim_7_init
        disp('Running simulation 7 with straight line path without integral action')
        sim('Sim_7');
        pause(1)
        disp('Simulation complete, running plotting functions')
        Sim_7_plot
        disp('Plotting functions for simulation 7 are complete')
        disp('If you want to run it with longer/shorter simulation time, change "sim_time" in Sim_7_init.m')
        pause(1)
        
        pause(1)
        disp('Either exit program with ctrl + c now, or press any key to continue to input user defined inputs')
        pause()
        clear
        Selection = 7;
        disp('Select starting position for user defined starting position [m]: ')
        start_pos = [0;0;0];
        prompt = ('Select value 1 for start_pos ');
        start_pos(1) = input(prompt)
        prompt = ('Select value 2 for start_pos ');
        start_pos(2) = input(prompt)
        prompt = ('Select value 3 for start_pos ');
        start_pos(3) = input(prompt)
        
        pause(1)
        disp('Select ending position for user defined "ending position" [m]: ')
        disp('Ending position means a point the line should go through.');
        end_pos = [0;0;0];
        prompt = ('Select value 1 for end_pos ');
        end_pos(1) = input(prompt)
        prompt = ('Select value 2 for end_pos ');
        end_pos(2) = input(prompt)
        prompt = ('Select value 3 for end_pos ');
        end_pos(3) = input(prompt)
        
        Sim_7_8_userdef_init
        disp('Running simulation 7 with straight line path with user defined inputs, without integral action')
        sim('Sim_7');
        pause(1)
        disp('Simulation complete, running plotting functions')
        Sim_7_plot
        disp('Plotting functions for simulation 7 with user defined inputs are complete')
        
        
    case 8 %8 - Case C - Straight line maneuvering simulation with integral action'
        clear
        Selection = 8;
        Sim_8_init
        disp('Running simulation 8 with straight line path with integral action')
        sim('Sim_8');
        pause(1)
        disp('Simulation complete, running plotting functions')
        Sim_8_plot
        disp('Plotting functions for simulation 8 are complete')
        disp('If you want to run it with longer/shorter simulation time, change "sim_time" in Sim_8_init.m')
        
        pause(1)
        disp('Either exit program with ctrl + c now, or press any key to continue to input user defined inputs')
        pause()
        clear
        Selection = 8;
        disp('Select starting position for user defined starting position [m]: ')
        start_pos = [0;0;0];
        prompt = ('Select value 1 for start_pos ');
        start_pos(1) = input(prompt)
        prompt = ('Select value 2 for start_pos ');
        start_pos(2) = input(prompt)
        prompt = ('Select value 3 for start_pos ');
        start_pos(3) = input(prompt)
        
        pause(1)
        disp('Select ending position for user defined "ending position" [m]: ')
        disp('Ending position means a point the line should go through.');
        end_pos = [0;0;0];
        prompt = ('Select value 1 for end_pos ');
        end_pos(1) = input(prompt)
        prompt = ('Select value 2 for end_pos ');
        end_pos(2) = input(prompt)
        prompt = ('Select value 3 for end_pos ');
        end_pos(3) = input(prompt)
        
        Sim_7_8_userdef_init %uses same initfile as sim 7
        disp('Running simulation 8 with straight line path with user defined inputs, with integral action')
        sim('Sim_8');
        pause(1)
        disp('Simulation complete, running plotting functions')
        Sim_8_plot
        disp('Plotting functions for simulation 8 with user defined inputs are complete')
        
    case 9 %9 - Case C - Ellipsoidal maneuvering simulation without integral action'
        clear
        Selection = 9;
        Sim_9_init
        disp('Running simulation 9 with ellipsoidal path path without integral action')
        sim('Sim_9');
        pause(1)
        disp('Simulation complete, running plotting functions')
        Sim_9_plot
        disp('Plotting functions for simulation 9 are complete')
        disp('If you want to run it with longer/shorter simulation time, or different start points, change this in sim_9_init.m.') 
        
    case 10 %10 - Case C - Ellipsoidal maneuvering simulation with integral action'
        clear
        Selection = 10;
        Sim_10_init
        disp('Running simulation 10 with ellipsoidal path path with integral action')
        sim('Sim_10');
        pause(1)
        disp('Simulation complete, running plotting functions')
        Sim_10_plot
        disp('Plotting functions for simulation 10 are complete')
        disp('If you want to run it with longer/shorter simulation time, or different start points, change this in sim_10_init.m.') 
        
    case 11 % Simulation 11 - Additional simulation 1'
        clear
        Selection = 11;
        Sim_11_init
        disp('Running simulation 11, extra simulation 1 with integral action')
        sim('Sim_11')
        pause(1)
        disp('Simulation 11 complete, running plotting functions')
        Sim_11_plot
        disp('Plotting functions for simulation 11 are complete')
 
    case 12 %Simulation 12 - Additional simulation 2'
        clear
        Selection = 12;
        Sim_12_init
        disp('Running simulation 12, extra simulation 2 with integral action')
        sim('Sim_12')
        pause(1)
        disp('Simulation 11 complete, running plotting functions')
        Sim_12_plot
        disp('Plotting functions for simulation 12 are complete')

        
    case 13 % Simulation 13 - Additional simulation 3'
        clear
        Selection = 13;
        Sim_13_init
        disp('Running simulation 13, extra simulation 3 with integral action')
        sim('Sim_13')
        pause(1)
        disp('Simulation 13 complete, running plotting functions')
        Sim_13_plot
        disp('Plotting functions for simulation 13 are complete')


    case 14
        Selection = 14;
        disp('Exiting system');
        
end
end
    
