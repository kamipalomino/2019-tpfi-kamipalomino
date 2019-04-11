{-Tesoros piratas
Lo más importante para un pirata son los tesoros. Ellos saquean ciudades y tienen aventuras en busca de tesoros cada vez más valiosos.
Cada pirata tiene un nombre y un botín (conjunto de tesoros que ya posee). De los tesoros solo les importa su nombre y valor.
 
Se quiere saber
La cantidad de tesoros de un pirata
Si un pirata es afortunado, lo cual es cierto si el valor total de su botín supera los 10000.
Si dos piratas tienen un mismo tesoro, pero de valor diferente
El valor del tesoro más valioso de un pirata.
Como queda el pirata luego de adquirir un nuevo tesoro
Como queda el pirata luego de perder todos los tesoros valiosos, que son los que tienen un valor mayor a 100.
Como queda el pirata luego de perder todos los tesoros con un nombre dado.


Temporada de saqueos
Los piratas trabajan saqueando, pero no siempre lo hacen de la misma forma. Existen manera de particular de elegir los tesoros que quieren saquear, que puede ser alguna de las siguientes:
●     Sólo los tesoros valiosos.
●     Tesoros con objetos específicos, es decir, sólo tesoros cuyo nombre sea una palabra clave.
●     Existen los piratas con corazón que no saquean nada.
●     Existe una forma más compleja que consiste en una conjunción de las anteriores. Esto significa que se quedan con los tesoros que cumplan al menos una de entre un conjunto de maneras se saquear.
Modelar las maneras de saqueo mencionadas y hacer la función saquear, que dado un pirata, una forma de saqueo y un tesoro, devuelve al pirata con el nuevo tesoro, en caso que sea de su preferencia. 
 
Probar diferentes combinaciones de piratas, tesoros y formas de saquear. Por ejemplo, con un mismo tesoro de oro valuado en 100, ver qué pasa si lo quiere saquear:
Anne Bonny, con una manera de saquear que con consiste en buscar “oro”.
David Jones, que no le interese saquear nada (solo le importa el amor).
Jack Sparrow, con una forma de saquear que es una combinación de cosas valiosas y tesoros con nombre “sombrero”.


-}

type Nombre = String
type Valor = Int

data Tesoro = Tesosro {
  nombreDelTesoro :: Nombre,
  valorDelTesoro :: Valor
} deriving Show 
data Pirata = Pirata {
    nombre :: Nombre,
    botin :: [Tesoro]
  } deriving Show
  
brujula = Tesoro { nombreDelTesoro = "Brujula", valorDelTesoro = 10000 }
frasco = Tesoro { nombreDelTesoro = "Frasco de Arena", valorDelTesoro = 0 }
cajitaMusica =  Tesoro { nombreDelTesoro= "Cajita musical", valorDelTesoro = 1}
doblones = Tesoro { nombreDelTesoro = "Doblones", valorDelTesoro = 100 }


jackSparrow = Pirata { nombre = "Jack Sparrow", botin = [brujula, frasco]}
davidJones = Pirata { nombre = "David Jones", botin = [cajitaMusuca]}

valorTesoro 1 frasco = frasco {valorDelTesoro = 1} 

anneBonnny = Pirata {nombre = "Anne Bonny", botin = [doblones, frasco]}


nuevoNombre  unNombre  unPirata = unPirata {nombre      = unNombre}
nuevoNombreDeTesoro unNombre unTesoro = unTesoro {nombreDelTesoro = unNombre}
valorTesoro unValor unTesoro = unTesoro {valorDelTesoro  =unValor}


cantidadDeTesoros unPirata = (length botin) unPirata
