module Library where

type Calorias = Int
type Kilos = Int
type Minutos = Int
type Inclinacion = Int
type Tonificacion = Int

---------------------------
-- Precalentamiento
---------------------------

-- Declarar el tipo de dato Gimnasta
relax :: Int -> Gimnasta -> Gimnasta
-- Explicitar el tipo de esta función en base al uso esperado:
relax minutos gimnasta = gimnasta

-- Declarar la constante gimnastaDePrueba de tipo Gimnasta
-- para usarlo desde las pruebas (Spec.hs) y/o desde la consola
data Gimnasta = Gimnasta {
    edad :: Int,
    peso :: Int,
    coefDeTonific :: Int
} deriving(Show, Eq)

prueba = Gimnasta { edad = 15,
    peso = 8,
    coefDeTonific = 12
}

gimnastaDePrueba :: Gimnasta
gimnastaDePrueba = prueba
--gimnastaDePrueba = Gimnasta 17 10 15

-------------------------------------
-- Punto 1: Gimnastas saludables
-------------------------------------
esObeso :: Gimnasta -> Bool
esObeso gimnasta = peso gimnasta > 100

estaTonificado :: Gimnasta -> Bool
estaTonificado gimnasta = coefDeTonific gimnasta > 5

estaSaludable :: Gimnasta -> Bool
estaSaludable gimnasta = (not (esObeso gimnasta)) && (estaTonificado gimnasta)

---------------------------
-- Punto 2: Quemar calorías
---------------------------
quemarCalorias :: Gimnasta -> Calorias -> Gimnasta
quemarCalorias gimnasta caloriasQuemadas
 | (esObeso gimnasta) = bajarKilos gimnasta (caloriasQuemadas `div` 150)
 | ((not (esObeso gimnasta)) && ((edad gimnasta) > 30) && (caloriasQuemadas > 200)) = bajarKilos gimnasta 1
 | otherwise = bajarKilos gimnasta (caloriasQuemadas `div` (peso gimnasta * edad gimnasta))

bajarKilos :: Gimnasta -> Kilos -> Gimnasta
bajarKilos gimnasta kilosABajar = (Gimnasta (edad gimnasta) ((peso gimnasta) - kilosABajar) (coefDeTonific gimnasta))
---------------------------
-- Punto 3: Ejercicios
---------------------------
pesas :: Gimnasta -> Kilos -> Minutos -> Gimnasta
pesas gimnasta kilosALevantar minutos
 | (minutos > 10) = tonificar (kilosALevantar `div` 10) gimnasta
 | otherwise = gimnasta

tonificar :: Tonificacion -> Gimnasta -> Gimnasta
tonificar tonificado gimnasta = (Gimnasta (edad gimnasta) (peso gimnasta) ((coefDeTonific gimnasta) + tonificado))

caminataEnCinta :: Gimnasta -> Minutos -> Gimnasta
caminataEnCinta gimnasta minutos = quemarCalorias gimnasta (5 * minutos)

entrenamientoEnCinta :: Gimnasta -> Minutos -> Gimnasta
entrenamientoEnCinta gimnasta minutos = quemarCalorias gimnasta (((6 + 6 + (minutos `div` 5)) `div` 2) * minutos) -- Velocidad inicial + Velocidad final / 2 = Velocidad Promedio

colina  :: Minutos -> Inclinacion -> Gimnasta -> Gimnasta
colina minutos inclinacion gimnasta = quemarCalorias gimnasta (2 * minutos * inclinacion)

montania  :: Gimnasta -> Minutos -> Inclinacion -> Gimnasta
montania gimnasta minutosTotales inclinacion = ((tonificar 1).(colina (minutosTotales `div` 2) (inclinacion + 3)).colina (minutosTotales `div` 2) inclinacion) gimnasta

{-
Ejercicios en cinta 🏃
Cualquier ejercicio que se haga en una cinta quema calorías en función de la velocidad promedio alcanzada durante el ejercicio, quemando 1 caloría por la velocidad promedio por minuto.

La caminata es un ejercicio en cinta con velocidad constante de 5 km/h.
El entrenamiento en cinta arranca en 6 km/h y cada 5 minutos incrementa la velocidad en 1 km/h, con lo cual la velocidad máxima dependerá de los minutos de entrenamiento.
-}