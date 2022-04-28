import Library
import Test.Hspec

main :: IO ()
main = hspec $ do
    describe "Precalentamiento" $ do
        it "El ejercicio relax no impacta al gimnasta" $ do
           relax 60 gimnastaDePrueba `shouldBe` gimnastaDePrueba

    describe "Punto 1: Gimnastas saludables" $ do
        it "Un gimnasta que pesa más de 100 kilos es obeso" $ do
            esObeso (Gimnasta 0 101 0) `shouldBe` True
        it "Un gimnasta que pesa 100 kilos o menos no es obeso" $ do
            esObeso (Gimnasta 0 100 0) `shouldBe` False
        it "Un gimnasta con tonificación menor o igual a 5 que no es obeso no está saludable" $ do
            estaSaludable (Gimnasta 0 50 5) `shouldBe` False
        it "Un gimnasta con tonificación mayor a 5 que no es obeso está saludable" $ do
            estaSaludable (Gimnasta 0 50 6) `shouldBe` True
        it "Un gimnasta con tonificación menor o igual a 5 que es obeso no está saludable" $ do
            estaSaludable (Gimnasta 0 150 5) `shouldBe` False
        it "Un gimnasta con tonificación mayor a 5 que es obeso no está saludable" $ do
            estaSaludable (Gimnasta 0 200 6) `shouldBe` False

    describe "Punto 2: Quemar calorias" $ do
        it "Un gimnasta que pesa 200 kilos, con 0 calorías quemadas no debe bajar de peso" $ do
            peso (quemarCalorias 0 (Gimnasta 0 200 0)) `shouldBe` 200
        it "Un gimnasta que pesa 200 kilos, con 750 calorías quemadas debe bajar 5 kilos" $ do
            peso (quemarCalorias 750 (Gimnasta 0 200 0)) `shouldBe` 195
        it "Un gimnasta de 31 años que pesa 50 kilos, con 201 calorías quemadas debe bajar 1 kilo" $ do
            peso (quemarCalorias 201 (Gimnasta 33 50 0)) `shouldBe` 49
        it "Un gimnasta de 30 años que pesa 60 kilos, con 200 calorías quemadas no debe bajar de peso" $ do
            peso (quemarCalorias 200 (Gimnasta 30 60 0)) `shouldBe` 60
        it "Un gimnasta de 30 años que pesa 50 kilos, con 201 calorías quemadas no debe bajar de peso" $ do
            peso (quemarCalorias 201 (Gimnasta 30 50 0)) `shouldBe` 50
        it "Un gimnasta de 31 años que pesa 64 kilos, con 200 calorías quemadas no debe bajar de peso" $ do
            peso (quemarCalorias 200 (Gimnasta 31 64 0)) `shouldBe` 64
        it "Un gimnasta de 30 años que pesa 50 kilos, con 4500 calorías quemadas debe bajar 3 kilos" $ do
            peso (quemarCalorias 4500 (Gimnasta 30 50 0)) `shouldBe` 47

    describe "Punto 3: Ejercicios" $ do
        describe "Levantar pesas" $ do
            it "Un gimnasta que levanta 20 kilos por 5 minutos no debe tonificar" $ do
                tonificacion (pesas 20 5 (Gimnasta 0 0 10)) `shouldBe` 10
            it "Un gimnasta que levanta 20 kilos por 10 minutos no debe tonificar" $ do
                tonificacion (pesas 20 10 (Gimnasta 0 0 10)) `shouldBe` 10
            it "Un gimnasta que levanta 20 kilos por 15 minutos debe tonificar 2 kilos" $ do
                tonificacion (pesas 20 15 (Gimnasta 0 0 10)) `shouldBe` 12
            it "Un gimnasta que levanta 100 kilos por 20 minutos debe tonificar 10 kilos" $ do
                tonificacion (pesas 100 20 (Gimnasta 0 0 10)) `shouldBe` 20

        describe "Ejercicios en cinta" $ do
            describe "Caminata" $ do
                it "Un gimnasta que pesa 200 kilos y que hace caminata en cinta por 60 minutos debe quemar 300 calorías y bajar 2 kilos" $ do
                    peso (caminataEnCinta 60 (Gimnasta 0 200 0)) `shouldBe` 198
                it "Un gimnasta de 35 años que pesa 50 kilos y que hace caminata en cinta por 60 minutos debe quemar 300 calorías y bajar 1 kilo" $ do
                    peso (caminataEnCinta 60 (Gimnasta 35 50 0)) `shouldBe` 49
                it "Un gimnasta de 20 años que pesa 50 kilos y que hace caminata en cinta por 600 minutos debe quemar 3000 calorías y bajar 3 kilos" $ do
                    peso (caminataEnCinta 600 (Gimnasta 20 50 0)) `shouldBe` 47

            describe "Entrenamiento" $ do
                it "Un gimnasta que pesa 2000 kilos y que hace entrenamiento en cinta por 1500 minutos debe quemar 234000 calorías y bajar 1560 kilos" $ do
                    peso (entrenamientoEnCinta 1500 (Gimnasta 0 2000 0)) `shouldBe` 440
                it "Un gimnasta de 35 años que pesa 50 kilos y que hace entrenamiento en cinta por 30 minutos debe quemar 270 calorías y bajar 1 kilo" $ do
                    peso (entrenamientoEnCinta 30 (Gimnasta 35 50 0)) `shouldBe` 49
                it "Un gimnasta de 20 años que pesa 54 kilos y que hace entrenamiento en cinta por 120 minutos debe quemar 2160 calorías y bajar 2 kilos" $ do
                    peso (entrenamientoEnCinta 120 (Gimnasta 20 54 0)) `shouldBe` 52

        describe "Escalar" $ do
            describe "Colina" $ do
                it "Un gimnasta que pesa 200 kilos y que escala por 50 minutos una colina de 3 grados de pendiente debe quemar 300 calorías y bajar 2 kilos" $ do
                    peso (colina 50 3 (Gimnasta 0 200 0)) `shouldBe` 198
                it "Un gimnasta de 35 años que pesa 50 kilos y que escala por 50 minutos una colina de 3 grados de pendiente debe quemar 300 calorías y bajar 1 kilo" $ do
                    peso (colina 50 3 (Gimnasta 35 50 0)) `shouldBe` 49
                it "Un gimnasta de 20 años que pesa 50 kilos y que escala por 125 minutos una colina de 12 grados de pendiente debe quemar 3000 calorías y bajar 3 kilos" $ do
                    peso (colina 125 12 (Gimnasta 20 50 0)) `shouldBe` 47

            describe "Montaña" $ do
                it "Un gimnasta que pesa 200 kilos y que escala por 150 minutos una montaña de 1 grado de pendiente inicial, en la primera colina debe quemar 150 calorías y bajar 1 kilo y en la segunda colina debe quemar 600 calorías y bajar 4 kilos, en total bajando 5 kilos e incrementando en una unidad su tonificación" $ do
                    peso (montania 150 1 (Gimnasta 0 200 10)) `shouldBe` 195
                    tonificacion (montania 60 3 (Gimnasta 35 50 10)) `shouldBe` 11
                it "Un gimnasta de 35 años que pesa 102 kilos y que escala por 150 minutos una montaña de 2 grados de pendiente inicial, en la primera colina debe quemar 300 calorías y bajar 2 kilos y en la segunda colina debe quemar 750 calorías y bajar 1 kilo, en total bajando 3 kilos e incrementando en una unidad su tonificación" $ do
                    peso (montania 150 2 (Gimnasta 35 102 10)) `shouldBe` 99
                    tonificacion (montania 60 3 (Gimnasta 35 50 10)) `shouldBe` 11
                it "Un gimnasta de 30 años que pesa 117 kilos y que escala por 150 minutos una montaña de 17 grados de pendiente inicial, en la primera colina debe quemar 2550 calorías y bajar 17 kilos y en la segunda colina debe quemar 3000 calorías y bajar 1 kilo, en total bajando 18 kilos e incrementando en una unidad su tonificación" $ do
                    peso (montania 150 17 (Gimnasta 30 117 10)) `shouldBe` 99
                    tonificacion (montania 60 3 (Gimnasta 35 50 10)) `shouldBe` 11
                it "Un gimnasta de 35 años que pesa 50 kilos y que escala por 150 minutos una montaña de 2 grados de pendiente inicial, en la primera colina debe quemar 300 calorías y bajar 1 kilo y en la segunda colina debe quemar 750 calorías y bajar 1 kilo, en total bajando 2 kilos e incrementando en una unidad su tonificación" $ do
                    peso (montania 150 2 (Gimnasta 35 50 10)) `shouldBe` 48
                    tonificacion (montania 60 3 (Gimnasta 35 50 10)) `shouldBe` 11
                it "Un gimnasta de 20 años que pesa 50 kilos y que escala por 1000 minutos una montaña de 1 grado de pendiente inicial, en la primera colina debe quemar 1000 calorías y bajar 1 kilo y en la segunda colina debe quemar 4000 calorías y bajar 4 kilos, en total bajando 5 kilos e incrementando en una unidad su tonificación" $ do
                    peso (montania 1000 1 (Gimnasta 20 50 10)) `shouldBe` 45
                    tonificacion (montania 60 3 (Gimnasta 35 50 10)) `shouldBe` 11
                it "Un gimnasta de 35 años que pesa 50 kilos y que escala por 60 minutos una montaña de 3 grados de pendiente inicial, en la primera colina debe quemar 180 calorías y no bajar ningún kilo y en la segunda colina debe quemar 360 calorías y bajar 1 kilo, en total bajando 1 kilo e incrementando en una unidad su tonificación" $ do
                    peso (montania 60 3 (Gimnasta 35 50 10)) `shouldBe` 49
                    tonificacion (montania 60 3 (Gimnasta 35 50 10)) `shouldBe` 11