syms x
f = (1/2)*x^2; %function
start_d=-2; %start derivative
end_d=3; %end derivative
s = 100; %number of steps
o=5; %taylor series order

clf;
for a=linspace(start_d,end_d,s+1)
    ezplot(d2(f,a,o))
    text('Position',[4,2.5],'HorizontalAlignment','center','String',strcat('$\frac{d^{',num2str(a),'}}{dx^{',num2str(a),'}}[',latex(f),']$'),'interpreter','latex','fontsize',20)
    axis([0 5 -1 3])
    drawnow
end