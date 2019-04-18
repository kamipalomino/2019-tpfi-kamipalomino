
{-# LANGUAGE NoMonomorphismRestriction #-}
import Text.Show.Functions 
import Data.Maybe
import Data.List
import Test.Hspec.Core.Runner
import Test.Hspec.Core.Spec


ejecutarTest = hspec $ do
 describe "Tesoros piratas" $ do
	it "La cantidad de tesoros de un pirata, Debería ser 2."$ (cantidadDeTesoros jackSparrow) == 2
	it "Si un pirata es afortunado, Debería ser True."$ esAfortunado jackSparrow == True
	it "jackSparrow y anneBonnny tienen un mismo tesoro, pero de valor diferente. Debería ser Verdadero" $ tesoroenComúnDistintoValor jackSparrow anneBonnny == True
  	it "El valor del tesoro más valioso de davidJones. Es de 1"$ (masValioso davidJones) == 1
  	it "davidJones luego de adquirir un cuchillo valuado en 5" $ adquirirUnTesoroNuevo cuchillo davidJones == Pirata {nombre = "David Jones", botin = [("Cuchillo",5),("Cajita musical",1)]}
	it "Jack Sparrow luego de perder todos los tesoros valiosos, queda con tesoro de 10001" $ sacarTesorosValiosos jackSparrow == Pirata {nombre = "Jack Sparrow", botin = [("Brujula", 10001)]}
	it "Daidjones luego de perder todos los tesoros llamados 'Cajita musical' que sin Tesoros" $ sacarTesoroEspecifico "Cajita musical" davidJones == []
	 

--------------------------------------------------}


type Isla = (Tesoro, String, Int)
type Nombre = String
type Valor = Int
type Tesoro = (String, Int)
type Saqueo = Tesoro -> Pirata -> Pirata

data Barco = Barco {
	tripulacion :: [Pirata],
	maneraDeSaquear :: Saqueo
} deriving (Show)

data Pirata = Pirata {
    nombre :: Nombre,
    botin :: [Tesoro]
  } deriving (Show, Eq)


tesoroNuevo :: String -> Int -> Tesoro
tesoroNuevo unNombre unValor = (unNombre, unValor) 

nombreDelTesoro :: Tesoro -> String
nombreDelTesoro = fst 

valorDelTesoro:: Tesoro -> Int
valorDelTesoro = snd

nuevoValorDelTesoro :: Tesoro -> Int -> Int
nuevoValorDelTesoro  (_,valorDelTesoro) unValor= unValor

nuevoPirata :: String -> Pirata -> Pirata
nuevoPirata  unNombre  unPirata = unPirata {nombre      = unNombre}

nuevoBotin :: [Tesoro] -> Pirata -> Pirata
nuevoBotin unBotin unPirata = unPirata {botin = unBotin}

nombresDelbotin :: Pirata -> [String]
nombresDelbotin = map nombreDelTesoro.(botin)

botinDelTesoro :: Pirata -> [Int]
botinDelTesoro  = map valorDelTesoro.(botin)

laTripulacion :: Barco ->Int
laTripulacion = length .(tripulacion)  

------------------------------ TESOROS ---------------------------------------------------
oro = ("Oro", 101)
frasco = ("Frasco de Arena", 0)
cajitaMusical =  ("Cajita musical", 1)
doblones = ("Doblones", 100)
brujula = ("Brujula", 10001)
cofreMuerto = ("Cofre muerto", 100)
espada = ("Espada de hierro", 50)
cuchillo = ("Cuchillo", 5)
ron =("Botella de Ron", 25)
------------------------------ PIRATAS ---------------------------------------------------

jackSparrow = Pirata { nombre = "Jack Sparrow", botin = [brujula, frasco]}
davidJones = Pirata { nombre = "David Jones", botin = [cajitaMusical]}
anneBonnny = Pirata {nombre = "Anne Bonny", botin = [doblones, (nombreDelTesoro frasco, nuevoValorDelTesoro frasco 1)]}
elizabethSwann = Pirata { nombre ="", botin = [cofreMuerto, espada]}
tuner= Pirata { nombre ="Will Turner", botin = [cuchillo]}

------------------------------ BARCOS ---------------------------------------------------
perlaNegra = Barco {tripulacion = [jackSparrow,anneBonnny] , maneraDeSaquear = saqueoValioso }
holandésErrante = Barco {tripulacion = [davidJones] , maneraDeSaquear = pirataConCorazon }

