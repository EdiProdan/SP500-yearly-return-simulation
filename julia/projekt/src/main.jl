## uključivanje paketa

using Pkg
Pkg.add("Plots") 
Pkg.add("DataFrames")
Pkg.add("CSV")
Pkg.add("Distributions")
Pkg.add("Statistics")
Pkg.add("StatsFuns")
using Distributions, Statistics, StatsFuns, CSV, DataFrames, Plots

##

# ------------------------------------------------------------

## složene kamate - penny example

# compund interest se gleda kao funkcija f(x) = 2^x

# x u ovom slucaju gledamo kao jedan novčić vrijednosti 1 lipe 
# te stoga dijelimo cijelu vrijednost fje sa 100

compound_interest(startingCapitalCP1) = 2^(startingCapitalCP1) / 100
plot_ci = plot(compound_interest, 0, 30, title="Dvostruki novčić dnevno kroz period od 30 dana", label="vrijednost novčića", lw=3, xlabel="dani")
savefig(plot_ci,"compound_interest.png")
##

# ------------------------------------------------------------

## povijesni model S&P500 indeksa

## dohvacanje podataka
df = DataFrame(CSV.File("./projekt/csv/povijesni_model_sp500.csv"))
##


## plottanje grafa
dates = df[!, :Date] # polje svih datuma
price = df[!, :Close] # polje svih zavrsnih cijena

plot_pi = plot(dates,reverse(price),title="S&P 500 indeks tijekom 40 godina", label="S&P 500", xlabel="godine", legend=:topleft)
# 253 trading dana, gledamo za proslih 40, 30, 20 i 10 godina i sadasnjost
xticks!([0,253*10,253*20, 253*30, 253*40], ["1980", "1990", "2000", "2010", "2020"])
savefig(plot_pi, "sp500_40y")
##


##
yearOpen = filter(r -> any(occursin.(["01/02/"], r.Date)), df) # tražimo prvi dan godine
yearClose = filter(r -> any(occursin.(["12/31/"], r.Date)), df) # tražimo zadnji dan godine
delete!(yearClose, [1,8,9,12,17,21,28,29,31]) # ispravljanje neispravnih podataka
##


## godine
yrsF = yearOpen[!,:Date]   # uzimamo prve godine proslih 40 godina
yrs=[] 

# u novi vektor stavljamo sve godine koje su iz preuzetih podataka 
# i zapisujemo 19 ili 20 ovisno o zadnje 2 znamenke godine
for i in yrsF
   push!(yrs,(parse(Int64, SubString(i, 7:8)) > 80) ? (parse(Int64, "19"*SubString(i,7:8))) : (parse(Int64,"20"*SubString(i,7:8))))
end
##


## godisnja razlika

# u nove vektore stavljamo cijene zatvaranja/otvaranja
closeArr=[]
for i in eachrow(yearClose)
   push!(closeArr,i[:Close])
end
openArr=[]
for i in eachrow(yearOpen)
   push!(openArr,i[:Open])
end

# u vektor difference racunamo postotnu razliku izmedu svake godine
difference = []
for i in 1:size(openArr,1)
   push!(difference,(closeArr[i]-openArr[i])/openArr[i]*100)
end

expectedAnnualReturn = sum(difference)/size(difference,1) # očekivani godisnji povrat
stdDev = [] # standardna devijacija za svaku godinu
for i in 1:size(difference,1)
   push!(stdDev, sqrt(abs2(difference[i] - expectedAnnualReturn)))
end

totalStdDev = sum(stdDev)/size(stdDev,1) # standradna devijacija cijelog modela

##

# ------------------------------------------------------------

## stvaranje novog DataFrame-a
dfSP = DataFrame(annualReturn = expectedAnnualReturn,
stdDev = totalStdDev)
##


##
function norm_dist_annual(annualReturn, stdDev)
   μ = annualReturn # ocekivanje
   σ = stdDev # standardna devijacija
   dist = Normal(μ, σ) # pozivamo fju za normalnu distribuciju
   x = μ - 3σ : 0.01 : μ + 3σ # 3 sigma pravilo -> vjerojatnost ispod gustoce = 0.9973
   plot_nd = plot(x-> pdf(dist,x), -30, 50)
   xticks!(-30:10:50)
   title!("Normalna Razdioba")
   xlabel!("Godišnji rast (%)")
   ylabel!("Funkcija gustoće")
   savefig(plot_nd,"normalna_razdioba")
end
##


##
# uzimamo godisnji povrat (12 mjeseci) u postocima
annualReturn = dfSP[!,:annualReturn][1]/12 
# uzimamo standardnu devijaciju cijelog modela (12 mjeseci) u postocima
stdDev = dfSP[!,:stdDev][1]/12
norm_dist_annual(annualReturn, stdDev)
##
