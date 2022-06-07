## uključivanje paketa

using Pkg
Pkg.add("Plots") # dodajemo Plots
using Plots


##

# ------------------------------------------------------------

## složene kamate - penny example

# compund interest se gleda kao funkcija f(x) = 2^x

# x u ovom slucaju gledamo kao jedan novčić vrijednosti 1 lipe 
# te stoga dijelimo cijelu vrijednost fje sa 100

compound_interest(startingCapitalCP1) = 2^(startingCapitalCP1) / 100
plot(compound_interest, 0, 30, title="Dvostruki novčić dnevno kroz period od 30 dana", label="vrijednost novčića", lw=3, xlabel="dani")

##

# ------------------------------------------------------------

## povijesni model S&P500 indeksa

