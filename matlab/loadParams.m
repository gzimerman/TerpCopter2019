function params = loadParams()

% Environment (env) parameters
%------------------------------------------------
params.env.com_port = 'COM3';
params.env.baud_rate = 57600;
params.env.ros_master_ip = '10.1.10.178'; 
params.env.catkinSrcDir = '/home/wolek/catkin_ws/src';
params.env.terpcopterMatlabMsgs = [params.env.catkinSrcDir '/matlab_gen/msggen'];

% Virtual transmitter (vtx) 
%------------------------------------------------
% mode of operation 
params.vtx.mode = 'sim'; % 'sim' or 'flight' 

% transmitter 
params.vtx.stick_lim = [100; 100; 100; 100];
params.vtx.trim_lim = [29; 29; 29; 29];
params.vtx.trim_val = [0 -0.10345 0.13793 -0.10345];

% simulator
params.vtx.T = 30; % simulation time

% simulator - disturbance: standard deviations / sec. (zero-mean)
params.vtx.xi_dist_stdev = [0 0 0.2]; % xi = [x y z], m, inertial position in NED frame
params.vtx.vb_dist_stdev = [1 1 0]*0.25; % vb = [u v w], m/s, body velocities in IMU frame
params.vtx.eta_dist_stdev = [0 0 0]; % eta = [phi theta psi] = [roll pitch yaw], rad, orientation relative to NED
params.vtx.nu_dist_stdev = [0 0 0]; % nu = [p q r], rad/s, body angular rates in IMU frame

% simulator - initial conditions 
params.vtx.xi0 = [0 0 0]; % xi = [x y z], m, inertial position in NED frame
params.vtx.vb0 = [0 0 0]; % vb = [u v w], m/s, body velocities in IMU frame
params.vtx.eta0 = [0 0 0]; % eta = [phi theta psi] = [roll pitch yaw], rad, orientation relative to NED
params.vtx.nu0 = [0 0 0]; % nu = [p q r], rad/s, body angular rates in IMU frame

% simulator - arena
params.vtx.maxX = 10; % m,  boundary 
params.vtx.minX = -10;
params.vtx.maxY = 10;
params.vtx.minY = -10;
params.vtx.maxZ = 15;
params.vtx.minZ = -0.1;

% simulator - quadcopter dynamic model
params.vtx.Ixx = 4.856E-3; % kg-m^2, inertia
params.vtx.Iyy = 4.856E-3; % kg-m^2
params.vtx.Izz = 8.801E-3; % kg-m^2
params.vtx.g = 9.81; % m/s^2, gravity
params.vtx.m = 0.486; % kg, mass
params.vtx.l = 0.225; % m, length 
params.vtx.kf = 2.980E-6; %nondim
params.vtx.Im = 3.357; % kg-m^2;
params.vtx.Ax = 0.25; %kg/s % drag coefficients
params.vtx.Ay = 0.25; %kg/s
params.vtx.Az = 0.25; %kg/s
params.vtx.b = 1;

% simulator - inner loop control  gains
params.vtx.kp_phi = 1; % roll 
params.vtx.kp_psi = 1; % yaw
params.vtx.kp_theta = 1; % pitch 

% Control (ctrl)
%------------------------------------------------

% altitude control 
params.ctrl.altitudeGains.kp = 1.00000;
params.ctrl.altitudeGains.kd = 2.00000;
params.ctrl.altitudeGains.ki = 0.50000;
params.ctrl.altitudeGains.ffterm = 0.3*9.81; % feed-forward term 


% Estimation (est)
%------------------------------------------------
% low-pass filters
params.est.altitudeLPFitler.timeConstant = 1.00000; % sec, 


% Vision (viz) 
%------------------------------------------------
% params.viz;

% Autonomy (auto)
%------------------------------------------------
params.autonomy = 'empty';



end
