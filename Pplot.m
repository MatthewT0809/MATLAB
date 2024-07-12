x = linspace(0,2*pi,500)
y = sin(x)

plot(x,y)

z = cos(x)
hold on 
plot (x,z)
grid on 


[a,b] = ginput