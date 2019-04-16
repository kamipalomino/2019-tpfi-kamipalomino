
{-# LANGUAGE NoMonomorphismRestriction #-}
import Text.Show.Functions 
import Data.Maybe
import Data.List


--Cada pirata tiene un nombre y un botín (conjunto de tesoros que ya posee). De los tesoros solo les importa su nombre y valor.

--Probar diferentes combinaciones de piratas, tesoros y formas de saquear. Por ejemplo, con un mismo tesoro de oro valuado en 100, ver qué pasa si lo quiere saquear:
--Anne Bonny, con una manera de saquear que con consiste en buscar “oro”.
--David Jones, que no le interese saquear nada (solo le importa el amor).
--Jack Sparrow, con una forma de saquear que es una combinación de cosas valiosas y tesoros con nombre “sombrero”.

type Nombre = String
type Valor = Int
type Tesoro = (String, Int)
type Saqueo = Tesoro -> Pirata -> Pirata



data Pirata = Pirata {
    nombre :: Nombre,
    botin :: [Tesoro]
  } deriving (Show, Eq)



valorDelTesoro = snd 
nuevoValorDelTesoro (_,valorDelTesoro) unValor= unValor

nombreDelTesoro = fst 

--configcualEselNombreDelTesoro unValor = find (valorDelTesoro, unValor) 
nombreDelTesoroNuevo (nombreDelTesoro,_) unNombre = unNombre

oro = ("Oro", 101)
frasco = ("Frasco de Arena", 0)
cajitaMusical =  ("Cajita musical", 1)
doblones = ("Doblones", 100)
brujula = ("Brújula", 10000)

jackSparrow = Pirata { nombre = "Jack Sparrow", botin = [brujula, frasco]}
davidJones = Pirata { nombre = "David Jones", botin = [cajitaMusical, doblones]}
anneBonnny = Pirata {nombre = "Anne Bonny", botin = [doblones, (nombreDelTesoro frasco, nuevoValorDelTesoro frasco 1)]}


nuevoNombre  unNombre  unPirata = unPirata {nombre      = unNombre}
nuevoBotin unBotin unPirata = unPirata {botin = unBotin}

nombresDelbotin = map nombreDelTesoro.(botin)
botinDelTesoro  = map valorDelTesoro.(botin)

cantidadDeTesoros = length. botinDelTesoro 
cantidadTotaldeTesoros = sum . botinDelTesoro
esAfortunado unPirata = 10000 < cantidadTotaldeTesoros unPirata

tesoroNuevo:: String -> Int -> Tesoro
tesoroNuevo unNombre unValor = (unNombre, unValor) 

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

--Como queda el pirata luego de perder todos los tesoros con un nombre dado.


--Los piratas trabajan saqueando, pero no siempre lo hacen de la misma forma. Existen manera de particular de elegir los tesoros que quieren saquear, que puede ser alguna de las siguientes:
-- ●     Tesoros con objetos específicos, es decir, sólo tesoros cuyo nombre sea una palabra clave.
-- ●     Existen los piratas con corazón que no saquean nada.
-- ●     Existe una forma más compleja que consiste en una conjunción de las anteriores. Esto significa que se quedan con los tesoros que cumplan al menos una de entre un conjunto de maneras se saquear.
--unTesoro :: Tesoro
esValioso unTesoro  = 100 < (valorDelTesoro unTesoro) 

sacarTesoroEspecifico unNombre unPirata = filter ((/=)unNombre) (nombresDelbotin unPirata)

-- ●     Sólo los tesoros valiosos.
saqueoValioso :: Saqueo
saqueoValioso unTesoro unPirata | esValioso unTesoro =  adquirirUnTesoroNuevo unPirata unTesoro
								| otherwise = unPirata
claveDelTesoro unaClave unTesoro =  nombreDelTesoro unTesoro == unaClave

saqueoEspecifico :: String -> Saqueo
saqueoEspecifico unaClave unTesoro unPirata | claveDelTesoro unaClave unTesoro = adquirirUnTesoroNuevo unPirata unTesoro
											| otherwise = unPirata

pirataConCorazon unTesoro unPirata = unPirata

--unSaqueo  Saqueo 
--saquear unPirata unSaqueo unTesoro 	| saqueoValioso = saqueoValioso unTesoro unPirata
--									| pirataConCorazon = pirataConCorazon unTesoro unPirata
--									| otherwise = pirataConCorazon unTesoro unPirata

--saquear, que dado un pirata, una forma de saqueo y un tesoro, devuelve al pirata con el nuevo tesoro, en caso que sea de su preferencia. 
