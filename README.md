# Práctica de laboratorio: A Quemar Esas Grasitas

**ATENCIÓN:** Esta práctica no será corregida. Más allá del feedback que puedan tener durante la clase, el objetivo es que vean luego los videos con las puestas en común donde se discuten posibles soluciones para cada punto, para que puedan comparar con la solución a la que llegaron.

## Modalidad de trabajo :clipboard::lab_coat:

Para iniciar la práctica grupal trabajando con git, cada integrante del grupo deberá **clonar** este repositorio, con el comando:

`git clone urlParaClonarElRepo`.

Luego, asegúrense de abrir el VSCode sobre la carpeta raíz del proyecto, de modo que la terminal integrada se encuentre posicionada en el lugar correcto.

Este proyecto cuenta con 2 archivos relevantes (además del `README.md` que estás viendo):
- `src/Library.hs`: acá van las definiciones de funciones y tipos de datos que se piden para resolver la consigna.
- `test/Spec.hs`: acá se definen las pruebas automáticas.

En la medida en la que avancen sobre el ejercicio, recuerden **subir su solución a GitHub** con los comandos:
- `git add .` y `git commit -m "Mensaje que explica los cambios"` para versionar todos sus cambios
  > 💡 Alternativamente se pueden combinar ambas operaciones con el comando: `git commit -am "Mensaje que explica los cambios"`. La opción `-am` indica que se desean agregar los cambios sobre todos los archivos modificados al commit, además de indicar el mensaje a usar.
- `git push` para subir esos cambios a GitHub

Es importante hacer commits chicos y subir los cambios frecuentemente así todo el equipo tendrá acceso al trabajo realizado por el resto. Cada integrante podrá **actualizar su repo local** con los cambios más recientes que se hayan subido a GitHub con el comando `git pull`, lo cual incorporará todo lo que se haya subido y que no tengan a su copia del repositorio.

⚠️ **IMPORTANTE!** ⚠️ Dado que van a estar trabajando al mismo tiempo en varias máquinas, **asegúrense de usar el comando `git pull` luego de commitear y antes de pushear**. En caso de que ocurra un **conflicto** que git no resuelva automáticamente y no sepan cómo resolverlo, avisen al equipo docente para que les de una mano.

### Resumen para el flujo de trabajo:
1. Antes de hacer nuevos cambios, para asegurar tener el repo local actualizado: `git pull`
2. Luego de hacer cambios que están en condiciones de compartir con su equipo: `git commit -am "Mensaje que explica los cambios"`
3. Antes de intentar subir esos cambios: `git pull`
4. Finalmente subir a GitHub: `git push`
5. Cuando estén por empezar con nuevos cambios, volver al paso 1.

> Recomendación: cada vez que estén por empezar un punto, **leanlo completo**. Luego avancen de a poco, testeando a medida que trabajan sobre la solución, y suban sus cambios cuando los mismos funcionen como esperaban.

## Pruebas manuales y automáticas :white_check_mark:

Para probar el programa manualmente (desde la consola de Haskell) corré el comando: `stack ghci`. Para correr las pruebas automáticas corré el comando: `stack test`.

> ⚠️ Para probar el programa, ya sea manualmente o con las pruebas automáticas, el proyecto **tiene que compilar**. Los problemas de compilación, si los hay, los va a marcar el VSCode tanto en el editor como en la vista de **Problemas**.
>
> **El proyecto inicial tiene un problema de compilación que necesitan solucionar antes de poder correr el programa**, porque el tipo `Gimnasta` no está definido. Resolver ese problema forma parte del **precalentamiento**, que se describe más abajo.

### Testeo automático

Esta práctica es más abierta y les da lugar para definir sus propias pruebas automáticas en base a lo que sería esperable que pase al usar las funciones que definan de acuerdo a la consigna.

Además para los primeros puntos ya les proponemos qué testear, lo cual se indica en el título del test correspondiente.

Por ejemplo, si hubiera un test de este estilo:

```haskell
  it "Sumar 2 y 8 debería dar 10" $ do
    -- Cambiar esto por la consulta y el valor esperado real
    True `shouldBe` False
```

Se podría cambiar por algo así para validar lo que se pide:

```haskell
  it "Sumar 2 y 8 debería dar 10" $ do
    2 + 8 `shouldBe` 10
```

