## ------------ ZADATAK 1 ------------
print("Zadatak 1:\n")
x = y = 1
x
y
print(x, " ", y)
# i x i y ce postati 1
##

## ------------ ZADATAK 2 ------------
print("Zadatak 2:\n")
15 = a
# syntax error
##


## ------------ ZADATAK 3 ------------
print("Zadatak 3:\n")
x = 5
y = 3
xy # syntax error
x*y # mnozi dva broja
##

## ------------ ZADATAK 4 ------------

print("Upišite a: ")
a = parse(UInt8, readline())
print("Upišite objek čiji volumen želite izračunati: ")
obj = readline()
if obj == "sfera"
   volumen = 4/3 * pi * a*a*a
elseif obj == "kocka"
   volumen = a * a * a 
else
   print("Nepoznati objekt")
end

print(volumen)
##

## ------------ ZADATAK 5 ------------

function myAbs(x)
        if x<0
         return x *-1
        else
         return x
        end
end
print(myAbs(5))
##


## ------------ ZADATAK 6 ------------

function udaljenostDvijuTocaka(x1,x2,y1,y2)
   return sqrt(abs2(x2-x1)+abs2(y2-y1))

end
print(udaljenostDvijuTocaka(1,2,3,4))
##

## ------------ ZADATAK 7 ------------
for i in range(1,30)
   if(i%3!=0)
      println(i)
   end
end
##

## ------------ ZADATAK 8 ------------

function izracunajPonavljanjeA(str)
   brojac=0
   for i in str
      if(i == 'a')
         brojac=brojac+1
      end
   end
   return brojac
end
print(izracunajPonavljanjeA("Volim studirati u Zagrebu."))
##