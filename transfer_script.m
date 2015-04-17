clf;
domain = 16*pi;
N = 512;
x = domain*linspace(0,1-1/N,N)-domain/2;
f = exp(-x.^2);
f = f-mean(f);

t_max = 5;
t_step = 0.005;

for t=linspace(0,t_max - t_step,t_max/t_step)
    % compute derivative
    df = d(f,1/3,domain);
    
    % move each point
    for i=1:N
        f(i) = f(i)+df(i)*t_step;
    end
    if (mod(t/t_step,5)==0) 
        plot(x,f)
        ylim([-150 150])
        drawnow
    end
end