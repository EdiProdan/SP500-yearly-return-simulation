
import Pkg
Pkg.add("Plots")

global m=70
global c=0.25
global g=9.81
# ------------ ZADATAK 1 ------------

##

# ne znam formulu za prijedeni put s otporom zraka

##
# ------------ ZADATAK 2 ------------

## parametri i varijable koje znamo
m = 70
#cd=0.25
t = 1:2:14
g = 9.81
##

## jednadžba brzine ovisne o vremenu bez otpora zraka - analitičko rješenje:

v = sqrt((g * m)) .* tanh.(sqrt.((g) / m) .* t)

##

## jednadžba prijedenog puta ovisne o vremenu - analitičko rješenje:
s = Vector{Float64}
s = zeros(0)
print(s)
foreach(timestamp -> append!(s, timestamp * timestamp * g / 2), t)
print(s)
##


## prikaz ovisnosti na grafu
using Plots
plot(v, t, label="Prijeden put ovisno o vremenu bez otpora zraka_ analitičko", color=:red, legend=:bottomright) # osnovna naredba za plot osnovna naredba za plot
plot!(xlab="t [s]", ylab="v [m/s]")
##

## prikaz ovisnosti na grafu
using Plots
plot(s, t, label="Prijeden put ovisno o vremenu_ analitičko", color=:red, legend=:bottomright) # osnovna naredba za plot osnovna naredba za plot
plot!(xlab="t [s]", ylab="s [m]")
##


# ------------ ZADATAK 3 ------------

# numericko rješenje

##
function deriva(v)
   dv=g-((c/m)*v*v)
   return dv
end
##
function brzina2(v0, dt, tp, tk) # v0-početna vrijednost brzine (ovisne varijable),dt-vremenski korak, tp- početno vrijeme, tk-konačno vrijeme
   vi = v0
   ti = tp
   s = dt # unosimo ovu varijablu da bi po potrebi negdje drugdje kasnije znali vrijednost dt 
   br=zeros(0) # vektor za spremanje brzine svakog intervala
   vrijeme = zeros(0)
   while true
      if ti + dt > tk # testiranje da ne idemo preko konačnog intervala
         s = tk - ti # ako idemo preko intervala onda skraćujemo vrijeme koraka - time garantiramo da će korak završiti na tk
      end
      dvdt = deriva(vi)
      vi = vi + dvdt * s
      ti = ti + s
      append!(br, vi) # da bi imali brzinu u svakom intervalu
      append!(vrijeme, ti)
      if ti >= tk # kada je vrijeme ti veće od konačnog vremena intervala prekidamo petlju 
         break
      end
   end
   return vi, br, vrijeme
end
##

## pozivanje funkcije
rez, brzi, vrijeme = brzina2(0, 0.5, 0, 14)
##napravimo sliku
using Plots
plot(vrijeme, brzi, label="Brzina ovisno o vremenu", legend=:bottomright) # osnovna naredba za plot
plot!(xlab="t [s]", ylab="v [m/s]")


# ne razumijem gdje izbacuje gresku, "m not defined"?????

##


# ------------ ZADATAK 4 ------------


## parametri i varijable koje znamo

#cd=0.25

##

## jednadžba brzine ovisne o vremenu bez otpora zraka - analitičko rješenje:

#v = sqrt((g * m)) .* tanh.(sqrt.((g) / m) .* t)

##

##
@gif for i in 1:50
   plot!(v, 0,indexin(i,v))
end when i > 3
##