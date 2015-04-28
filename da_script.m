clf;
domain = 16*pi;
N = 512;
x = domain*linspace(0,1-1/N,N)-domain/2;
f = exp(-(x/2).^2);
% f = exp(-1./(1-(2*x/domain).^2));
% f = sin(x);
f = f-mean(f);
for a=linspace(0,6,500);
    clf
    plot (x,(da(f,a,domain)))
    hold on
    plot (x,(d(f,a,domain)))
%     ylim([-2, 2]);
%     if (a < 3)
%         axis([-10,10,-5,5])
%     elseif (a < 4)
%         axis([-10,10,-10,10])
%     else
%         axis([-10,10,-40,40])
%     end
    drawnow
end