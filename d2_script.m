f = (1/24)*x^4; %function
start_d=0; %start derivative
end_d=4; %end derivative
s = 60; %number of steps
o=5; %taylor series order

clf;
for a=linspace(start_d,end_d,s+1)
    ezplot(d2(f,a,o))
    axis([0 5 -1 3])
    drawnow
end