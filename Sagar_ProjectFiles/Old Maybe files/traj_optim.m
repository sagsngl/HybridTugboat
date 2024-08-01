clear all
clc

load = 1:4172;
rpm = 1:1600/5;
importfile('Gensetdata');


for i = 1:length(rpm)
    for j = 1:1800
        cost_e1(j) = fuel_con_map(i*5,j);
    end
    cost_e1 = cost_e1.*(1:1800)/3600;
    cost_e2 = cost_e1;
    cost_g =(interp1(Gensetdata.("Power(kW)"),Gensetdata.("Bsfc(g/kWh)"),1:2500));
    cost_g = cost_g.*(1:2500)/3600;
    for j = 1:length(load)
    end
end