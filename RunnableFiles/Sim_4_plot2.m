figure() %Positions
subplot(3,1,1)
plot(eta_real_sim.time,eta_real_sim.data(:,1),'r', 'linewidth', 1); hold on; grid on;
plot(eta_hat.time,eta_hat.data(:,1),'-.b', 'linewidth', 1);
plot(eta_real_sim.time, eta_real_sim.data(:,1)- eta_hat.data(:,1), '-m', 'linewidth', 0.5);
hleg = legend('$N_{real}$','$\hat{N}$','$\tilde{N}$','Location', 'northwest');
set(hleg, 'Interpreter','Latex');
ylabel('N [m]');
title('Position: Observer performance with \mu = 1')

subplot(3,1,2)
plot(eta_real_sim.time,eta_real_sim.data(:,1),'r', 'linewidth', 1); hold on; grid on;
plot(eta_hat.time,eta_hat.data(:,2),'-.b', 'linewidth', 1);
plot(eta_real_sim.time, eta_real_sim.data(:,2)- eta_hat.data(:,2), '-m', 'linewidth', 0.5);
hleg = legend('$E_{real}$','$\hat{E}$','$\tilde{E}$','Location', 'northwest');
set(hleg, 'Interpreter','Latex');
ylabel('E [m]');

subplot(3,1,3)
plot(eta_real_sim.time,eta_real_sim.data(:,3)*180/pi,'r', 'linewidth', 1); hold on; grid on;
plot(eta_hat.time,eta_hat.data(:,3)*180/pi,'-.b', 'linewidth', 1);
plot(eta_real_sim.time, (eta_real_sim.data(:,3)- eta_hat.data(:,3))*180/pi, '-m', 'linewidth', 0.5);
hleg = legend('$\psi_{real}$','$\hat{\psi}$','$\tilde{\psi}$','Location', 'northwest');
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
title('Velocity: Observer performance with mu = 1')

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
plot(bias_hat.time, bias_hat.data(:,1)); hold on; grid on;
plot(bias_hat.time, bias_hat.data(:,2))
plot(bias_hat.time, bias_hat.data(:,3))
hleg = legend('$\hat{b}_1$','$\hat{b}_2$','$\hat{b}_3$','Location', 'northwest');
set(hleg, 'Interpreter','Latex');
ylabel('Bias Estimate')
xlabel('Time (s)')
title('Bias Estimate as a function of time, \mu = 1')


