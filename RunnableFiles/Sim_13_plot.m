%  Sim_13_init;
%  sim('Sim_13');

figure()
% subplot(4,1,1)
plot(eta_d.Data(:,2),eta_d.Data(:,1),'--','LineWidth',1);hold on;grid on;
plot(eta_real_sim.Data(:,2),eta_real_sim.Data(:,1),'LineWidth',1);hold on;grid on;
% plot(eta_hat.Data(:,2),eta_hat.Data(:,1),'-.b', 'linewidth', 1);
% plot(eta_tilde.Data(:,2),eta_tilde.data(:,1), '-m', 'linewidth', 0.5);
hleg = legend('$\eta_d$','$\eta$','Location', 'northwest');
set(hleg, 'Interpreter','Latex');
ylabel('North');
xlabel('East');
title('Simulation 13 - Circle + straight line')



%Commanded control input to each thruster
figure()

subplot(2,1,1)

% plot(eta_d.Data(:,2),eta_d.Data(:,1),'--','LineWidth',1);hold on;grid on;
plot(actualThrust.Time,actualThrust.Data(:,1));hold on;grid on;
plot(actualThrust.Time,actualThrust.Data(:,2));hold on;grid on;
plot(actualThrust.Time,actualThrust.Data(:,3));hold on;grid on;
hleg = legend('$u_{VSP1}$','$u_{VSP2}$','$u_{BT}$');
set(hleg, 'Interpreter','Latex');
ylabel('Commanded control input');
xlabel('Time[s]');
title('Commanded control input to each thruster')
subplot(2,1,2)
plot(actualThrust.Time,actualThrust.Data(:,4)*180/pi);hold on;grid on;
plot(actualThrust.Time,actualThrust.Data(:,5)*180/pi);hold on;grid on;
% plot(eta_hat.Data(:,2),eta_hat.Data(:,1),'-.b', 'linewidth', 1);
% plot(eta_tilde.Data(:,2),eta_tilde.data(:,1), '-m', 'linewidth', 0.5);
hleg = legend('$\alpha_{VSP1}$','$\alpha_{VSP2}$');
set(hleg, 'Interpreter','Latex');
ylabel('VSP angles[deg]');
xlabel('Time[s]');



%Tau_ref as a function of time
figure()
% subplot(4,1,1)
% plot(eta_d.Data(:,2),eta_d.Data(:,1),'--','LineWidth',1);hold on;grid on;
plot(tau_ref.Time,tau_ref.Data(:,1));hold on;grid on;
plot(tau_ref.Time,tau_ref.Data(:,2));hold on;grid on;
plot(tau_ref.Time,tau_ref.Data(:,3));hold on;grid on;
% plot(eta_hat.Data(:,2),eta_hat.Data(:,1),'-.b', 'linewidth', 1);
% plot(eta_tilde.Data(:,2),eta_tilde.data(:,1), '-m', 'linewidth', 0.5);
hleg = legend('$X$','$Y$','$Z$');
set(hleg, 'Interpreter','Latex');
ylabel('Forces and Moments');
xlabel('Time[s]');
title('Reference forces from controller ')

figure()%Velocities
subplot(3,1,1)
plot(nu_real.time, nu_real.data(:,1),'r', 'linewidth',0.5); hold on; grid on;
plot(nu_hat.time, nu_hat.data(:,1),'-.b', 'linewidth',1);
plot(nu_real.time, nu_real.data(:,1)-nu_hat.data(:,1),'-m','linewidth',0.5);
hleg = legend('$u_{real}$','$\hat{u}$','$\tilde{u}$','Location', 'northwest');
set(hleg, 'Interpreter','Latex');
ylabel('u [m/s]');
title('Sim - 11 Velocities')

subplot(3,1,2)
plot(nu_real.time, nu_real.data(:,2),'r', 'linewidth',0.5); hold on; grid on;
plot(nu_hat.time, nu_hat.data(:,2),'-.b', 'linewidth',1);
plot(nu_real.time, nu_real.data(:,2)-nu_hat.data(:,2),'-m','linewidth',0.5);
hleg = legend('$v_{real}$','$\hat{v}$','$\tilde{v}$','Location', 'northwest');
set(hleg, 'Interpreter','Latex');
ylabel('v [m/s]');

