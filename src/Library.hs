module Library where

---------------------------
-- Precalentamiento
---------------------------

-- Declarar el tipo de dato Gimnasta
data Gimnasta = Gimnasta {
    edad :: Int,
    peso :: Int,
    coeficiente :: Int
} deriving(Eq, Show)

-- Explicitar el tipo de esta función en base al uso esperado:
relax :: Int-> Gimnasta -> Gimnasta
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
gimnastaDePrueba = Gimnasta 20 70 10

-------------------------------------
-- Punto 1: Gimnastas saludables
-------------------------------------

estaObeso gimnasta= peso gimnasta>100
esSaludable gimnasta= not(estaObeso gimnasta) && coeficiente gimnasta>5

---------------------------
-- Punto 2: Quemar calorías
---------------------------


---------------------------
-- Punto 3: Ejercicios
---------------------------