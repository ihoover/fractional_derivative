function df=d2(f,a,o)
t=taylor(f, 'Order', o);
c=sym2poly(t);
c=fliplr(c);
df=0;
syms x;
for i=1:length(c)
    df=df+x^(i-1-a)*c(i)*gamma(i)/gamma(i-a);
end
end