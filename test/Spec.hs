import Library
import Test.Hspec

main :: IO ()
main = hspec $ do
    describe "Precalentamiento" $ do
        it "El ejercicio relax no impacta al gimnasta" $ do
           relax 60 gimnastaDePrueba `shouldBe` gimnastaDePrueba

    describe "Punto 1: Gimnastas saludables" $ do
        it "Un gimnasta que pesa más de 100 kilos es obeso" $ do
            -- Cambiar esto por la consulta y el valor esperado real
            esObeso (Gimnasta 0 200 50) `shouldBe` True
        it "Un gimnasta que pesa menos de 100 kilos no es obeso" $ do
            -- Cambiar esto por la consulta y el valor esperado real
            esObeso (Gimnasta 0 50 2) `shouldBe` False
        it "Un gimnasta con tonificación menor a 5 que no es obeso no está saludable" $ do
            -- Cambiar esto por la consulta y el valor esperado real
            estaSaludable (Gimnasta 0 50 4) `shouldBe` False
        it "Un gimnasta con tonificación mayor a 5 que no es obeso está saludable" $ do
            -- Cambiar esto por la consulta y el valor esperado real
            estaSaludable (Gimnasta 0 50 6) `shouldBe` True
        it "Un gimnasta con tonificación menor a 5 que es obeso no está saludable" $ do
            -- Cambiar esto por la consulta y el valor esperado real
            estaSaludable (Gimnasta 0 150 3) `shouldBe` False
        it "Un gimnasta con tonificación mayor a 5 que es obeso no está saludable" $ do
            -- Cambiar esto por la consulta y el valor esperado real
            estaSaludable (Gimnasta 0 200 6) `shouldBe` False

        describe "Punto 2: Quemar calorias" $ do
            it "Un gimnasta obeso de 200 kilos con 149 calorías quemadas no debe bajar de peso" $ do
                -- Cambiar esto por la consulta y el valor esperado real
                peso (quemarCalorias (Gimnasta 0 200 0) 149) `shouldBe` 200
            it "Un gimnasta obeso de 200 kilos con 150 calorías quemadas debe bajar 1 kilo" $ do
                -- Cambiar esto por la consulta y el valor esperado real
                peso (quemarCalorias (Gimnasta 0 200 0) 150) `shouldBe` 199
            it "Un gimnasta no obeso de 33 años y 50 kilos con 300 calorías quemadas debe bajar 1 kilo" $ do
                -- Cambiar esto por la consulta y el valor esperado real
                peso (quemarCalorias (Gimnasta 33 50 0) 300) `shouldBe` 49
            it "Un gimnasta no obeso de 30 años y 50 kilos con 3000 calorías quemadas debe bajar 2 kilos" $ do
                -- Cambiar esto por la consulta y el valor esperado real
                peso (quemarCalorias (Gimnasta 30 50 0) 3000) `shouldBe` 48

        describe "Punto 3: Ejercicios" $ do
            it "Un gimnasta que levanta 20 kilos por 5 minutos no debe tonificar" $ do
                -- Cambiar esto por la consulta y el valor esperado real
                coefDeTonific (pesas (Gimnasta 0 0 10) 20 5) `shouldBe` 10
            it "Un gimnasta que levanta 20 kilos por 10 minutos no debe tonificar" $ do
                -- Cambiar esto por la consulta y el valor esperado real
                coefDeTonific (pesas (Gimnasta 0 0 10) 20 10) `shouldBe` 10
            it "Un gimnasta que levanta 100 kilos por 15 minutos debe tonificar 10 kilos" $ do
                -- Cambiar esto por la consulta y el valor esperado real
                coefDeTonific (pesas (Gimnasta 0 0 10) 100 15) `shouldBe` 20
--
            it "Un gimnasta de 100 kilos que hace caminata en cinta por 30 minutos debe quemar 150 calorías" $ do
                -- Cambiar esto por la consulta y el valor esperado real
                peso (caminataEnCinta (Gimnasta 0 200 0) 30) `shouldBe` 199
            it "Un gimnasta de 100 kilos que hace caminata en cinta por 60 minutos debe quemar 300 calorías" $ do
                -- Cambiar esto por la consulta y el valor esperado real
                peso (caminataEnCinta (Gimnasta 0 200 0) 60) `shouldBe` 198)
--