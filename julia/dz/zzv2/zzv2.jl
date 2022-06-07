##
using Pkg
Pkg.add("DataFrames")
Pkg.add("CSV")
using DataFrames, CSV
##

## ------------ ZADATAK 1 ------------
function Fahrenheit(celzij)
   return celzij * 1.8 + 32
end

function Kelvin(celzij)
   return celzij + 273.15
end
   
celzij = 5

print("Upisite 'F' za pretvorbu u Fahrenheit ili 'K' za pretvorbu u Kelvine:\n")

s = readline()

if(s == "F")
   rez = Fahrenheit(celzij)
elseif(s=="K")
   rez = Kelvin(celzij)
else
   rez = "Krivi unos"
end
print(rez)

##

## ------------ ZADATAK 2 ------------

df_trokut = CSV.read("duljine_stranica.csv", DataFrame)

duljine_stranica=df_trokut[1, 3]
a = df_trokut[1, 1]
b = df_trokut[1, 2]
c = df_trokut[1, 3]

rez = 0
if(isequal(a, missing))
   a = sqrt(b*b + c*c)
elseif(isequal(b, missing))
   b = sqrt(a*a + c*c)
end

rez = a*b/2

print(rez)
##


## ------------ ZADATAK 3 ------------
a = readline()
b = readline()
c = readline()
s = (a + b + c) / 2
area = sqrt(s * (s - a) * (s - b) * (s - c))
print(area)
##