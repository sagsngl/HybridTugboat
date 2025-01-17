function fuel   = fuel_con_map(rpm,pow)
x = (rpm-1180)/409.7;
y = (pow-876.1)/438.6;
p00 =         203;
p10 =      0.9394;
p01 =      -8.327;
p20 =       1.894;
p11 =     -0.7168;
p02 =       1.321;
p30 =      0.2621;
p21 =       1.482;
p12 =       5.529;
p03 =      -2.619;
p40 =      0.9252;
p31 =      -3.236;
p22 =       3.413;
p13 =      -2.546;
p04 =        2.97;
p50 =     -0.1717;
p41 =       1.492;
p32 =      -2.908;
p23 =      0.2029;
p14 =      0.4508;
p05 =     -0.7973;
fuel = p00 + p10*x + p01*y + p20*x^2 + p11*x*y + p02*y^2 + p30*x^3 + p21*x^2*y ...
         + p12*x*y^2 + p03*y^3 + p40*x^4 + p31*x^3*y + p22*x^2*y^2 ...
         + p13*x*y^3 + p04*y^4 + p50*x^5 + p41*x^4*y + p32*x^3*y^2 ...
          + p23*x^2*y^3 + p14*x*y^4 + p05*y^5;
end