> Para más información sobre testing podés ver después de clase el [video de Fer Dodino sobre HSpec](https://www.youtube.com/watch?v=I3pJnW680Gw), y cómo se usan estas herramientas para desarrollar a partir de las pruebas automáticas (TDD).

## Dominio :mag:

Se desea desarrollar un sistema para un popular gimnasio que permita predecir el efecto de los ejercicios que realizarían sus socios con las máquinas que dispone. Las máquinas tienen ciertos ejercicios de fábrica (algunos son customizables), los cuales pueden realizarse durante una cantidad de minutos determinada, y sirven para tonificar músculos y/o quemar calorías.

De cada gimnasta nos interesa saber su edad, su peso y su coeficiente de tonificación.

> Para simplificar, representaremos esos valores con números enteros, por ese motivo cuando sea necesario hacer divisiones usaremos división entera `div`, para evitar problemas de tipos que no son relevantes a esta práctica.

Los ejercicios que se pueden hacer en el gimnasio **los modelaremos con funciones** que dada una cantidad de minutos y un gimnasta, retorna al gimnasta luego de realizar dicho ejercicio.

Un ejemplo simple de ejercicio en el cual el gimnasta no hace nada (y por ende queda igual que al principio sin importar cuánto tiempo lo realice) podría ser:

```haskell
relax minutos gimnasta = gimnasta
```

## Precalentamiento :hotsprings:

En el archivo `src/Library.hs` declarar el tipo de dato `Gimnasta` como creas conveniente, teniendo en cuenta que debe ser posible comparar dos gimnastas con la función `(==)`.

También se pide explicitar el tipo de la función `relax` y declarar una constante `gimnastaDePrueba` para poder probar el programa.

### Testing :white_check_mark:

Recordá que, luego de completar esta parte del ejercicio, el proyecto debería compilar y también debería dar verde la prueba de la sección **Precalentamiento**, donde se usa la función `relax` con el `gimnastaDePrueba` al correr `stack test`.

## Punto 1: Gimnastas saludables :ok_hand:

Necesitamos saber si alguien está saludable, lo cual se cumple si no está obeso y tiene una tonificación mayor a 5. Alguien es obeso si pesa más de 100 kilos.

En el archivo `src/Library.hs` definir las funciones para saber si alguien es obeso y si alguien está saludable.

### Testing :white_check_mark:

En el archivo `test/Spec.hs` escribir las consultas para probar tu solución y los resultados esperados de acuerdo al nombre de cada test, como se explica más arriba en la sección **Pruebas manuales y automáticas -> Testeo automático**.

> Dado que cada gimnasta a usar para las pruebas tiene que cumplir con condiciones distintas de las demás, lo más conveniente es crear el gimnasta directamente en el test, en vez de declarar una constante como hiciste con `gimnastaDePrueba` para el primer test que ya venía definido.
>
> Lo mismo aplica para los puntos siguientes, te va a simplificar mucho pensar las pruebas de forma independiente, sin tener que recordar detalles sobre datos de prueba que armaste para otro próposito.
 
## Puesta en común #1

En [este video](https://www.youtube.com/watch?v=wRygZMNpH0E) se explica la primer parte de esta práctica, incluyendo algunas variantes para encarar el punto 1.

## Punto 2: Quemar calorías :sweat_drops:

Hacer que una función para que un gimnasta queme una cantidad de calorías, y en consecuencia, que baje de peso.

* Si el gimnasta es obeso, baja 1 kilo cada 150 calorías quemadas.
* Si no es obeso pero tiene más de 30 años y las calorías quemadas son más de 200, baja siempre un kilo.
* En cualquier otro caso se baja la cantidad de calorías quemadas dividido por el producto entre el peso y la edad del gimnasta.

### Testing :white_check_mark:

En el archivo `test/Spec.hs` escribir los tests que creas convenientes para este punto, dentro de un nuevo describe con título `"Punto 2: Quemar calorías"`.

> Para pensar :thought_balloon: ¿cuántos casos de prueba podrían ser necesarios para validar todos los caminos posibles?

## Punto 3: Ejercicios :bicyclist:

Ahora sí, a quemar esas grasitas!

Desarrollar las funciones `pesas`, `caminataEnCinta`, `entrenamientoEnCinta`, `colina` y `montania` sabiendo que queremos usarlas para que un gimnasta ejercite.

### Levantar pesas  :muscle:

Las **pesas** tonifican la décima parte de los kilos a levantar si se realiza por más de 10 minutos, sino nada.

### Ejercicios en cinta  :running:

Cualquier ejercicio que se haga en una cinta quema calorías en función de la velocidad promedio alcanzada durante el ejercicio, quemando 1 caloría por la velocidad promedio por minuto.

* La **caminata** es un ejercicio en cinta con velocidad constante de 5 km/h.
* El **entrenamiento en cinta** arranca en 6 km/h y cada 5 minutos incrementa la velocidad en 1 km/h, con lo cual la velocidad máxima dependerá de los minutos de entrenamiento.

### Escalar :mount_fuji:

La **colina** quema 2 calorías por minuto multiplicado por la inclinación de la colina.

La **montaña** son 2 colinas sucesivas (cada una con la mitad de duración respecto de los minutos totales indicados), donde la segunda colina tiene una inclinación de 3 más que la inclinación inicial elegida. Además de hacer perder peso por las calorías quemadas por las colinas, este ejercicio incrementa en una unidad la tonificación del gimnasta.

### Testing :white_check_mark:

Al igual que para el punto anterior, en el archivo `test/Spec.hs` escribir los tests que creas convenientes para este punto, definiendo un nuevo describe con título `"Punto 3: Ejercicios"`.

Hacé al menos un test para cada una de las funciones `pesas`, `caminataEnCinta`, `entrenamientoEnCinta`, `colina` y `montania` que te parezca interesante. Obviamente si encontrás más ejemplos relevantes para testear, podés definir tantos tests como quieras.

> Sobre todo para este punto, no dejes los tests para el final, acompañá el desarrollo con las pruebas. El desarrollo de software es un proceso iterativo. Si sólo hacés una iteración, todo se vuelve cuesta arriba :sweat_smile:

## Puesta en común #2

En [este video](https://www.youtube.com/watch?v=LApMSiF_fO8) se presenta una posible solución para los puntos 2 y 3.
