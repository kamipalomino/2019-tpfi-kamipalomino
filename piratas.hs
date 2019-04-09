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



-}

type Nombre = String
type Valor = Float
data Tesoro = Tesosro {
  nombreDelTesoro :: Nombre,
  valorDelTesoro :: Valor
} deriving Show 
data Pirata = Pirata {
    nombre :: Nombre,
    tesoro :: [Tesoro]
  } deriving Show
  
brujula = Tesoro { nombreDelTesoro = "Brujula", valorDelTesoro = 10000 }
frasco = Tesoro { nombreDelTesoro = "Frasco de Arena", valorDelTesoro = 0 }
frascoDeArena = Tesoro { nombreDelTesoro = "Frasco de Arena", valorDelTesoro = 1 }
cajitaMusica =  Tesoro { nombreDelTesoro= "Cajita musical", valorDelTesoro = 1}
doblones = Tesoro { nombreDelTesoro = "Doblones", valorDelTesoro = 100 }

jackSparrow = Pirata { nombre = "Jack Sparrow", tesoro = [brujula, frasco]
davidJones = Pirata { nombre = "David Jones", tesoro = [cajitaMusuca]}
anneBonnny = Pirata {nombre = "Anne Bonny", tesoro = [doblones, frascoDeArena]}
