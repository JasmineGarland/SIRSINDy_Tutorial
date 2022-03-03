close all; clc; clear;
%% SIR SINDy example with DISCRETE model
%% Section 1: Simulate data and use discrete model x_k+1 instead of dx (i.e. no derivatives needed!)

% Set up simulation parameters and simulate data (x,t)
N = 1; % total population
beta_0 = 2;
beta_1 = 0.3;
phi = 0;
b = @(t) beta_0*(1 + beta_1*cos(2*pi*t - phi)); % beta: seasonal transmission rate
gamma = 1/5; % 1/infectious period
mu = 8*10^-4; % birth/death rate

pars = [gamma mu];
rhsode = @(t,x,pars,b) [-b(t).*x(1).*x(2) + pars(2) - pars(2).*x(1);
    b(t).*x(1).*x(2) - pars(1).*x(2) - pars(2).*x(2);
    pars(1).*x(2) - pars(2).*x(3)];
x0 = [0.1*N; 5*10^-5; N - 0.1*N - 5*10^-5]; % ICs
dt = 0.1;
tspan = 0:dt:1000;
options = odeset('RelTol',1e-10,'AbsTol',1e-10);
[t,x] = ode15s(@(t,x)rhsode(t,x,pars,b),tspan,x0,options);

% Discrete model x_k+1 instead of dx (i.e. no derivatives needed!)
for i=1:(length(t)-1)
    dx(i,:) = x(i+1,:);
end

% Remove last data point so x and dx are the same length
x = x(1:(end-1),:);
t = t(1:(end-1),:);

% Add noise
x(:,1) = x(:,1); %+ randn(length(x),1)*10^-4;
x(:,2) = x(:,2); %+ randn(length(x),1)*10^-4;
dx = dx; %+ randn(length(dx),1)*10^-4;

%% Section 2: Use SINDy on the data simulated in Section 1 with fixed S0 and lambda
n = 2; % need Theta to be invertible
polyorder = 2;
omega = 52; % Time-step (notation from Horrocks)
beta_vec = cos(2*pi*(t - 11/omega));
beta_fun = @(t) cos(2*pi*(t - 11/52));

lambda = 0.0005; %sparsity knob
S0 = 0.2*N;
x0 = [S0; 5*10^-5;];

% Run SINDy: library of functions from poolDataSeasonal includes all polynomials up to and
% including polyorder multipled by beta_fun (seasonal forcing)
Theta = poolDataSeasonal(t,x,n,polyorder, 0, 1, 52, beta_vec);
Xi = sparsifyDynamics(Theta,dx,lambda,n);
[terms,termspars] = poolDataSeasonalLIST({'S','I'},Xi,n,polyorder);

% Extract the solution from SINDy from termspars so that we can plot it
termsparsSINDY = cell2mat(termspars(2:end,2:end));
rhsodeSINDY = @(t,x,termsparsSINDY) [
    termsparsSINDY(1,1)*1 + termsparsSINDY(2,1)*x(1) + termsparsSINDY(3,1)*x(2) + termsparsSINDY(4,1)*x(1)*x(1) + termsparsSINDY(5,1)*x(1)*x(2) + termsparsSINDY(6,1)*x(2)*x(2) + termsparsSINDY(7,1)*beta_fun(t) + termsparsSINDY(8,1)*x(1)*beta_fun(t) + termsparsSINDY(9,1)*x(2)*beta_fun(t) + termsparsSINDY(10,1)*x(1)*x(1)*beta_fun(t) + termsparsSINDY(11,1)*x(1)*x(2)*beta_fun(t) + termsparsSINDY(12,1)*x(2)*x(2)*beta_fun(t);
    termsparsSINDY(1,2)*1 + termsparsSINDY(2,2)*x(1) + termsparsSINDY(3,2)*x(2) + termsparsSINDY(4,2)*x(1)*x(1) + termsparsSINDY(5,2)*x(1)*x(2) + termsparsSINDY(6,2)*x(2)*x(2) + termsparsSINDY(7,2)*beta_fun(t) + termsparsSINDY(8,2)*x(1)*beta_fun(t) + termsparsSINDY(9,2)*x(2)*beta_fun(t) + termsparsSINDY(10,2)*x(1)*x(1)*beta_fun(t) + termsparsSINDY(11,2)*x(1)*x(2)*beta_fun(t) + termsparsSINDY(12,2)*x(2)*x(2)*beta_fun(t);
    ];

tspan = 0:1000;
options = odeset('RelTol',1e-3,'AbsTol',1e-3);
[tSINDY,xSINDY] = ode15s(@(tSINDY,xSINDY)rhsodeSINDY(tSINDY,xSINDY,termsparsSINDY),tspan,x0,options);

% Plot real solution vs SINDy solution
figure
hold on
plot(t,x(:,1), '-g', 'LineWidth',1.7)
plot(t,x(:,2), '-r', 'LineWidth',1.7)
plot(t,x(:,3), '-c', 'LineWidth',1.7)
plot(tSINDY, xSINDY(:,1), ':', 'color', '#057B10', 'LineWidth',2)
plot(tSINDY, xSINDY(:,2), ':', 'color', '#9D2208', 'LineWidth',2)
plot(tSINDY, N - xSINDY(:,1) - xSINDY(:,2), ':', 'color', '#0076a8', 'LineWidth',2)
legend('S', 'I', 'R','S_{SINDy}', 'I_{SINDy}', 'R_{SINDy}', 'Location', 'East')
title(sprintf('Raw Data (solid) vs SINDY Model (dotted); lambda = %f', lambda))
%ylim([0 N])
hold off