------------------------------ Isla ---------------------------------------------------
tortugas = (tesoroNuevo (nombreDelTesoro frasco) 1, "Isla Tortuga",5)
ronIsland =(ron, "Isla del Ron", 5)

--tortugas = frasco
--ronIsland = ron
nombreDeLaIsla :: Isla -> String
nombreDeLaIsla (_,nombreIsla,_)= nombreIsla 

tesoroDelaIsla :: Isla -> Tesoro
tesoroDelaIsla (tesoroIsla,_,_)= tesoroIsla 

cantidadDeTesorosIsla :: Isla -> Int
cantidadDeTesorosIsla (_,_,cantidad)= cantidad

elSaqueo :: Barco -> Saqueo
elSaqueo unBarco = maneraDeSaquear unBarco 

cantidadDeTesoros :: Pirata -> Int
cantidadDeTesoros = length. botinDelTesoro 


cantidadTotaldeTesoros :: Pirata -> Int
cantidadTotaldeTesoros = sum . botinDelTesoro

esAfortunado :: Pirata -> Bool
esAfortunado = (>10000) .cantidadTotaldeTesoros 

nuevaTripulacion unaTripulacion unBarco= unBarco {tripulacion = unaTripulacion} 
subeTripulante unPirata unBarco= nuevaTripulacion (unPirata: tripulacion unBarco) unBarco 
bajaTripulante unPirata unBarco= filter ((/=)unPirata) (tripulacion unBarco)


adquirirUnTesoroNuevo unTesoro unPirata = nuevoBotin (unTesoro : botin unPirata) unPirata

--Si dos piratas tienen un mismo tesoro, pero de valor diferente
botinEnComun unPirata otroPirata = intersect (botin unPirata) (botin otroPirata) 
tienenTesoroenComún unPirata otroPirata = intersect (nombresDelbotin unPirata) (nombresDelbotin otroPirata)  
tesoroenComúnDistintoValor unPirata otroPirata =  length (tienenTesoroenComún unPirata otroPirata) /= 0 && length (botinEnComun unPirata otroPirata) == 0

--									
masValioso = maximum.botinDelTesoro

concatenar (lista : otrasListas) = lista ++ concatenar otrasListas


sacarTesorosValiosos unPirata= unPirata  {botin = filter (not. esValioso) (botin unPirata)}

esValioso unTesoro  = 100 > (valorDelTesoro unTesoro) 

sacarTesoroEspecifico unNombre unPirata = filter ((/=)unNombre) (nombresDelbotin unPirata)


saqueoValioso :: Saqueo
saqueoValioso unTesoro unPirata | esValioso unTesoro =  adquirirUnTesoroNuevo unTesoro unPirata
								| otherwise = unPirata


claveDelTesoro unaClave unTesoro =  nombreDelTesoro unTesoro == unaClave


saqueoEspecifico :: String -> Saqueo
saqueoEspecifico unaClave unTesoro unPirata | claveDelTesoro unaClave unTesoro = adquirirUnTesoroNuevo unTesoro unPirata
											| otherwise = unPirata

pirataConCorazon :: Saqueo
pirataConCorazon unTesoro unPirata = unPirata


saquear :: Pirata -> (Saqueo) -> Tesoro -> Pirata
saquear unPirata unSaqueo unTesoro = (unSaqueo unTesoro) unPirata


alcanzanLosTesoros :: Isla -> Int -> Bool
alcanzanLosTesoros = (>=) .cantidadDeTesorosIsla 


anclarEnIslaDeshabitada :: Isla -> Barco -> Bool
anclarEnIslaDeshabitada unaIsla = alcanzanLosTesoros unaIsla . (laTripulacion) 


anclarEnIsla :: Barco -> Isla -> [Pirata]
anclarEnIsla unBarco unaIsla = map (adquirirUnTesoroNuevo (tesoroDelaIsla unaIsla)) (tripulacion unBarco)

--maneraDeSaquear unBarco)  (tesoroDelaIsla unaIsla))
--anclarIslaDeshabitada::Barco->Isla->Barco
--anclarIslaDeshabitada (Barco pir fma) (Isla obj nom) = Barco (agregarVariosTesoros pir obj) fma
--
