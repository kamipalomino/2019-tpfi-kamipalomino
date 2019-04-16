# Trabajo práctico "Piratas del caribe"
## Paradigma Funcional

# Piratas del Caribe

_¡Un grupo de piratas ha tomado la facultad! Y nos piden hacer un programa funcional para planear sus ataques y saqueos._

 
## Tesoros piratas 

_Lo más importante para un pirata son los tesoros. Ellos saquean ciudades y tienen aventuras en busca de tesoros cada vez más valiosos.
Cada pirata tiene un nombre y un botín (conjunto de tesoros que ya posee). De los tesoros solo les importa su nombre y valor._


#### Se quiere saber 📋

	* La cantidad de tesoros de un pirata
	* Si un pirata es afortunado, lo cual es cierto si el valor total de su botín supera los 10000.
	* Si dos piratas tienen un mismo tesoro, pero de valor diferente
	* El valor del tesoro más valioso de un pirata.
	* Como queda el pirata luego de adquirir un nuevo tesoro
	* Como queda el pirata luego de perder todos los tesoros valiosos, que son los que tienen un valor mayor a 100.
	* Como queda el pirata luego de perder todos los tesoros con un nombre dado.

> Definir por ejemplo a los siguientes piratas

```
- Jack Sparrow: Su botín está compuesto por una brújula que apunta lo que más deseas valuada en 10000 y un frasco de arena valuado en 0.
- David Jones: Su único tesoro es una cajita musical valuada en 1.
- Anne Bonny: Su botín son doblones que valen 100 y un frasco de arena que vale 1.
```

## Temporada de saqueos  :moneybag:

_Los piratas trabajan saqueando, pero no siempre lo hacen de la misma forma. Existen manera de particular de elegir los tesoros que quieren saquear, que puede ser alguna de las siguientes:_

	● Sólo los tesoros valiosos.
	● Tesoros con objetos específicos, es decir, sólo tesoros cuyo nombre sea una palabra clave.
	● Existen los piratas con corazón que no saquean nada.
	● Existe una forma más compleja que consiste en una conjunción de las anteriores. Esto significa que se quedan con los tesoros que cumplan al menos una de entre un conjunto de maneras se saquear.
  
_Modelar las maneras de saqueo mencionadas y hacer la función saquear, que dado un pirata, una forma de saqueo y un tesoro, devuelve al pirata con el nuevo tesoro, en caso que sea de su preferencia._ 
 
_Probar diferentes combinaciones de piratas, tesoros y formas de saquear. Por ejemplo, con un mismo tesoro de oro valuado en 100, ver qué pasa si lo quiere saquear:_

```
	● Anne Bonny, con una manera de saquear que con consiste en buscar “oro”.
	● David Jones, que no le interese saquear nada (solo le importa el amor).
	● Jack Sparrow, con una forma de saquear que es una combinación de cosas valiosas y tesoros con nombre “sombrero”.
```

## Navegando los siete mares  :ocean:

_Los piratas se juntan para armar una tripulación que viaja en barco recorriendo los mares en busca de nuevos tesoros. Cada barco se caracteriza por una manera de saquear, que utilizan todos sus tripulantes._

> Hacer funciones para representar que:
	__Un pirata se incorpora a la tripulación de un barco__
	__Un pirata abandona la tripulación de un barco__

_Por ejemplo:_
```
	● La tripulación del Perla Negra está compuesta por Jack Sparrow y Anne Bonny
	● La tripulación del Holandés Errante está compuesta por David Jones.
	● Elizabeth Swann, que posee una moneda del cofre muerto valuada en 100 y una espada de hierro que vale 50, se suma a la tripulación del Perla Negra.  
	● Will Turner, con un cuchillo que le regaló el padre valuado en 5, también se sube al Perla Negra, pero luego abandona el barco.
```
 ###### Mientras va navegando, a un barco le pueden pasar diferentes cosas y hay que averiguar cómo queda luego de cada una de ellas:  :anchor:
	
	- Anclar en una isla deshabitada: cuando llega a una isla todos los miembros de la tripulación toman como tesoro un elemento típico de la isla, del que hay en abundancia para que todos los piratas puedan tener uno. Por ejemplo, puede estar la Isla Tortuga, que es muy pequeña y en la que todos los piratas se hacen de un frasco de arena de valor 1 y la Isla del Ron, donde alguna vez hubo un depósito de provisiones y todos los piratas de la tripulación se llevan una botella de ron valuada en 25. 

	- Atacar una ciudad: Cuando el barco llega a una ciudad costera en la que hay muchos tesoros, luego de derrotar a las pobladores, los piratas saquean los tesoros existentes. 

_Generalmente hay más tesoros que piratas. Por orden de llegada, a cada pirata le toca un tesoro. En caso que el tesoro que le toca a un pirata no sea acorde a la manera de saquear del barco, no pasa nada, simplemente ese pirata no acrecienta su botín. Seguramente van a quedar tesoros sin saquear, pero no es de nuestro interés modelar cómo queda la ciudad._

_A veces ocurre que la ciudad es muy pobre o la tripulación del barco muy numerosa, de manera que no hay suficientes tesoros para todos los piratas, lo cual es un problema. En ese caso, los primeros piratas saquean los tesoros existentes, siempre de acuerdo a la manera de saquear del barco, y los restantes piratas son bajados de la embarcación y abandonados en la ciudad._

> Abordar otro barco en alta mar. ¿Qué le pasa a un barco pirata cuando va navegando y se cruza con otro barco? Inventar una función que lo represente adecuadamente. 


## Hacete toda la película...  :movie_camera:
_Hacer una serie de pruebas sobre el argumento de la película. Se recomienda comenzar con escenas sueltas y luego irlas encadenando para representar el desarrollo de la saga. A la vez ir analizando cómo van quedando los piratas.
Un desafío interesante es encontrar una serie de circunstancias que lleven a cierto objetivo, por ejemplo lograr que Jack Sparrow termine la película siendo un pirata afortunado._

_Por ejemplo, algunos casos de prueba pueden ser:_
```
	● La tripulación del Perla Negra desembarca en la IslaDelRon y todos se llevan una botella.
	● El Perla Negra ataca Port Royal, donde hay muchos tesoros.
	● El Holandes Errante pasa por la Isla Tortuga y luego hace un largo viaje para atacar Carmen de Patagones, donde hay pocos tesoros.
	● El Perla Negra aborda al Holandes Errante
```

### Consigna :book:

* [DOCUMENTO](https://docs.google.com/document/d/1g5INP01q205eudW-EUZh4huid27yRwBdKDcAoYtUIeE/edit?usp=sharing) - Drive de las consignas 

### Integrante ✒️

> * **Camila Palomino** [kamipalomino](https://github.com/kamipalomino)

⌨️ 
