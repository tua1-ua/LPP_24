import Foundation

struct Color {
    let rojo, verde, azul: Double
    init(blanco:Double) {
        rojo = blanco
        verde = blanco
        azul = blanco
    }
}
let magenta = Color(rojo:1.0, verde:0.0, azul:1.0)

/* 
    La respuesta es la C, puesto que ya no podremos usar memberwise al declarar nuestro inicializador
*/