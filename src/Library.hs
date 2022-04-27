module Library where

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
    coeficienteDeTonificacion :: Int
} deriving(Show, Eq)

prueba = Gimnasta {
    edad = 15,
    peso = 10,
    coeficienteDeTonificacion = 12
}

gimnastaDePrueba :: Gimnasta
gimnastaDePrueba = prueba
--gimnastaDePrueba = Gimnasta 17 10 15

-------------------------------------
-- Punto 1: Gimnastas saludables
-------------------------------------


---------------------------
-- Punto 2: Quemar calorías
---------------------------


---------------------------
-- Punto 3: Ejercicios
---------------------------