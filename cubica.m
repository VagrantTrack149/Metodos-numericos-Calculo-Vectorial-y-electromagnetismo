function cubica(x,y,x1,y1,x2,y2,x3,y3)
    A = [x^3 x^2 x 1; 
    x1^3 x1^2 x1 1;
    x2^3 x2^2 x2 1
    x3^3 x3^2 x3 1];
b = [y; y1; y2; y3];
    coef = A \ b;
    a = coef(1);
    b = coef(2);
    c = coef(3);
    d = coef(4);
    x_reg = linspace(min([x x1 x2 x3]), max([x x1 x2 x3]), 100);
    y_reg = a*x_reg.^3 + b*x_reg.^2 + c*x_reg + d;
    hold on;
    plot([x x1 x2 x3], [y y1 y2 y3], 'o');
    plot(x_reg, y_reg);

end