clf;
domain = 16*pi;
N = 256;
x = domain*linspace(0,1-1/N,N)-domain/2;
f = exp(-(x/3).^2);
% f = 1./(x.^4+1);
% f = exp(-1./(1-(2*x/domain).^2));
% f = sin(4/32*x);
f = f-mean(f);

t_max = 1000;
t_step = 0.001;
count = 0; 
df_old = zeros(1,length(f));
df_old2 = zeros(1,length(f));
a = 0;
% a = 0.5;
% a = 1.0;
% a = 1.1;
% a = 1.8;
% a = 2;
% a = 2.5;
% a = 3;
for t=linspace(0,t_max - t_step,t_max/t_step)
    % compute derivative
    df = d(f,a,domain,128);
    
    % move each point
    if count == 0
        for i=1:N
            f(i) = f(i)+df(i)*t_step;
        end
    elseif count == 1
        % two-step Adams Bashforth method
        for i=1:N
            f(i) = f(i)+(1.5*df(i) - 0.5*df_old(i))*t_step;
        end
    else
        % three-step Adams Bashforth method
        for i=1:N
            f(i) = f(i)+(23/12*df(i) - 4/3*df_old(i) + 5/12*df_old2(i))*t_step;
        end
    end
    if (mod(count,50)==0)
        t
        plot(x,f)
%         ylim([-.50 1.50])
%         axis([ -10, 30, -1.5, 1.5])
        drawnow
    end
    df_old2 = df_old;
    df_old = df;
    count = count + 1;
end
