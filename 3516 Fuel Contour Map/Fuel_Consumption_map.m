%% Initial Table Setup
A = readtable("Fuel Contour Map/195.csv");
B = readtable("Fuel Contour Map/198.csv");
C = readtable("Fuel Contour Map/200.csv");
D = readtable("Fuel Contour Map/203.csv");
E = readtable("Fuel Contour Map/205.csv");
F = readtable("Fuel Contour Map/208.csv");
G = readtable("Fuel Contour Map/210.csv");
H = readtable("Fuel Contour Map/215.csv");
I = readtable("Fuel Contour Map/230.csv");
J = readtable("Fuel Contour Map/Max Limit.csv");

A = table2array(A);
B = table2array(B);
C = table2array(C);
D = table2array(D);
E = table2array(E);
F = table2array(F);
G = table2array(G);
H = table2array(H);
I = table2array(I);
J = table2array(J);

A(:, 3) = 195;
B(:, 3) = 198;
C(:, 3) = 200;
D(:, 3) = 203;
E(:, 3) = 205;
F(:, 3) = 208;
G(:, 3) = 210;
H(:, 3) = 215;
I(:, 3) = 230;

lines = [A; B; C; D; E; F; G; H; I];

x = lines(:, 1);
y = lines(:, 2);
z = lines(:, 3);

engine_Power = [0:1:2000];
rpm = [700:1:1800];

%% Hybrid & Conventional Lines
shift = readtable("Fuel Contour Map/Shifted_Limit.csv");
shift = table2array(shift);
conv_free = readtable("Fuel Contour Map/Conv Bollard.csv");
conv_free = table2array(conv_free);
conv_tow = readtable("Fuel Contour Map/Conv Tow.csv");
conv_tow = table2array(conv_tow);
conv_boll = readtable("Fuel Contour Map/Conv Bollard.csv");
conv_boll = table2array(conv_boll);
hybrid_free = readtable("Fuel Contour Map/Hybrid Free.csv");
hybrid_free = table2array(hybrid_free);
hybrid_tow = readtable("Fuel Contour Map/Hybrid Tow.csv");
hybrid_tow = table2array(hybrid_tow);
hybrid_bollard = readtable("Fuel Contour Map/Hybrid Bollard");
hybrid_bollard = table2array(hybrid_bollard);


maxlim = interp1(J(:,1), J(:, 2), rpm);
% shifted_lim = polyfit(shift(:, 1), shift(:, 2), 3);
% shifted_lim_plot = polyval(shifted_lim, rpm);
shifted_lim = interp1(shift(:, 1), shift(:, 2), rpm);
conv_free_plot = interp1(conv_free(:, 1), conv_free(:, 2), rpm);
conv_tow_plot = interp1(conv_tow(:, 1), conv_tow(:, 2), rpm);
conv_boll_plot = interp1(conv_boll(:, 1), conv_boll(:, 2), rpm);
hybrid_free_plot = interp1(hybrid_free(:, 1), hybrid_free(:, 2), rpm);
hybrid_tow_plot = interp1(hybrid_tow(:, 1), hybrid_tow(:, 2), rpm);
hybrid_bollard_plot = interp1(hybrid_bollard(:, 1), hybrid_bollard(:, 2), rpm);


efficiencies = fit([x, y], z, 'cubicinterp');
eff = plot(efficiencies, 'Style', 'Contour');
C = get(eff, 'ContourMatrix');
clabel(C, eff);

hold on
plot(rpm, maxlim, 'k', 'LineWidth', 2)
plot(rpm, shifted_lim, 'k--', 'LineWidth', 2)
plot(rpm, conv_free_plot, 'g-', 'LineWidth', 2)
plot(rpm, hybrid_free_plot, 'g--', 'LineWidth', 2)
plot(rpm, conv_tow_plot, 'r-', 'LineWidth', 2)
plot(rpm, hybrid_tow_plot, 'r--', 'LineWidth', 2)
plot(rpm, conv_boll_plot, 'm-', 'LineWidth', 2)
plot(rpm, hybrid_bollard_plot, 'm--', 'LineWidth', 2)
legend('Conv Limit', 'Hybrid Limit', 'Conv Free', 'Hybrid Free', 'Conv Tow', 'Hybrid Tow', 'Conv Bollard', 'Hybrid Bollard', 'Location','northwest')
ylim([0 2300])
