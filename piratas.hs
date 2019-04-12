
{-# LANGUAGE NoMonomorphismRestriction #-}
--Cada pirata tiene un nombre y un botín (conjunto de tesoros que ya posee). De los tesoros solo les importa su nombre y valor.
 
--Temporada de saqueos
--Los piratas trabajan saqueando, pero no siempre lo hacen de la misma forma. Existen manera de particular de elegir los tesoros que quieren saquear, que puede ser alguna de las siguientes:
-- ●     Sólo los tesoros valiosos.
-- ●     Tesoros con objetos específicos, es decir, sólo tesoros cuyo nombre sea una palabra clave.
-- ●     Existen los piratas con corazón que no saquean nada.
-- ●     Existe una forma más compleja que consiste en una conjunción de las anteriores. Esto significa que se quedan con los tesoros que cumplan al menos una de entre un conjunto de maneras se saquear.
--Modelar las maneras de saqueo mencionadas y hacer la función saquear, que dado un pirata, una forma de saqueo y un tesoro, devuelve al pirata con el nuevo tesoro, en caso que sea de su preferencia. 
 
--Probar diferentes combinaciones de piratas, tesoros y formas de saquear. Por ejemplo, con un mismo tesoro de oro valuado en 100, ver qué pasa si lo quiere saquear:
--Anne Bonny, con una manera de saquear que con consiste en buscar “oro”.
--David Jones, que no le interese saquear nada (solo le importa el amor).
--Jack Sparrow, con una forma de saquear que es una combinación de cosas valiosas y tesoros con nombre “sombrero”.

type Nombre = String
type Valor = Int
--type Tesoro = Int

data Tesoro = Tesoro {
  nombreDelTesoro :: Nombre,
  valorDelTesoro :: Valor
} deriving Show 
data Pirata = Pirata {
    nombre :: Nombre,
    botin :: [Tesoro]
  } deriving (Show)
  


valorTesoro :: Tesoro -> Int -> Tesoro
valorTesoro unTesoro unValor= unTesoro  {valorDelTesoro = unValor}


nombreDelTesoroNuevo :: Tesoro -> String -> Tesoro
nombreDelTesoroNuevo unTesoro unNombre= unTesoro {nombreDelTesoro = unNombre}


frasco = Tesoro { nombreDelTesoro = "Frasco de Arena", valorDelTesoro = 0 }
cajitaMusical =  Tesoro { nombreDelTesoro= "Cajita musical", valorDelTesoro = 1}
doblones = Tesoro { nombreDelTesoro = "Doblones", valorDelTesoro = 100 }
brujula = Tesoro { nombreDelTesoro = "Brújula", valorDelTesoro = 10000}

jackSparrow = Pirata { nombre = "Jack Sparrow", botin = [brujula, valorTesoro frasco 0]}
davidJones = Pirata { nombre = "David Jones", botin = [cajitaMusical]}
anneBonnny = Pirata {nombre = "Anne Bonny", botin = [doblones, valorTesoro frasco 1]}


nuevoNombre  unNombre  unPirata = unPirata {nombre      = unNombre}
--nuevoNombreDeTesoro unNombre unTesoro = unTesoro {nombreDelTesoro = unNombre}

--cantidadTotaldeTesoros :: Pirata -> [Valor] -> Int



--botinDelTesoro :: Pirata -> [Valor]
botinDelTesoro unPirata = map valorDelTesoro (botin unPirata)

cantidadTotaldeTesoros unPirata = length (botinDelTesoro unPirata) 

--esAfortunado unPirata = map . botinDelTesoro unPirata
--Si un pirata es afortunado, lo cual es cierto si el valor total de su botín supera los 10000.
--Si dos piratas tienen un mismo tesoro, pero de valor diferente
--El valor del tesoro más valioso de un pirata.
--Como queda el pirata luego de adquirir un nuevo tesoro
--Como queda el pirata luego de perder todos los tesoros valiosos, que son los que tienen un valor mayor a 100.
--Como queda el pirata luego de perder todos los tesoros con un nombre dado.
