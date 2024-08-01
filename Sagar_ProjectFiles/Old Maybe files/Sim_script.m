% -------------------------------------------------------------------
clear all
clc
% -------------------------------------------------------------------
importfile('Maxlimit');
importfile('Daily_Load');
importfile('Daily_Loadt');
importfile('Daily_Loads');
importfile('Daily_Loadl');
importfile('Res_Torque');
importfile('Fuel_con_map');
importfile('eta_EM_map');
importfile('Gensetdata1');
importfile('Gensetdata2');
importfile('motor_eff_HTS');
importfile('motor_eff_IND');
importfile('motor_eff_PMSM');
importfile('resT');
bsfc_idle_CE = 31.7e03;
typ = 1;
if typ == 1
    bsfc_idle_GE = 16e03;
    Gensetdata = Gensetdata1;
elseif typ == 2
    bsfc_idle_GE = 4.96e03;
    Gensetdata = Gensetdata2;
end
P_CE_idle = 0;
w_CE_idle = 400;
Trans_In = 24.086;     %kg/m2
DR = 5.213;
rated_pow_M = 2002;

tspan = 4000;
% sort()
tic
%sim('Powertrain_model_HEV_21b.slx')

toc 