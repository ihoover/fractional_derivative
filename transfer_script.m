clf;
domain = 16*pi;
N = 256;
x = domain*linspace(0,1-1/N,N)-domain/2;
f = exp(-(x/4).^8);
% f = 1./(x.^4+1);
% f = exp(-1./(1-(2*x/domain).^2));
% f = sin(4/32*x);
f = f-mean(f);

t_max = 1000;
t_step = 0.01;
count = 0; 
df_old = zeros(1,length(f));
df_old2 = zeros(1,length(f));
df2_old = zeros(1,length(f));
df2_old2 = zeros(1,length(f));
f2 = f;
a = 1.005;
for t=linspace(0,t_max - t_step,t_max/t_step)
    % compute derivative
    df = -real(exp(1i*a*pi/2))*d(f,2,domain,128)+imag(exp(1i*a*pi/2))*d(f,1,domain,128);
    df2 = d(f2,a,domain,256);
    
    % move each point
    if count == 0
        for i=1:N
            f(i) = f(i)+df(i)*t_step;
            f2(i) = f2(i)+df2(i)*t_step;
        end
    elseif count == 1
        % two-step Adams Bashforth method
        for i=1:N
            f(i) = f(i)+(1.5*df(i) - 0.5*df_old(i))*t_step;
            f2(i) = f2(i)+(1.5*df2(i) - 0.5*df2_old(i))*t_step;
        end
    else
        % three-step Adams Bashforth method
        for i=1:N
            f(i) = f(i)+(23/12*df(i) - 4/3*df_old(i) + 5/12*df_old2(i))*t_step;
            f2(i) = f2(i)+(23/12*df2(i) - 4/3*df2_old(i) + 5/12*df2_old2(i))*t_step;
        end
    end
    if (mod(count,50)==0)
        t
        clf
        plot(x,f)
        hold on
        plot(x,f2)
        ylim([-1.50 1.50])
%         axis([ -10, 30, -1.5, 1.5])
        drawnow
    end
    df_old2 = df_old;
    df_old = df;
    df2_old2 = df2_old;
    df2_old = df2;
    count = count + 1;
end
