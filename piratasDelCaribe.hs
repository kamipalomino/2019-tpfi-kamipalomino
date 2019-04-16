
{-# LANGUAGE NoMonomorphismRestriction #-}
import Text.Show.Functions 
import Data.Maybe
import Data.List


--Probar diferentes combinaciones de piratas, tesoros y formas de saquear. Por ejemplo, con un mismo tesoro de oro valuado en 100, ver qué pasa si lo quiere saquear:
--Jack Sparrow, con una forma de saquear que es una combinación de cosas valiosas y tesoros con nombre “sombrero”.


type Nombre = String
type Valor = Int
type Tesoro = (String, Int)
type Saqueo = Tesoro -> Pirata -> Pirata

data Barco = Barco {
	tripulación :: [Pirata],
	maneraDeSaquear :: Saqueo
} deriving (Show)

data Pirata = Pirata {
    nombre :: Nombre,
    botin :: [Tesoro]
  } deriving (Show, Eq)


tesoroNuevo:: String -> Int -> Tesoro
tesoroNuevo unNombre unValor = (unNombre, unValor) 

nombreDelTesoro = fst 
valorDelTesoro = snd

nuevoValorDelTesoro  (_,valorDelTesoro) unValor= unValor

nuevoPirata  unNombre  unPirata = unPirata {nombre      = unNombre}
nuevoBotin unBotin unPirata = unPirata {botin = unBotin}

nombresDelbotin = map nombreDelTesoro.(botin)
botinDelTesoro  = map valorDelTesoro.(botin)



------------------------------ TESOROS ---------------------------------------------------
oro = ("Oro", 101)
frasco = ("Frasco de Arena", 0)
cajitaMusical =  ("Cajita musical", 1)
doblones = ("Doblones", 100)
brujula = ("Brújula", 10000)
cofreMuerto = ("Cofre muerto", 100)
espada = ("Espada de hierro", 50)
cuchillo = ("Cuchillo", 5)
------------------------------ PIRATAS ---------------------------------------------------

jackSparrow = Pirata { nombre = "Jack Sparrow", botin = [brujula, frasco]}
davidJones = Pirata { nombre = "David Jones", botin = [cajitaMusical, doblones]}
anneBonnny = Pirata {nombre = "Anne Bonny", botin = [doblones, (nombreDelTesoro frasco, nuevoValorDelTesoro frasco 1)]}
elizabethSwann = Pirata { nombre ="", botin = [cofreMuerto, espada]}
tuner= Pirata { nombre ="Will Turner", botin = [cuchillo]}

------------------------------ BARCOS ---------------------------------------------------
perlaNegra = Barco {tripulación = [jackSparrow,anneBonnny] , maneraDeSaquear = saqueoValioso }
holandésErrante = Barco {tripulación = [davidJones] , maneraDeSaquear = pirataConCorazon }




cantidadDeTesoros = length. botinDelTesoro 
cantidadTotaldeTesoros = sum . botinDelTesoro
esAfortunado unPirata = 10000 < cantidadTotaldeTesoros unPirata

nuevaTripulacion unaTripulacion unBarco= unBarco {tripulación = unaTripulacion} 
subeTripulante unPirata unBarco= nuevaTripulacion (unPirata: tripulación unBarco) unBarco 
bajaTripulante unPirata unBarco= filter ((/=)unPirata) (tripulación unBarco)


adquirirUnTesoroNuevo unPirata unTesoro =  nuevoBotin (unTesoro : botin unPirata) unPirata

--Si dos piratas tienen un mismo tesoro, pero de valor diferente
botinEnComun unPirata otroPirata = intersect (botin unPirata) (botin otroPirata) 
tienenTesoroenComún unPirata otroPirata = intersect (nombresDelbotin unPirata) (nombresDelbotin otroPirata)  
tesoroenComúnDistintoValor unPirata otroPirata =  length (tienenTesoroenComún unPirata otroPirata) /= 0 && length (botinEnComun unPirata otroPirata) == 0

--									
masValioso = maximum.botinDelTesoro

concatenar (lista : otrasListas) = lista ++ concatenar otrasListas


--Como queda esVl pirata luego de perder todos los tesoros valiosos, que son los que tienen un valor mayor a 100.
sacarTesorosValiosos unPirata= unPirata  {botin = filter (not. esValioso) (botin unPirata)}

esValioso unTesoro  = 100 < (valorDelTesoro unTesoro) 

sacarTesoroEspecifico unNombre unPirata = filter ((/=)unNombre) (nombresDelbotin unPirata)


saqueoValioso :: Saqueo
saqueoValioso unTesoro unPirata | esValioso unTesoro =  adquirirUnTesoroNuevo unPirata unTesoro
								| otherwise = unPirata
claveDelTesoro unaClave unTesoro =  nombreDelTesoro unTesoro == unaClave

saqueoEspecifico :: String -> Saqueo
saqueoEspecifico unaClave unTesoro unPirata | claveDelTesoro unaClave unTesoro = adquirirUnTesoroNuevo unPirata unTesoro
											| otherwise = unPirata
pirataConCorazon :: Saqueo
pirataConCorazon unTesoro unPirata = unPirata

--unSaqueo  Saqueo 
--saquear unPirata unSaqueo unTesoro 	| saqueoValioso = saqueoValioso unTesoro unPirata
--									| pirataConCorazon = pirataConCorazon unTesoro unPirata
--									| otherwise = pirataConCorazon unTesoro unPirata

--saquear, que dado un pirata, una forma de saqueo y un tesoro, devuelve al pirata con el nuevo tesoro, en caso que sea de su preferencia. 
