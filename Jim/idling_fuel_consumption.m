% type = [0, 1];
% for type = type
%     if type == 0
%         rpm = 500;
%     else
%         rpm = 1800;
%     end
%
%     load('Fuel_con_map.mat')
%     P = table2array(Fuel_con_map(:,1));
%     power = linspace(min(P), max(P), 1000);
%
%     for i = 1:1000
%         pow = power(i);
%         x = (rpm-1180)/409.7;
%         y = (pow-876.1)/438.6;
%         p00 =         203;
%         p10 =      0.9394;
%         p01 =      -8.327;
%         p20 =       1.894;
%         p11 =     -0.7168;
%         p02 =       1.321;
%         p30 =      0.2621;
%         p21 =       1.482;
%         p12 =       5.529;
%         p03 =      -2.619;
%         p40 =      0.9252;
%         p31 =      -3.236;
%         p22 =       3.413;
%         p13 =      -2.546;
%         p04 =        2.97;
%         p50 =     -0.1717;
%         p41 =       1.492;
%         p32 =      -2.908;
%         p23 =      0.2029;
%         p14 =      0.4508;
%         p05 =     -0.7973;
%         fuel(i) = p00 + p10*x + p01*y + p20*x^2 + p11*x*y + p02*y^2 + p30*x^3 + p21*x^2*y ...
%             + p12*x*y^2 + p03*y^3 + p40*x^4 + p31*x^3*y + p22*x^2*y^2 ...
%             + p13*x*y^3 + p04*y^4 + p50*x^5 + p41*x^4*y + p32*x^3*y^2 ...
%             + p23*x^2*y^3 + p14*x*y^4 + p05*y^5;
%
%     end
%
%     fuel = fuel /1000; % g/kwh to kg/kwh
%     num = 1000;
%     power_fit = power(1:num);
%     fuel_fit = fuel(1:num);
%     FC = fuel .* power; % kg/hour
%
%     if type == 0
%         figure(1)
%         p1 =   0.0001593;
%         p2 =     0.03515;
%         p3 =       31.78;
%         y_ce = p1*power.^2 + p2*power + p3;
%         plot(power, FC)
%         hold on
%         a1 = plot(power, y_ce)
%         grid on
%         legend('Fuel Consumption (kg/hr) v.s. Power (kW)', 'Curve Fitting')
%         axis([0 1800 0 700])
%         xlabel('Power (kW)')
%         ylabel('Fuel Consumption (kg/hr)')
%         title('Conventional Engine Fuel Consumption v.s. Power @ 500RPM')
%     else
%         figure(2)
%         p1 =   2.184e-06;
%         p2 =      0.1941;
%         p3 =       16.26;
%         y_ge = p1*power.^2 + p2*power + p3;
%         plot(power, FC)
%         hold on
%         plot(power, y_ge)
%         grid on
%         legend('Fuel Consumption (kg/hr) v.s. Power (kW)', 'Curve Fitting')
%         axis([0 1800 0 400])
%         xlabel('Power (kW)')
%         ylabel('Fuel Consumption (kg/hr)')
%         title('Diesel Generatorset Fuel Consumption v.s. Power @ 1,800RPM')
%     end
% end
type = [0, 1];
power = linspace(20, 1800, 2000);

for type = 0
    if type == 0
        rpm = 500;
        for i = 1:2000
            x = rpm;
            y = power(i);
            p00 =         719;
            p10 =      -2.922;
            p01 =       2.561;
            p20 =    0.006505;
            p11 =    -0.01099;
            p02 =    0.003889;
            p30 =  -6.675e-06;
            p21 =   1.497e-05;
            p12 =  -7.529e-06;
            p03 =  -1.374e-07;
            p40 =   3.239e-09;
            p31 =  -8.633e-09;
            p22 =   5.463e-09;
            p13 =  -4.116e-10;
            p04 =   1.984e-10;
            p50 =  -5.933e-13;
            p41 =   1.752e-12;
            p32 =  -1.202e-12;
            p23 =   2.146e-14;
            p14 =   6.648e-14;
            p05 =  -4.927e-14;
            bsf(i) = p00 + p10*x + p01*y + p20*x^2 + p11*x*y + p02*y^2 + p30*x^3 + p21*x^2*y ...
                + p12*x*y^2 + p03*y^3 + p40*x^4 + p31*x^3*y + p22*x^2*y^2 ...
                + p13*x*y^3 + p04*y^4 + p50*x^5 + p41*x^4*y + p32*x^3*y^2 ...
                + p23*x^2*y^3 + p14*x*y^4 + p05*y^5;
        end
        fuel = bsf.*power /1000; % g/h to kg/h

    else % Generator set
        Gensetdata = ...
            [0	278
            54.8000000000000	233
            109.500000000000	206
            273.800000000000	199
            547.500000000000	192
            821.300000000000	191
            930.800000000000	194
            1095	194];
            bsf = interp1(Gensetdata(:,1), Gensetdata(:,2), power);
            fuel = bsf .* power / 1000;
    end
    num = 1000;
    power_fit = power(1:num);
    fuel_ce_fit = fuel(1:num);
    fuel_ge_fit = fuel(1:num);
    FC = fuel; % kg/hour
    
    if type == 0
        figure(1)
        p1 =   0.0001593;
        p2 =     0.03515;
        p3 =       31.78;
        y_ce = p1*power.^2 + p2*power + p3;
        plot(power, FC)
        hold on
        plot(power, y_ce)
        grid on
        legend('Fuel Consumption (kg/hr) v.s. Power (kW)', 'Curve Fitting')
        axis([0 1800 0 700])
        xlabel('Power (kW)')
        ylabel('Fuel Consumption (kg/hr)')
        title('Conventional Engine Fuel Consumption v.s. Power @ 500RPM')
    else
        figure(2)
        p1 =   2.184e-06;
        p2 =      0.1941;
        p3 =       16.26;
        y_ge = p1*power.^2 + p2*power + p3;
        plot(power, FC)
        hold on
        plot(power, y_ge)
        grid on
        legend('Fuel Consumption (kg/hr) v.s. Power (kW)', 'Curve Fitting')
        axis([0 1800 0 400])
        xlabel('Power (kW)')
        ylabel('Fuel Consumption (kg/hr)')
        title('Diesel Generatorset Fuel Consumption v.s. Power @ 1,800RPM')
    end
end