clf;
domain = 4*pi;
N = 64;
x = domain*linspace(0,1-1/N,N)-domain/2;
f = exp(-x.^2);
f = sin(x);

for a=linspace(0,2,100);
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
% plot (x,df' - (-2.*x.*exp(-x.^2)))
% hold on
%plot (x,df)
%plot(x,D2*f')