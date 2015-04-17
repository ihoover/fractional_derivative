clf;
domain = 20;
N = 512;
x = domain*linspace(0,1-1/N,N)-domain/2;
f = exp(-x.^2);

f = f-mean(f);
for a=linspace(0,5,300);
    plot (x,d(f,a,domain))
    if (a < 3)
        axis([-10,10,-5,5])
    elseif (a < 4)
        axis([-10,10,-10,10])
    else
        axis([-10,10,-40,40])
    end
    drawnow
end