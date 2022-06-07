##
using Pkg
Pkg.add("Plots")
using Plots
##

## ------------ ZADATAK 1 ------------
x = 1:0.1:2*π
y = cos.(x).^2

plot(x, y, label="cos(x)^2")
plot!(xlab="x", ylab="f(x)")
y2=sin.(x).^2

plot!(x, y2, label="sin(x)^2", color=:red, line=:dash) 
savefig("dark_prvi_img.png")

a=1:20; b = rand(20, 5)
c=1:5; d=rand(5,2)
g=1:25; h=1:25
p1 = plot(a, b) # vizualizacija linijom 
p2 = scatter(g, h) # scatter plot
p3 = plot(a, b, xlabel = "a", lw = 0.5, title = "Naziv
#  slike")
p4 = histogram(c, d)
plot(p1, p2, p3, p4, layout = (2, 2), legend = false)
##


## ------------ ZADATAK 2 ------------
gr()
x = 1:0.1:2*π
y = cos.(x).^2

plot(x, y, label="cos(x)^2")
plot!(xlab="x", ylab="f(x)")
y2=sin.(x).^2

plot!(x, y2, label="sin(x)^2", color=:red, line=:dash, title="Koristenje GR") 
savefig("gr_prvi_img.png")

a=1:20; b = rand(20, 5)
c=1:5; d=rand(5,2)
g=1:25; h=1:25
p1 = plot(a, b) # vizualizacija linijom 
p2 = scatter(g, h) # scatter plot
p3 = plot(a, b, xlabel = "a", lw = 0.5, title = "Koristenje GR")
p4 = histogram(c, d)
plot(p1, p2, p3, p4, layout = (2, 2), legend = false)
##

##
Pkg.add("PlotlyJS")
plotlyjs() # Set the backend to Plotly
x = 1:0.1:2*π
y = cos.(x).^2

plot(x, y, label="cos(x)^2")
plot!(xlab="x", ylab="f(x)")
y2=sin.(x).^2

plot!(x, y2, label="sin(x)^2", color=:red, line=:dash, title="Koristenje Plotly") 
savefig("plotly_prvi_img.png")

a=1:20; b = rand(20, 5)
c=1:5; d=rand(5,2)
g=1:25; h=1:25
p1 = plot(a, b) # vizualizacija linijom 
p2 = scatter(g, h) # scatter plot
p3 = plot(a, b, xlabel = "a", lw = 0.5, title = "Koristenje Plotly")
p4 = histogram(c, d)
plot(p1, p2, p3, p4, layout = (2, 2), legend = false)
##

##
Pkg.add("PyPlot")
pyplot()
x = 1:0.1:2*π
y = cos.(x).^2

plot(x, y, label="cos(x)^2")
plot!(xlab="x", ylab="f(x)")
y2=sin.(x).^2

plot!(x, y2, label="sin(x)^2", color=:red, line=:dash, title="Koristenje PyPlot") 
savefig("PyPlot_prvi_img.png")

a=1:20; b = rand(20, 5)
c=1:5; d=rand(5,2)
g=1:25; h=1:25
p1 = plot(a, b) # vizualizacija linijom 
p2 = scatter(g, h) # scatter plot
p3 = plot(a, b, xlabel = "a", lw = 0.5, title = "Koristenje PyPlot")
p4 = histogram(c, d)
plot(p1, p2, p3, p4, layout = (2, 2), legend = false)
##


## ------------ ZADATAK 4 ------------
@gif for i in 1:50
   plot(sin, 0, i * 2pi / 10)
end when i > 3
##

##
@gif for i in 1:50
   plot(cos, 0, i * 2pi / 10)
end when i > 3
##

##
@gif for i in 1:50
   plot(exp, 0, i/2 )
end when i > 3
##



