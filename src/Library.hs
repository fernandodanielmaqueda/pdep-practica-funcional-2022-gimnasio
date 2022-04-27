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
<<<<<<< HEAD
gimnastaDePrueba = Gimnasta 20 70 10
=======
gimnastaDePrueba = prueba
--gimnastaDePrueba = Gimnasta 17 10 15
>>>>>>> 75af59189856936d62a059ecceb3a5a8027ac03a

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