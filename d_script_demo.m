clf;
domain = 16*pi;
N = 512;
x = domain*linspace(0,1-1/N,N)-domain/2;
f = exp(-x.^2);
% f = exp(-1./(1-(2*x/domain).^2));
% f = sin(x);
f = f-mean(f);
max (d(f,1,domain) - (-2*x.*exp(-x.^2)))
max (d(f,2,domain) - ((4*x.^2-2).*exp(-x.^2)))
max (d(f,3,domain) - ((-8*x.^3+12*x).*exp(-x.^2)))
for a=linspace(0,6,500);
    clf
    plot (x,(d(f,a,domain)))
%     ylim([-10, 10]);
%     if (a < 3)
%         axis([-10,10,-5,5])
%     elseif (a < 4)
%         axis([-10,10,-10,10])
%     else
%         axis([-10,10,-40,40])
%     end
    drawnow
end