
{-# LANGUAGE NoMonomorphismRestriction #-}
import Data.List
--Cada pirata tiene un nombre y un botín (conjunto de tesoros que ya posee). De los tesoros solo les importa su nombre y valor.

--Probar diferentes combinaciones de piratas, tesoros y formas de saquear. Por ejemplo, con un mismo tesoro de oro valuado en 100, ver qué pasa si lo quiere saquear:
--Anne Bonny, con una manera de saquear que con consiste en buscar “oro”.
--David Jones, que no le interese saquear nada (solo le importa el amor).
--Jack Sparrow, con una forma de saquear que es una combinación de cosas valiosas y tesoros con nombre “sombrero”.

type Nombre = String
type Valor = Int
type Tesoro = (String, Int)

data Pirata = Pirata {
    nombre :: Nombre,
    botin :: [Tesoro]
  } deriving (Show, Eq)



valorDelTesoro = snd 
nuevoValorDelTesoro (_,valorDelTesoro) unValor= unValor

nombreDelTesoro = fst 
cualEselNombreDelTesoro unValor = forall (valorDelTesoro, unValor) 
nombreDelTesoroNuevo (nombreDelTesoro,_) unNombre = unNombre


frasco = ("Frasco de Arena", 0)
cajitaMusical =  ("Cajita musical", 1)
doblones = ("Doblones", 100)
brujula = ("Brújula", 10000)

jackSparrow = Pirata { nombre = "Jack Sparrow", botin = [brujula, frasco]}
davidJones = Pirata { nombre = "David Jones", botin = [cajitaMusical, doblones]}
anneBonnny = Pirata {nombre = "Anne Bonny", botin = [doblones, (nombreDelTesoro frasco, nuevoValorDelTesoro frasco 1)]}


nuevoNombre  unNombre  unPirata = unPirata {nombre      = unNombre}
nuevoBotin unBotin unPirata = unPirata {botin = unBotin}

elBotin = botin
nombresDelbotin unPirata = map nombreDelTesoro (botin unPirata)
botinDelTesoro unPirata = map valorDelTesoro (botin unPirata)

cantidadDeTesoros unPirata = length (botinDelTesoro unPirata) 
cantidadTotaldeTesoros unPirata = sum (botinDelTesoro unPirata)
esAfortunado unPirata = 10000 < cantidadTotaldeTesoros unPirata

tesoroNuevo:: String -> Int -> Tesoro
tesoroNuevo unNombre unValor = (unNombre, unValor) 



--Como queda el pirata luego de adquirir un nuevo tesoro
adquirirUnTesoroNuevo unPirata unNombre unValor =  nuevoBotin (insert (tesoroNuevo unNombre unValor) (botin unPirata)) unPirata


--Si dos piratas tienen un mismo tesoro, pero de valor diferente
tienenTesoroenComún unPirata otroPirata = intersect (nombresDelbotin unPirata) (nombresDelbotin otroPirata)  
tesoroenComúnDistintoValor unPirata otroPirata =   (tienenTesoroenComún unPirata otroPirata) 

--										|otherwise


masValioso unPirata =  maximum  (botinDelTesoro unPirata)

concatenar (lista : otrasListas) = lista ++ concatenar otrasListas


--tesoroenComúnDistintoValor unPirata otroPirata = (botinDelTesoro unPirata /= botinDelTesoro otroPirata) . (tienenTesoroenComún unPirata otroPirata)

--tesoroenComúnDistintoValor unPirata otroPirata | tienenTesoroenComún unPirata otroPirata = (botinDelTesoro unPirata /= botinDelTesoro otroPirata)
--												|otherwise = False

--tesorosValiososo unPirata= filter esValioso (botin unPirata)

--Como queda esVl pirata luego de perder todos los tesoros valiosos, que son los que tienen un valor mayor a 100.
sacarTesorosValiosos unPirata= unPirata  {botin = filter (not. esValioso) (botin unPirata)}

--Como queda el pirata luego de perder todos los tesoros con un nombre dado.


--Los piratas trabajan saqueando, pero no siempre lo hacen de la misma forma. Existen manera de particular de elegir los tesoros que quieren saquear, que puede ser alguna de las siguientes:
-- ●     Tesoros con objetos específicos, es decir, sólo tesoros cuyo nombre sea una palabra clave.
-- ●     Existen los piratas con corazón que no saquean nada.
-- ●     Existe una forma más compleja que consiste en una conjunción de las anteriores. Esto significa que se quedan con los tesoros que cumplan al menos una de entre un conjunto de maneras se saquear.
--unTesoro :: Tesoro
esValioso unTesoro  = 100 < (valorDelTesoro unTesoro) 

tesoroEspecifico unNombre unPirata = find unNombre  (botin unPirata)


--sacarTesoroValioso unPirata =  forall (delete,  (tesorosValiosos unPirata) )

-- ●     Sólo los tesoros valiosos.
saqueoValioso unNombre unValor unPirata | esValioso (tesoroNuevo unNombre unValor) =  adquirirUnTesoroNuevo unPirata unNombre unValor
										| otherwise = unPirata

pirataConCorazon unTesoro unPirata = botin unPirata


--saquear unPirata unSaqueo unTesoro 	| unSaqueo == saqueoValioso = saqueoValioso unTesoro unPirata
--									| otherwise = pirataConCorazon unTesoro unPirata

--saquear, que dado un pirata, una forma de saqueo y un tesoro, devuelve al pirata con el nuevo tesoro, en caso que sea de su preferencia. 
