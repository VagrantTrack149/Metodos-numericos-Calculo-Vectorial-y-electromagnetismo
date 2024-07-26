function septima(x, y, x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6, x7, y7)
    A = [x^7 x^6 x^5 x^4 x^3 x^2 x 1; 
         x1^7 x1^6 x1^5 x1^4 x1^3 x1^2 x1 1;
         x2^7 x2^6 x2^5 x2^4 x2^3 x2^2 x2 1;
         x3^7 x3^6 x3^5 x3^4 x3^3 x3^2 x3 1;
         x4^7 x4^6 x4^5 x4^4 x4^3 x4^2 x4 1;
         x5^7 x5^6 x5^5 x5^4 x5^3 x5^2 x5 1;
         x6^7 x6^6 x6^5 x6^4 x6^3 x6^2 x6 1;
         x7^7 x7^6 x7^5 x7^4 x7^3 x7^2 x7 1];
    b = [y; y1; y2; y3; y4; y5; y6; y7];
    coef = A \ b;
    a = coef(1);
    b = coef(2);
    c = coef(3);
    d = coef(4);
    e = coef(5);
    f = coef(6);
    g = coef(7);
    h = coef(8);
    x_reg = linspace(min([x x1 x2 x3 x4 x5 x6 x7]), max([x x1 x2 x3 x4 x5 x6 x7]), 100);
    y_reg = a*x_reg.^7 + b*x_reg.^6 + c*x_reg.^5 + d*x_reg.^4 + e*x_reg.^3 + f*x_reg.^2 + g*x_reg + h;
    hold on;
    plot([x x1 x2 x3 x4 x5 x6 x7], [y y1 y2 y3 y4 y5 y6 y7], 'o');
    plot(x_reg, y_reg);
end