subplot(3,1,3)
plot(nu_real.time, nu_real.data(:,3),'r', 'linewidth',0.5); hold on; grid on;
plot(nu_hat.time, nu_hat.data(:,3),'-.b', 'linewidth',1);
plot(nu_real.time, nu_real.data(:,3)-nu_hat.data(:,3),'-m','linewidth',0.5);
hleg = legend('$r_{real}$','$\hat{r}$','$\tilde{r}$','Location', 'northwest');
set(hleg, 'Interpreter','Latex');
ylabel('r [rad/s]');

figure()
subplot(2,1,1)
plot(SignalAvailable.time, SignalAvailable.data,'b', 'linewidth',2); grid on
title('Sim 13 - Measurements are available vs ship in dead reckoning')
ylabel('Yes/No')
xlabel('Time(s)')

subplot(2,1,2)
plot(Dead_reckoning.time, Dead_reckoning.data,'r','linewidth',2); grid on;

hleg = legend('Dead reckoning mode:','Location', 'northwest');
set(hleg, 'Interpreter','Latex');
ylabel('On/Off');
xlabel('Time (s)')

figure()
plot(bias_hat.time, bias_hat.data(:,1)); hold on; grid on;
plot(bias_hat.time, bias_hat.data(:,2))
plot(bias_hat.time, bias_hat.data(:,3))
hleg = legend('$\hat{b}_1$','$\hat{b}_2$','$\hat{b}_3$','Location', 'northwest');
set(hleg, 'Interpreter','Latex');
ylabel('Bias Estimate')
xlabel('Time (s)')
title('Sim 13 - Bias Estimate as a function of time with user defined inputs')


%Eta, velocities, bias and DR - Not all necessary for report
figure()
subplot(3,1,1)
plot(eta_real_sim.time,eta_real_sim.data(:,1),'--k', 'linewidth', 0.5); hold on; grid on;
plot(eta_d.Time(:),eta_d.Data(:,1),'--','LineWidth',1);hold on;grid on;
% plot(eta_measured.time,eta_measured.data(:,1),'r', 'linewidth', 1);
% plot(eta_hat.time,eta_hat.data(:,1),'-.b', 'linewidth', 1);
% plot(eta_real_sim.time, eta_real_sim.data(:,1)- eta_hat.data(:,1), '-m', 'linewidth', 0.5);
hleg = legend('$N_{real}$','$N_{d}$');
set(hleg, 'Interpreter','Latex');
ylabel('N [m]');
title('Sim 13 - NED positions \eta')

subplot(3,1,2)
plot(eta_real_sim.time,eta_real_sim.data(:,2),'--k', 'linewidth', 0.5); hold on; grid on;
plot(eta_d.Time(:),eta_d.Data(:,2),'--','LineWidth',1);hold on;grid on;
% plot(eta_measured.time,eta_measured.data(:,2),'r', 'linewidth', 1);
% plot(eta_hat.time,eta_hat.data(:,2),'-.b', 'linewidth', 1);
% plot(eta_real_sim.time, eta_real_sim.data(:,2)- eta_hat.data(:,2), '-m', 'linewidth', 0.5);
hleg = legend('$E_{real}$','$E_{d}$');
set(hleg, 'Interpreter','Latex');
ylabel('E [m]');

subplot(3,1,3)
plot(eta_real_sim.time,eta_real_sim.data(:,3)*180/pi,'--k', 'linewidth', 0.5); hold on; grid on;
plot(eta_d.Time(:),eta_d.Data(:,3)*180/pi,'--','LineWidth',1);hold on;grid on;
% plot(eta_measured.time,eta_measured.data(:,3)*180/pi,'r', 'linewidth', 1);
% plot(eta_hat.time,eta_hat.data(:,3)*180/pi,'-.b', 'linewidth', 1);
% plot(eta_real_sim.time, (eta_real_sim.data(:,3)- eta_hat.data(:,3))*180/pi, '-m', 'linewidth', 0.5);
hleg = legend('$\psi_{real}$','$\psi_{d}$');
set(hleg, 'Interpreter','Latex');
ylabel('\psi [deg]');
