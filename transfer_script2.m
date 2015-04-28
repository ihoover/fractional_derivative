clf;
domain = 16*pi;
N = 256;
x = domain*linspace(0,1-1/N,N)-domain/2;
f = exp(-(x/4).^8);
f = f-mean(f);

a=1.2;

t_max = 1000;
t_step = 0.005;
count = 0;

df1_old = zeros(1,length(f));
df1_old2 = zeros(1,length(f));
f1 = f;
df2_old = zeros(1,length(f));
df2_old2 = zeros(1,length(f));
f2 = f;
df3_old = zeros(1,length(f));
df3_old2 = zeros(1,length(f));
f3 = f;

for t=linspace(0,t_max - t_step,t_max/t_step)
    % compute derivative
    df1 = d(f1,1,domain,128);
    df2 = d(f2,a,domain,128);
    df3 = d(f3,2,domain,128);
    % move each point
    if count == 0
        for i=1:N
            f1(i) = f1(i)+df1(i)*t_step;
            f2(i) = f2(i)+df2(i)*t_step;
            f3(i) = f3(i)+df3(i)*t_step;
        end
    elseif count == 1
        % two-step Adams Bashforth method
        for i=1:N
            f1(i) = f1(i)+(1.5*df1(i) - 0.5*df1_old(i))*t_step;
            f2(i) = f2(i)+(1.5*df2(i) - 0.5*df2_old(i))*t_step;
            f3(i) = f3(i)+(1.5*df3(i) - 0.5*df3_old(i))*t_step;
        end
    else
        % three-step Adams Bashforth method
        for i=1:N
            f1(i) = f1(i)+(23/12*df1(i) - 4/3*df1_old(i) + 5/12*df1_old2(i))*t_step;
            f2(i) = f2(i)+(23/12*df2(i) - 4/3*df2_old(i) + 5/12*df2_old2(i))*t_step;
            f3(i) = f3(i)+(23/12*df3(i) - 4/3*df3_old(i) + 5/12*df3_old2(i))*t_step;
        end
    end
    if (mod(count,100)==0)
        clf
        hold on
        plot(x,f2,'LineWidth',2)
        plot(x,f1)
        plot(x,f3)
        legend({strcat('\alpha= ',num2str(a)),'Transport','Diffusion'},'FontSize',16)
        ylim([-.10 1.50])
        axis([ -8*pi, 8*pi, -.5, 1.5])
        drawnow
    end
    df1_old2 = df1_old;
    df1_old = df1;
    df2_old2 = df2_old;
    df2_old = df2;
    df3_old2 = df3_old;
    df3_old = df3;
    count = count + 1;
end
