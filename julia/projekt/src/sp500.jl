## inicijalizacija Pkg
using Pkg
Pkg.add("DataFrames")
Pkg.add("CSV")
Pkg.add("Distributions")
Pkg.add("Statistics")
Pkg.add("StatsFuns")
Pkg.add("Plots")
using Distributions, Statistics, StatsFuns, CSV, DataFrames, Plots
##

## dohvacanje podataka
df = DataFrame(CSV.File("./src/povijesni_model_sp500.csv"))
##

## plottanje grafa
dates = df[!, :Date]
price = df[!, :Close]

plot(dates,reverse(price),title="S&P 500 indeks tijekom 40 godina", label="S&P 500", xlabel="godine", legend=:topleft)
xticks!([0,253*10,253*20, 253*30, 253*40], ["1980", "1990", "2000", "2010", "2020"])
##

##
yearOpen = filter(r -> any(occursin.(["01/02/"], r.Date)), df) # tražimo prvi dan godine
yearClose = filter(r -> any(occursin.(["12/31/"], r.Date)), df) # tražimo zadnji dan godine
delete!(yearClose, [1,8,9,12,17,21,28,29,31]) # ispravljanje neispravnih podataka
##

## godine
yrsF = yearOpen[!,:Date]   # uzimamo puni datum
yrs=[]

# u novi vektor stavljamo sve godine koje su iz preuzetih podataka
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

# u vektor difference racunamo krajnju vrijednost, vrijednost i postotnu razliku izmedu svake godine
difference = []
points = []
for i in 1:size(openArr,1)
   push!(points, (closeArr[i]-openArr[i])) # racunamo
   push!(difference,(closeArr[i]-openArr[i])/openArr[i]*100)
end

print(difference)

expectedAnnualReturn = sum(difference)/size(difference,1) # očekivani godisnji povrat
stdDev = [] # standardna devijacija za svaku godinu
for i in 1:size(difference,1)
   push!(stdDev, sqrt(abs2(difference[i] - expectedAnnualReturn)))
end

print(stdDev)
totalStdDev = sum(stdDev)/size(stdDev,1)

##

## stvaranje novog DataFrame-a
dfSP = DataFrame(annualReturn = expectedAnnualReturn,
stdDev = totalStdDev)
##

##
function norm_dist_annual(annualReturn, stdDev)
μ = annualReturn
σ = stdDev
dist = Normal(μ, σ)
x = μ - 3σ : 0.01 : μ + 3σ
plot(x-> pdf(dist,x), -30, 50)
xticks!(-30:10:50)
title!("Normalna Razdioba")
xlabel!("Godišnji rast (%)")
ylabel!("Funkcija gustoće")
end
##

##
annualReturn = dfSP[!,:annualReturn][1]/12
stdDev = dfSP[!,:stdDev][1]/12
norm_dist_annual(annualReturn, stdDev)
##