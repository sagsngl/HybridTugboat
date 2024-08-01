function fuel   = fuel_con_map(rpm,pow)
x = rpm;
y = pow;
%Coefficients (with 95% confidence bounds):
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

fuel = p00 + p10*x + p01*y + p20*x^2 + p11*x*y + p02*y^2 + p30*x^3 + p21*x^2*y ...
    + p12*x*y^2 + p03*y^3 + p40*x^4 + p31*x^3*y + p22*x^2*y^2 ...
    + p13*x*y^3 + p04*y^4 + p50*x^5 + p41*x^4*y + p32*x^3*y^2 ...
    + p23*x^2*y^3 + p14*x*y^4 + p05*y^5;
end