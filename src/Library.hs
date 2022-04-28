module Library where

type Calorias = Int
type Kilos = Int
type Minutos = Int
type Velocidad = Int
type Inclinacion = Int
type Tonificacion = Int

---------------------------
-- Precalentamiento
---------------------------

-- Declarar el tipo de dato Gimnasta
relax :: Int -> Gimnasta -> Gimnasta
-- Explicitar el tipo de esta función en base al uso esperado:
relax _ gimnasta = gimnasta

-- Declarar la constante gimnastaDePrueba de tipo Gimnasta
-- para usarlo desde las pruebas (Spec.hs) y/o desde la consola
data Gimnasta = Gimnasta {
    edad :: Int,
    peso :: Int,
    tonificacion :: Int
} deriving(Show, Eq)

gimnastaDePrueba :: Gimnasta
gimnastaDePrueba = Gimnasta {
    edad = 15,
    peso = 200,
    tonificacion = 12
}

-- Otra forma de declararlo:
--gimnastaDePrueba :: Gimnasta
--gimnastaDePrueba = Gimnasta {tonificacion = 3, edad = 30, peso = 75}

-------------------------------------
-- Punto 1: Gimnastas saludables
-------------------------------------
esObeso :: Gimnasta -> Bool
esObeso = (> 100).peso

estaTonificado :: Gimnasta -> Bool
estaTonificado = (> 5).tonificacion

estaSaludable :: Gimnasta -> Bool
estaSaludable gimnasta = ((not.esObeso) gimnasta) && (estaTonificado gimnasta)

---------------------------
-- Punto 2: Quemar calorías
---------------------------
quemarCalorias :: Calorias -> Gimnasta -> Gimnasta
quemarCalorias caloriasQuemadas gimnasta
 | (esObeso gimnasta) = bajarKilos (caloriasQuemadas `div` 150) gimnasta
 | (((not.esObeso) gimnasta) && ((edad gimnasta) > 30) && (caloriasQuemadas > 200)) = bajarKilos 1 gimnasta
 | otherwise = bajarKilos (caloriasQuemadas `div` (peso gimnasta * edad gimnasta)) gimnasta

bajarKilos :: Kilos -> Gimnasta -> Gimnasta
bajarKilos kilosBajados gimnasta = gimnasta {peso = peso gimnasta - kilosBajados}
---------------------------
-- Punto 3: Ejercicios
---------------------------
pesas :: Kilos -> Minutos -> Gimnasta -> Gimnasta
pesas kilosLevantados minutos gimnasta
 | (minutos > 10) = tonificar (kilosLevantados `div` 10) gimnasta
 | otherwise = gimnasta

tonificar :: Tonificacion -> Gimnasta -> Gimnasta
tonificar tonificado gimnasta = gimnasta {tonificacion = tonificacion gimnasta + tonificado}

ejercicioEnCinta :: Velocidad -> Minutos -> Gimnasta -> Gimnasta
ejercicioEnCinta = (quemarCalorias.).(*)

caminataEnCinta :: Minutos -> Gimnasta -> Gimnasta
caminataEnCinta = ejercicioEnCinta velocidadPromedio
    where
        velocidadPromedio = 5

entrenamientoEnCinta :: Minutos -> Gimnasta -> Gimnasta
entrenamientoEnCinta minutos = ejercicioEnCinta velocidadPromedio minutos
    where
        velocidadInicial = 6
        velocidadFinal = velocidadInicial + minutos `div` 5
        velocidadPromedio = (velocidadInicial + velocidadFinal) `div` 2

colina :: Minutos -> Inclinacion -> Gimnasta -> Gimnasta
colina = ((quemarCalorias.(2*)).).(*)

montania :: Minutos -> Inclinacion -> Gimnasta -> Gimnasta
montania minutosTotales inclinacionInicial = (tonificar 1).(colina (minutosTotales `div` 2) (inclinacionInicial + 3)).colina (minutosTotales `div` 2) inclinacionInicial