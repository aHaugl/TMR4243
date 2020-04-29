figure()
subplot(3,1,1)
plot(eta_real_sim.time,eta_real_sim.data(:,1),'--k', 'linewidth', 0.5); hold on; grid on;
plot(eta_measured.time,eta_measured.data(:,1),'r', 'linewidth', 1);
plot(eta_hat.time,eta_hat.data(:,1),'-.b', 'linewidth', 1);
plot(eta_real_sim.time, eta_real_sim.data(:,1)- eta_hat.data(:,1), '-m', 'linewidth', 0.5);

hleg = legend('$N_{real}$','$N_{meas}$','$\hat{N}$','$\tilde{N}$','Location', 'northwest');
set(hleg, 'Interpreter','Latex');
ylabel('N [m]');
title('Positin: Observer performance with loss of signal for 10 second')

subplot(3,1,2)
plot(eta_real_sim.time,eta_real_sim.data(:,2),'--k', 'linewidth', 0.5); hold on; grid on;
plot(eta_measured.time,eta_measured.data(:,2),'r', 'linewidth', 1);
plot(eta_hat.time,eta_hat.data(:,2),'-.b', 'linewidth', 1);
plot(eta_real_sim.time, eta_real_sim.data(:,2)- eta_hat.data(:,2), '-m', 'linewidth', 0.5);
hleg = legend('$E_{real}$','$E_{meas}$','$\hat{E}$','$\tilde{E}$','Location', 'northwest');
set(hleg, 'Interpreter','Latex');
ylabel('E [m]');

subplot(3,1,3)
plot(eta_real_sim.time,eta_real_sim.data(:,3)*180/pi,'--k', 'linewidth', 0.5); hold on; grid on;
plot(eta_measured.time,eta_measured.data(:,3)*180/pi,'r', 'linewidth', 1);
plot(eta_hat.time,eta_hat.data(:,3)*180/pi,'-.b', 'linewidth', 1);
plot(eta_real_sim.time, (eta_real_sim.data(:,3)- eta_hat.data(:,3))*180/pi, '-m', 'linewidth', 0.5);
hleg = legend('$\psi_{real}$','$\psi_{meas}$','$\hat{\psi}$','$\tilde{\psi}$','Location', 'northwest');
set(hleg, 'Interpreter','Latex');
ylabel('\psi [deg]');


figure()%Velocities
subplot(3,1,1)
plot(nu_real.time, nu_real.data(:,1),'r', 'linewidth',0.5); hold on; grid on;
plot(nu_hat.time, nu_hat.data(:,1),'-.b', 'linewidth',1);
plot(nu_real.time, nu_real.data(:,1)-nu_hat.data(:,1),'-m','linewidth',0.5);
hleg = legend('$u_{real}$','$\hat{u}$','$\tilde{u}$','Location', 'northwest');
set(hleg, 'Interpreter','Latex');
ylabel('u [m/s]');
title('Velocity: Observer performance with loss of signals for 10 seconds')

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
title('Measurements are available vs ship in dead reckoning')
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
title('Bias Estimate as a function of time with loss of signals for 10 second')

