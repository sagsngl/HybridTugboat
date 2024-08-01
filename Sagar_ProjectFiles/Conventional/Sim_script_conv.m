% -------------------------------------------------------------------
clear all
clc
% -------------------------------------------------------------------
importfile('Referred_Data\Maxlimit');
%importfile('Referred_Data\Daily_Load');
%importfile('Referred_Data\Daily_Loadt');
%importfile('Referred_Data\Daily_Loads');
%importfile('Referred_Data\Daily_Loadl');
importfile('Referred_Data\Daily_Load_Con');
importfile('Referred_Data\Daily_Load_Hyb');
importfile('Referred_Data\resT_conv_free');
importfile('Referred_Data\resT_conv_tow');
importfile('Referred_Data\resT_conv_bollard');
importfile('Referred_Data\resT_hybrid_free');
importfile('Referred_Data\resT_hybrid_tow');
importfile('Referred_Data\resT_hybrid_bollard');
importfile('Referred_Data\Fuel_con_map');
importfile('Referred_Data\eta_EM_map');
importfile('Referred_Data\Gensetdata1');
importfile('Referred_Data\Gensetdata2');
importfile('Referred_Data\motor_eff_HTS');
importfile('Referred_Data\motor_eff_IND');
importfile('Referred_Data\motor_eff_PMSM');
tspan = 14400;
switch 1
    case 1
        dailyloadl = Daily_Load_Con;
    case 2
        dailyloadl = Daily_Load_Hyb;
end

switch 3
    case 1      
        drawn_pow_M = 1965.87;
        motor_eff = motor_eff_IND;
        Gensetdata = Gensetdata1;
    case 2
        drawn_pow_M = 1816.65;
        motor_eff = motor_eff_HTS;
        Gensetdata = Gensetdata1;
    case 3
        drawn_pow_M = 464.6018;
        motor_eff = motor_eff_PMSM;
        Gensetdata = Gensetdata2;
end

bsfc_idle_CE = 31.7e03;
bsfc_idle_GE = 4.96e03;

P_CE_idle = 0;
w_CE_idle = 500;
Trans_In = 24.086;     %kg/m2
DR = 5.213;



tic
sim('Powertrain_model_21b.slx')

toc 