function automatica(x,y,n)
    xx=linspace(min(x), max(x), 100);
    a=polyfit(x,y,n);
    ax=polyval(a,xx);
    hold on;
    plot(x,y,'o');
    plot(xx,ax);
    hold off;
end