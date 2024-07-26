function cuarta(x,y,x1,y1,x2,y2,x3,y3,x4,y4)
    A = [x^4 x^3 x^2 x 1; 
    x1^4 x1^3 x1^2 x1 1;
    x2^4 x2^3 x2^2 x2 1
    x3^4 x3^3 x3^2 x3 1
    x4^4 x4^3 x4^2 x4 1];
    b = [y; y1; y2; y3 ; y4];
    coef = A \ b;
    a = coef(1);
    b = coef(2);
    c = coef(3);
    d = coef(4);
    e = coef(5);
    x_reg = linspace(min([x x1 x2 x3 x4]), max([x x1 x2 x3 x4]), 100);
    y_reg = a*x_reg.^4 + b*x_reg.^3 + c*x_reg.^2 + d*x_reg + e;
    hold on;
    plot([x x1 x2 x3 x4], [y y1 y2 y3 y4], 'o');
    plot(x_reg, y_reg);

end