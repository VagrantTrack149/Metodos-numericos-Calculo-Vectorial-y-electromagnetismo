function cuadratic(x,y,x1,y1,x2,y2)
A = [x^2 x 1; 
    x1^2 x1 1;
    x2^2 x2 1];
b = [y; y1; y2];
    coef = A \ b;
    a = coef(1);
    b = coef(2);
    c = coef(3);
    x_reg = linspace(min([x x1 x2]), max([x x1 x2]), 100);
    y_reg = a*x_reg.^2 + b*x_reg + c;
    hold on;
    plot([x x1 x2], [y y1 y2], 'o');
    plot(x_reg, y_reg);
end
